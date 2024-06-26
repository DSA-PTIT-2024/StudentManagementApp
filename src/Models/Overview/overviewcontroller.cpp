#include "overviewcontroller.h"
#include "appenviroment.h"
#include "clisttablemodel.h"
#include "datatableprovider.h"
#include "dlisttablemodel.h"
#include "qfileinfo.h"
#include "slisttablemodel.h"
#include "sortfiltertablemodel.h"
#include "storagedstructureselections.h"
#include "vectortablemodel.h"
#include <Commons/studentvalidator.h>
#include <QFile>
#include <QObject>
#include <chrono>

namespace Models
{

OverviewController::OverviewController(QObject* parent) : QObject(parent)
{
    std::unique_ptr<VectorTableModel> model = std::make_unique<VectorTableModel>(this);
    _currentDataProvider =
        std::make_unique<DataTableProvider>(std::move(model), StorageStructures::StructureTypes::Vector);
    _sortFilterModel = std::make_unique<SortFilterTableModel>(this);
    _sortFilterModel->setSourceModel(_currentDataProvider->GetTableModel());
    // InitializeDummyData();
}

int OverviewController::RowCount() const
{
    return _currentDataProvider->GetTableModel()->rowCount();
}

QAbstractTableModel* OverviewController::GetTableModel() const
{
    return _currentDataProvider->GetTableModel();
}

QSortFilterProxyModel* OverviewController::GetSortFilterModel() const
{
    return _sortFilterModel.get();
}

void OverviewController::setStructureType(StorageStructures::StructureTypes structureType)
{
    if (_currentDataProvider->GetStructureType() == structureType)
    {
        return;
    }
    try
    {
        this->SetStructureTypeInternal(structureType);
        emit dataProviderChanged();
    }
    catch (const std::invalid_argument& e)
    {
        emit errorOccured(e.what());
    }
    catch (...)
    {
        emit errorOccured("Unknown error occured");
    }
}

void OverviewController::addStudent(const QString& idStudent, const QString& lastName, const QString& firstName,
                                    const QString& idClass, const QString& score)
{
    Models::Student studentData(idStudent, lastName, firstName, idClass, score);
    try
    {
        ValidateStudentData(studentData);
        if (!IsExistedStudent(studentData))
        {
            AddStudentInternal(studentData);
            emit rowCountChanged();
        }
        else
        {
            emit existedStudent(idStudent);
        }
    }
    catch (const std::invalid_argument& e)
    {
        emit errorOccured(e.what());
    }
    catch (...)
    {
        emit errorOccured("Unknown error occured");
    }
}
void OverviewController::removeStudent(int row)
{
    try
    {
        if (row < 0 || row >= _currentDataProvider->GetTableModel()->rowCount())
        {
            emit errorOccured("Invalid row");
            return;
        }
        this->RemoveStudentInternal(row);
        emit rowCountChanged();
    }
    catch (const std::invalid_argument& e)
    {
        emit errorOccured(e.what());
    }
    catch (...)
    {
        emit errorOccured("Unknown error occured");
    }
}

void OverviewController::clearData()
{
    try
    {
        if (_currentDataProvider->GetTableModel()->rowCount() == 0)
        {
            return;
        }

        ClearDataInternal();
    }
    catch (const std::exception& e)
    {
        emit errorOccured(e.what());
    }
}

void OverviewController::ClearDataInternal()
{
    try
    {
        _currentDataProvider->GetTableModel()->removeRows(0, _currentDataProvider->GetTableModel()->rowCount());
        emit rowCountChanged();
    }
    catch (const std::exception& e)
    {
        throw e;
    }
}

void OverviewController::updateStudent(int row, const QString& idStudent, const QString& lastName,
                                       const QString& firstName, const QString& idClass, const QString& score)
{
    try
    {
        Q_UNUSED(row);
        Student studentData(idStudent, lastName, firstName, idClass, score);
        ValidateStudentData(studentData);
        if (!IsExistedStudent(studentData))
        {
            emit errorOccured("Student doesn't exists");
            return;
        }
        UpdateStudentInternal(studentData);
    }
    catch (const std::invalid_argument& e)
    {
        emit errorOccured(e.what());
    }
    catch (...)
    {
        emit errorOccured("Unknown error occured");
    }
}

void OverviewController::searchStudent(const QString& filterString)
{
    auto start = std::chrono::high_resolution_clock::now();
    auto filter = QRegularExpression(filterString, QRegularExpression::CaseInsensitiveOption |
                                                       QRegularExpression::DotMatchesEverythingOption);
    this->GetSortFilterModel()->setFilterRegularExpression(filter);
    auto end = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);

