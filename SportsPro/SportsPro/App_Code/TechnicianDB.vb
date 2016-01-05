Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.OleDb

<DataObject(True)>
Public Class TechnicianDB

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Shared Function GetAllTechnicians() As IEnumerable
        Dim con As New OleDbConnection(TechSupportDB.GetConnectionString)
        Dim sel As String = "SELECT TechID, Name " &
            "FROM Technicians ORDER BY Name"
        Dim cmd As New OleDbCommand(sel, con)
        con.Open()
        Dim rdr As OleDbDataReader =
            cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

End Class
