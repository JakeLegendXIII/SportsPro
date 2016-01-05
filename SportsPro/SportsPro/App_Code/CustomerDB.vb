Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.OleDb

<DataObject(True)>
Public Class CustomerDB

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Shared Function GetCustomersWithIncidents() As IEnumerable
        Dim con As New OleDbConnection(TechSupportDB.GetConnectionString)
        Dim sel As String = "SELECT CustomerID, Name FROM Customers WHERE CustomerID IN " &
            "(SELECT DISTINCT CustomerID FROM Incidents WHERE TechID IS NOT NULL) ORDER BY Name"
        Dim cmd As New OleDbCommand(sel, con)
        con.Open()
        Dim rdr As OleDbDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function
End Class