    emit searchingTimeChanged(QString::number(duration.count()));
}

void OverviewController::getDataFromXlsx(const QList<Student>& students)
{
    try
    {
        for (const auto& student : students)
        {
            if (!IsExistedStudent(student))
            {
                AddStudentInternal(student);
            }
        }
        emit rowCountChanged();
    }
    catch (const std::invalid_argument& e)
    {
        emit errorOccured(e.what());
    }
    catch (...)
    {
        emit errorOccured("Unknown error occured");
    }
}

void OverviewController::sendDataToStatisticTab()
{
    auto students = this->getDataFromTable();

    emit sendingDataToStatisticTab(students);
}

void OverviewController::saveDataToXlsx(const QUrl& urlPath)
{
    try
    {
        if (QFileInfo(urlPath.toLocalFile()).suffix() != "xlsx")
        {
            emit errorOccured("Invalid file format");
            return;
        }

        auto students = this->getDataFromTable();
        emit savingDataToLocalStorage(urlPath, students);
    }
    catch (const std::exception& e)
    {
        emit errorOccured(e.what());
    }
}

void OverviewController::saveData()
{
    try
    {
        auto students = this->getDataFromTable();
        emit savingDataToLocalStorage(QUrl::fromLocalFile(QString(Commons::AppEnviroment::pathData().c_str())),
                                      students);
    }
    catch (const std::exception& e)
    {
        emit errorOccured(e.what());
    }
}

void OverviewController::sortColumn(int column, SortMethods::SortTypes sortType, Qt::SortOrder order)
{
    try
    {
        auto start = std::chrono::high_resolution_clock::now();
        this->SortColumnInternal(column, sortType, order);
        auto end = std::chrono::high_resolution_clock::now();

        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);

        emit sortingTimeChanged(QString::number(duration.count()));
    }
    catch (const std::exception& e)
    {
        emit errorOccured(e.what());
    }
}

bool OverviewController::IsExistedStudent(const Student& studentData)
{
    auto rowCount = _currentDataProvider->GetTableModel()->rowCount();

    if (rowCount == 0)
    {
        return false;
    }

    for (int i = 0; i < rowCount; ++i)
    {
        auto index = _currentDataProvider->GetTableModel()->index(i, 0);
        if (studentData.GetIdStudent() == index.data().toString())
        {
            return true;
        }
    }
    return false;
}

void OverviewController::ValidateStudentData(const Student& studentData)
{
    if (!Commons::StudentValidator::ValidateStudentId((studentData.GetIdStudent())))
    {
        throw std::invalid_argument("Invalid student id");
    }
    if (!Commons::StudentValidator::ValidateStudentFirstName((studentData.GetFirstName())))
    {
        throw std::invalid_argument("Invalid student first name");
    }
    if (!Commons::StudentValidator::ValidateStudentLastName((studentData.GetLastName())))
    {
        throw std::invalid_argument("Invalid student last name");
    }
    if (!Commons::StudentValidator::ValidateStudentIdClass((studentData.GetIdClass())))
    {
        throw std::invalid_argument("Invalid student id class");
    }
    if (!Commons::StudentValidator::ValidateStudentScore((studentData.GetScore())))
    {
        throw std::invalid_argument("Invalid student score");
    }
}

