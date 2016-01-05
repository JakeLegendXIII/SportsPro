Imports Microsoft.VisualBasic

Public Class TechSupportDB

    Public Shared Function GetConnectionString() As String
        Return ConfigurationManager.ConnectionStrings(
            "ConnectionString").ConnectionString
    End Function

End Class
