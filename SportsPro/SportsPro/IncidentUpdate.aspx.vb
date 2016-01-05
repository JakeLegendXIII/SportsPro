Public Class IncidentUpdate
    Inherits System.Web.UI.Page

    Private Sub GridView1_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            lblErrors.Text = "A database error has occurred.<br /><br />" &
                e.Exception.Message
            If e.Exception.InnerException IsNot Nothing Then
                lblErrors.Text &= "<br />Message: " &
                    e.Exception.InnerException.Message
            End If
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblErrors.Text = "Another user may have updated that Incident." &
                "<br />Please try again."
        End If
    End Sub
End Class