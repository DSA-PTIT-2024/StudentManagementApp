#ifndef OVERVIEWCONTROLLER_H
#define OVERVIEWCONTROLLER_H

#include "datatableprovider.h"
#include "sortedmethodselections.h"
#include "sortfiltertablemodel.h"
#include "storagedstructureselections.h"
#include "student.h"
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QUrl>
#include <memory>
namespace Models
{
class OverviewController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    Q_PROPERTY(int rowCount READ RowCount NOTIFY rowCountChanged)
    Q_PROPERTY(QAbstractTableModel* tableModel READ GetTableModel NOTIFY dataProviderChanged)
    Q_PROPERTY(QSortFilterProxyModel* sortFilterModel READ GetSortFilterModel NOTIFY dataProviderChanged)
  public:
    explicit OverviewController(QObject* parent = nullptr);

    int RowCount() const;

    QAbstractTableModel* GetTableModel() const;
    QSortFilterProxyModel* GetSortFilterModel() const;
  signals:

    void dataProviderChanged();
    void rowCountChanged();
    void errorOccured(const QString& error);
    void existedStudent(const QString& idStudent);
    void searchingTimeChanged(const QString& time);
    void sortingTimeChanged(const QString& time);
    void sendingDataToStatisticTab(const QList<Student>& students);
    void savingDataToLocalStorage(const QUrl& urlPath, const QList<Student>& students);

  public slots:

    void setStructureType(StorageStructures::StructureTypes structureType);
    void addStudent(const QString& idStudent, const QString& lastName, const QString& firstName, const QString& idClass,
                    const QString& score);
    void removeStudent(int row);
    void clearData();
    void updateStudent(int row, const QString& idStudent, const QString& lastName, const QString& firstName,
                       const QString& idClass, const QString& score);

    void searchStudent(const QString& filterString);

    void getDataFromXlsx(const QList<Student>& students);

    void sendDataToStatisticTab();

    void saveDataToXlsx(const QUrl& dirPath);

    void saveData();

    void sortColumn(int column, SortMethods::SortTypes sortType, Qt::SortOrder order);

  private:
    std::unique_ptr<DataTableProvider> _currentDataProvider;
    std::unique_ptr<SortFilterTableModel> _sortFilterModel;

    // Internal methods to validate student data
    bool IsExistedStudent(const Student& studentData);
    void ValidateStudentData(const Student& studentData);

    // Internal methods to set structure type
    void SetStructureTypeInternal(StorageStructures::StructureTypes structureType);
    void LetMoveDataToNewModel(QAbstractTableModel* oldModel, QAbstractTableModel* newModel);

    // Internal methods to add, remove, update student
    void AddStudentInternal(const Student& studentData);
    void RemoveStudentInternal(int row);
    void ClearDataInternal();
    void UpdateStudentInternal(const Student& studentData);
    void SortColumnInternal(int column, SortMethods::SortTypes sortType, Qt::SortOrder order);

    // dummy function init
    void InitializeDummyData();

    QList<Student> getDataFromTable();
};

} // namespace Models

#endif // OVERVIEWCONTROLLER_H