void OverviewController::SetStructureTypeInternal(StorageStructures::StructureTypes structureType)
{
    switch (structureType)
    {
    case StorageStructures::StructureTypes::Vector: {
        auto newModel = std::make_unique<VectorTableModel>(this);
        LetMoveDataToNewModel(_currentDataProvider->GetTableModel(),
                              qobject_cast<QAbstractTableModel*>(newModel.get()));
        _currentDataProvider->SetTableModel(std::move(newModel), structureType);
        _sortFilterModel->setSourceModel(_currentDataProvider->GetTableModel());
        break;
    }
    case StorageStructures::StructureTypes::SList: {
        auto newModel = std::make_unique<SListTableModel>(this);
        LetMoveDataToNewModel(_currentDataProvider->GetTableModel(),
                              qobject_cast<QAbstractTableModel*>(newModel.get()));
        _currentDataProvider->SetTableModel(std::move(newModel), structureType);
        _sortFilterModel->setSourceModel(_currentDataProvider->GetTableModel());
        break;
    }
    case StorageStructures::StructureTypes::DList: {
        auto newModel = std::make_unique<DListTableModel>(this);
        LetMoveDataToNewModel(_currentDataProvider->GetTableModel(),
                              qobject_cast<QAbstractTableModel*>(newModel.get()));
        _currentDataProvider->SetTableModel(std::move(newModel), structureType);
        _sortFilterModel->setSourceModel(_currentDataProvider->GetTableModel());
        break;
    }

    case StorageStructures::StructureTypes::CList: {
        auto newModel = std::make_unique<CListTableModel>(this);
        LetMoveDataToNewModel(_currentDataProvider->GetTableModel(),
                              qobject_cast<QAbstractTableModel*>(newModel.get()));
        _currentDataProvider->SetTableModel(std::move(newModel), structureType);
        _sortFilterModel->setSourceModel(_currentDataProvider->GetTableModel());
        break;
    }
    default:
        throw std::invalid_argument("Unknown structure type");
        break;
    }
}

void OverviewController::LetMoveDataToNewModel(QAbstractTableModel* oldModel, QAbstractTableModel* newModel)
{
    auto currentRow = oldModel->rowCount();
    auto currentColumn = oldModel->columnCount();
    for (int i = 0; i < currentRow; ++i)
    {
        newModel->insertRow(i);
        for (int j = 0; j < currentColumn; ++j)
        {
            auto data = oldModel->index(i, j);
            newModel->setData(data, oldModel->data(data));
        }
    }
}

void OverviewController::AddStudentInternal(const Student& studentData)
{
    try
    {
        int row;

        if (_currentDataProvider->GetStructureType() == StorageStructures::StructureTypes::Vector)
        {
            row = _currentDataProvider->GetTableModel()->rowCount();
        }
        else
        {
            row = 0;
        }

        _currentDataProvider->GetTableModel()->insertRow(row);

        for (int i = 0; i < _currentDataProvider->GetTableModel()->columnCount(); ++i)
        {
            auto index = _currentDataProvider->GetTableModel()->index(row, i);
            switch (i)
            {
            case 0:
                _currentDataProvider->GetTableModel()->setData(index, (studentData.GetIdStudent()));
                break;
            case 1:
                _currentDataProvider->GetTableModel()->setData(index, (studentData.GetLastName()));
                break;
            case 2:
                _currentDataProvider->GetTableModel()->setData(index, (studentData.GetFirstName()));
                break;
            case 3:
                _currentDataProvider->GetTableModel()->setData(index, (studentData.GetIdClass()));
                break;
            case 4:
                _currentDataProvider->GetTableModel()->setData(index, (studentData.GetScore()));
                break;
            default:
                break;
            }
        }
    }
    catch (const std::exception& e)
    {
        throw e;
    }
}

