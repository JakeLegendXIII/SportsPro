Imports System.Data

Partial Class CustomerDisplay
    Inherits System.Web.UI.Page

    Private selectedCustomer As Customer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ddlCustomers.DataBind()
        End If
        selectedCustomer = Me.GetSelectedCustomer
        lblAddress.Text = selectedCustomer.Address
        lblCity.Text = selectedCustomer.City + ","
        lblState.Text = selectedCustomer.State
        lblZip.Text = selectedCustomer.ZipCode
        lblPhone.Text = selectedCustomer.Phone
        lblEmail.Text = selectedCustomer.Email
    End Sub

    Private Function GetSelectedCustomer() As Customer
        Dim customerTable As DataView = CType(SqlDataSource1.Select(
            DataSourceSelectArguments.Empty), DataView)
        customerTable.RowFilter = "CustomerID = '" & ddlCustomers.SelectedValue & "'"
        Dim customerRow As DataRowView = customerTable(0)

        Dim customer As New Customer
        With customer
            .CustomerID = customerRow("CustomerID").ToString
            .Name = customerRow("Name").ToString
            .Address = customerRow("Address").ToString
            .City = customerRow("City").ToString
            .State = customerRow("State").ToString
            .ZipCode = customerRow("ZipCode").ToString
            .Phone = customerRow("Phone").ToString
            .Email = customerRow("Email").ToString
        End With
        Return customer
    End Function


    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        If Page.IsValid Then
            Dim customer As CustomerList = CustomerList.GetCustomer
            Dim cust As Customer = customer(selectedCustomer.CustomerID)
            If cust Is Nothing Then
                customer.AddItem(selectedCustomer)
                Response.Redirect("ContactDisplay.aspx")
            Else
                lblMessage.Text = "Error: Already on the contact list"
            End If
        End If
    End Sub
End Class