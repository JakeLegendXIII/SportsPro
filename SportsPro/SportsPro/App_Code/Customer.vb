Imports Microsoft.VisualBasic

Public Class Customer
    Public Property CustomerID As String
    Public Property Name As String
    Public Property Address As String
    Public Property City As String
    Public Property State As String
    Public Property ZipCode As String
    Public Property Phone As String
    Public Property Email As String

    Public Function ContactDisplay() As String
        'Dim displayString As String = Name &
        '    ": " & Phone & ": " &
        '    Email
        Dim displayString = Name + ": " + Phone + ": " + Email
        Return displayString
    End Function
End Class