void OverviewController::RemoveStudentInternal(int row)
{
    try
    {
        _currentDataProvider->GetTableModel()->removeRow(row);
    }
    catch (const std::exception& e)
    {
        throw e;
    }
}

void OverviewController::UpdateStudentInternal(const Student& studentData)
{
    try
    {
        auto rowCount = _currentDataProvider->GetTableModel()->rowCount();

        for (auto i = 0; i < rowCount; ++i)
        {
            auto index = _currentDataProvider->GetTableModel()->index(i, 0);
            if (studentData.GetIdStudent() == index.data().toString())
            {
                for (int j = 0; j < _currentDataProvider->GetTableModel()->columnCount(); ++j)
                {
                    auto index = _currentDataProvider->GetTableModel()->index(i, j);
                    switch (j)
                    {
                    case 0:
                        _currentDataProvider->GetTableModel()->setData(index, (studentData.GetIdStudent()));
                        break;
                    case 1:
                        _currentDataProvider->GetTableModel()->setData(index, (studentData.GetLastName()));
                        break;
                    case 2:
                        _currentDataProvider->GetTableModel()->setData(index, (studentData.GetFirstName()));
                        break;
                    case 3:
                        _currentDataProvider->GetTableModel()->setData(index, (studentData.GetIdClass()));
                        break;
                    case 4:
                        _currentDataProvider->GetTableModel()->setData(index, (studentData.GetScore()));
                        break;
                    default:
                        break;
                    }
                }
                return;
            }
        }
    }
    catch (const std::exception& e)
    {
        throw e;
    }
}

void OverviewController::SortColumnInternal(int column, SortMethods::SortTypes sortType, Qt::SortOrder order)
{
    try
    {
        auto const currentDataProvider = this->_currentDataProvider->GetStructureType();
        switch (currentDataProvider)
        {
        case StorageStructures::StructureTypes::Vector: {
            auto const temp = (VectorTableModel*)(this->_currentDataProvider->GetTableModel());
            temp->dsaSort(column, sortType, order);
            break;
        }
        case StorageStructures::StructureTypes::SList: {
            auto const temp = (SListTableModel*)(this->_currentDataProvider->GetTableModel());
            temp->dsaSort(column, sortType, order);
            break;
        }
        case StorageStructures::StructureTypes::DList: {
            auto const temp = (DListTableModel*)(this->_currentDataProvider->GetTableModel());
            temp->dsaSort(column, sortType, order);
            break;
        }
        case StorageStructures::StructureTypes::CList: {
            auto const temp = (CListTableModel*)(this->_currentDataProvider->GetTableModel());
            temp->dsaSort(column, sortType, order);
            break;
        }
        default:
            __builtin_unreachable();
            break;
        }
    }
    catch (const std::exception& e)
    {
        throw e;
    }
}

void OverviewController::InitializeDummyData()
{
    this->addStudent("N22DCCN159", "Nguyễn Ngọc", "Phú", "D22CQCN02-N", "9");
}

QList<Student> OverviewController::getDataFromTable()
{
    QList<Student> students;
    auto rowCount = _currentDataProvider->GetTableModel()->rowCount();
    for (int i = 0; i < rowCount; ++i)
    {
        Student student;
        for (int j = 0; j < _currentDataProvider->GetTableModel()->columnCount(); ++j)
        {
            auto index = _currentDataProvider->GetTableModel()->index(i, j);
            switch (j)
            {
            case 0:
                student.SetIdStudent(index.data().toString());
                break;
            case 1:
                student.SetLastName(index.data().toString());
                break;
            case 2:
                student.SetFirstName(index.data().toString());
                break;
            case 3:
                student.SetIdClass(index.data().toString());
                break;
            case 4:
                student.SetScore(index.data().toString());
                break;
            default:
                break;
            }
        }
        students.append(student);
    }
    return students;
}

} // namespace Models
