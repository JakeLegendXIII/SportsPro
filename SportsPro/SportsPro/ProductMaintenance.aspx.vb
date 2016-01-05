Public Class ProductMaintenance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAddProduct_Click(sender As Object, e As EventArgs) Handles btnAddProduct.Click
        dbProducts.InsertParameters("ProductCode").DefaultValue = txtProductCode.Text
        dbProducts.InsertParameters("Name").DefaultValue = txtName.Text
        dbProducts.InsertParameters("Version").DefaultValue = txtVersion.Text
        dbProducts.InsertParameters("ReleaseDate").DefaultValue = txtReleaseDate.Text
        Try
            dbProducts.Insert()
            txtProductCode.Text = ""
            txtName.Text = ""
            txtVersion.Text = ""
            txtReleaseDate.Text = ""
        Catch ex As Exception
            ValidationMsgLbl.Text = "A database error has occured. " & ex.Message
        End Try
    End Sub

    Protected Sub GridView1_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        If e.Exception IsNot Nothing Then
            ValidationMsgLbl.Text = "A database error has occurred.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        ElseIf e.AffectedRows = 0 Then
            ValidationMsgLbl.Text = "Another user may have updated that Product." &
                "<br />Please try again."
        End If
    End Sub

    Private Sub GridView1_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        If e.Exception IsNot Nothing Then
            ValidationMsgLbl.Text = "A database error has occured.<br /><br />" &
                "Message: " & e.Exception.Message
            e.ExceptionHandled = True
        ElseIf e.AffectedRows = 0 Then
            ValidationMsgLbl.Text = "Another user may have updated that Product." &
                "<br />Please try again."
        End If
    End Sub
End Class