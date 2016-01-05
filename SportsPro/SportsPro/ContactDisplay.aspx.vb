Partial Class ContactDisplay
    Inherits System.Web.UI.Page

    Private customer As CustomerList

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        customer = CustomerList.GetCustomer
        If Not IsPostBack Then
            Me.DisplayContact()
        End If
    End Sub

    Private Sub DisplayContact()
        lstContact.Items.Clear()
        Dim cust As Customer
        For i = 0 To customer.Count - 1
            cust = customer(i)
            lstContact.Items.Add(cust.ContactDisplay)
        Next
    End Sub

    Protected Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
        If customer.Count > 0 Then
            If lstContact.SelectedIndex > -1 Then
                customer.RemoveAT(lstContact.SelectedIndex)
                Me.DisplayContact()
            Else
                lblMessage.Text = "Error: Please select the item you want to remove"
            End If
        End If
    End Sub


    Protected Sub btnEmpty_Click(sender As Object, e As EventArgs) Handles btnEmpty.Click
        If customer.Count > 0 Then
            customer.Clear()
            lstContact.Items.Clear()
        End If
    End Sub
End Class