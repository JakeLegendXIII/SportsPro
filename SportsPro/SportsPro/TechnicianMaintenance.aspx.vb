Public Class TechnicianMaintenance
    Inherits System.Web.UI.Page

    Private Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occured. " &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that technician. " &
                "Please try again."
        Else
            FormView1.DataBind()
        End If
    End Sub

    Private Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occured. " &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that technician. " &
                "Please try again."
        Else
            FormView1.DataBind()
        End If
    End Sub

    Private Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = "A database error has occured. " &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            lblError.Text = "Another user may have updated that technician. " &
                "Please try again."
        Else
            FormView1.DataBind()
        End If
    End Sub
End Class