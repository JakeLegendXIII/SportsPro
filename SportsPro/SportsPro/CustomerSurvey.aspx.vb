Public Class CustomerSurvey
    Inherits System.Web.UI.Page

    Private incident As New Incident

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            txtCustID.Focus()
        End If
        lstIncidents.Enabled = False
        lblCategories.Enabled = False
        lblComments.Enabled = False
        txtComments.Enabled = False
        chkContact.Enabled = False
        rbrEmail.Enabled = False
        rbrPhone.Enabled = False
        rbrTechnicianEfficiency.Enabled = False
        rbrProblemResolution.Enabled = False
        btnSubmit.Enabled = False
        lblNoIncidentsFound.Enabled = False
        lblTechnicianEfficiency.Enabled = False
        lblProblemResolution.Enabled = False
        rblResponseTime.Enabled = False
        lblNoIncidentsFound.Visible = False
    End Sub

    Protected Sub btnIncidents_Click(sender As Object, e As EventArgs) Handles btnIncidents.Click
        If Page.IsValid Then
            Dim CustomerID = CType(txtCustID.Text, Integer)
            lstIncidents.Items.Clear()

            Dim IncidentTable As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
            IncidentTable.RowFilter = "DateClosed is not Null AND CustomerID= '" & CType(txtCustID.Text, Integer) & "'"
            Dim index As Integer = 0
            lstIncidents.Items.Add(New ListItem("--Select An Incident--", vbNull))
            For Each incidentRows As DataRowView In IncidentTable
                Dim incidentRow As DataRowView = IncidentTable(index)
                incident.CustomerID = incidentRow("CustomerID").ToString
                incident.IncidentID = incidentRow("IncidentID").ToString
                incident.ProductCode = incidentRow("ProductCode").ToString
                incident.TechID = incidentRow("TechID")
                incident.Title = incidentRow("Title")
                incident.DateOpened = incidentRow("DateOpened")
                incident.DateClosed = incidentRow("DateClosed")
                Session.Add("SessionIncident", incident)
                index = index + 1
                lstIncidents.Items.Add(New ListItem(incident.CustomerIncidentDisplay(), (incident.IncidentID)))
            Next

            If lstIncidents.Items.Count > 1 Then
                lstIncidents.Enabled = True
                lblCategories.Enabled = True
                lblComments.Enabled = True
                txtComments.Enabled = True
                chkContact.Enabled = True
                rbrEmail.Enabled = True
                rbrPhone.Enabled = True
                btnSubmit.Enabled = True
                lblNoIncidentsFound.Visible = False
                lblTechnicianEfficiency.Enabled = True
                lblProblemResolution.Enabled = True
                rblResponseTime.Enabled = True
                rbrTechnicianEfficiency.Enabled = True
                rbrProblemResolution.Enabled = True
                'Commented out so the Incident validation can be tested
                'lstIncidents.SelectedIndex = 1
            Else
                lstIncidents.Items.Clear()
                lblNoIncidentsFound.Visible = True
            End If
        End If
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim survey As New Survey
        survey.CustomerID = CType(txtCustID.Text.ToString, Integer)
        survey.IncidentID = lstIncidents.SelectedValue
        survey.Comments = txtComments.Text
        survey.ResponseTime = rblResponseTime.SelectedValue
        survey.TechEfficiency = rbrTechnicianEfficiency.SelectedValue
        survey.Resolution = rbrProblemResolution.SelectedValue

        Dim contact As New Boolean
        If chkContact.Checked Then
            contact = True
            If rbrEmail.Checked Then
                survey.ContactBy = "Email"
            ElseIf rbrPhone.Checked Then
                survey.ContactBy = "Phone"
            Else
                survey.ContactBy = ""
            End If
        Else
            contact = False
        End If

        Session.Add("SessionContact", contact)
        Response.Redirect("SurveyComplete.aspx")
    End Sub
End Class