Public Class SurveyComplete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("SessionContact") Then
            lblContact.Visible = True
        Else
            lblContact.Visible = False
        End If
    End Sub
End Class