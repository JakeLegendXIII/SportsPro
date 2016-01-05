Imports Microsoft.VisualBasic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.OleDb

<DataObject(True)>
Public Class IncidentDB

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Function GetOpenTechIncidents(ByVal techID As Integer) As IEnumerable
        Dim con As New OleDbConnection(TechSupportDB.GetConnectionString)
        Dim sel As String = "SELECT DateOpened, ProductCode, Name " &
            "FROM Incidents INNER JOIN Customers " &
            "ON Incidents.CustomerID = Customers.CustomerID " &
            "WHERE DateClosed IS NULL " &
            "AND TechID = @TechID " &
            "ORDER BY DateOpened"
        Dim cmd As New OleDbCommand(sel, con)
        cmd.Parameters.AddWithValue("TechID", techID)
        con.Open()
        Dim rdr As OleDbDataReader =
            cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr

    End Function

    <DataObjectMethod(DataObjectMethodType.Select)>
    Public Shared Function GetCustomerIncidents(ByVal CustomerID As Integer) _
            As IEnumerable
        Dim con As New OleDbConnection(TechSupportDB.GetConnectionString)
        Dim sel As String = "SELECT IncidentID, ProductCode, " &
                            "DateOpened, DateClosed, Title, Description " &
                            "FROM Incidents " &
                            "WHERE CustomerID = @CustomerID " &
                            "AND TechID IS NOT NULL"
        Dim cmd As New OleDbCommand(sel, con)
        cmd.Parameters.AddWithValue("CustomerID", CustomerID)
        con.Open()
        Dim rdr As OleDbDataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)
        Return rdr
    End Function

    <DataObjectMethod(DataObjectMethodType.Update)>
    Public Shared Function UpdateIncident(
            ByVal original_Incident As Incident,
            ByVal incident As Incident) As Integer
        Dim con As New OleDbConnection(TechSupportDB.GetConnectionString)
        Dim up As String = "UPDATE Incidents " &
                           "SET DateClosed = @DateClosed, " &
                           "Description = @Description " &
                           "WHERE IncidentID = @original_IncidentID " &
                           "AND ProductCode = @original_ProductCode " &
                           "AND DateOpened = @original_DateOpened " &
                           "AND (DateClosed = @original_DateClosed " &
                           "OR DateClosed IS NULL " &
                           "AND @original_DateClosed IS NULL) " &
                           "AND Title = @original_Title " &
                           "AND Description = @original_Description"
        Dim cmd As New OleDbCommand(up, con)
        If incident.DateClosed = #12:00:00 AM# Then
            cmd.Parameters.AddWithValue("DateClosed", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("DateClosed", incident.DateClosed)
        End If
        cmd.Parameters.AddWithValue("Description", incident.Description)
        cmd.Parameters.AddWithValue("original_IncidentID", original_Incident.IncidentID)
        cmd.Parameters.AddWithValue("original_ProductCode", original_Incident.ProductCode)
        cmd.Parameters.AddWithValue("original_DateOpened", original_Incident.DateOpened)
        If original_Incident.DateClosed = #12:00:00 AM# Then
            cmd.Parameters.AddWithValue("original_DateClosed", DBNull.Value)
        Else
            cmd.Parameters.AddWithValue("original_DateClosed", original_Incident.DateClosed)
        End If
        cmd.Parameters.AddWithValue("original_Title", original_Incident.Title)
        cmd.Parameters.AddWithValue("original_Description", original_Incident.Description)
        con.Open()
        Dim i As Integer = cmd.ExecuteNonQuery()
        con.Close()
        Return i
    End Function

End Class
