<%@ Page Title="Tech Maint." Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TechnicianMaintenance.aspx.vb" Inherits="SportsPro.TechnicianMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:SqlDataSource ID="dbTechnicians" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [Name]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dbTechDetails" runat="server" 
            ConflictDetection="OverwriteChanges" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = ? AND [Name] = ? AND [Email] = ? AND [Phone] = ?" 
            InsertCommand="INSERT INTO [Technicians] ([TechID], [Name], [Email], [Phone]) VALUES (?, ?, ?, ?)"   
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = ?) ORDER BY [Name]"
            UpdateCommand="UPDATE [Technicians] SET [Name] = ?, [Email] = ?, [Phone] = ? WHERE [TechID] = ? AND [Name] = ? AND [Email] = ? AND [Phone] = ?" OldValuesParameterFormatString="original_{0}">   
             <SelectParameters>
                <asp:ControlParameter ControlID="ddlTechnicians" Name="TechID"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_TechID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TechID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TechID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="original_TechID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

     <asp:Label ID="Label1" runat="server" Text="Select a technician: "></asp:Label>
       <asp:DropDownList ID="ddlTechnicians" runat="server" DataSourceID="dbTechnicians" 
            DataTextField="Name" DataValueField="TechID" Width="150px" 
            AutoPostBack="True"></asp:DropDownList>
    <br /><br />
    <div style="padding-left:25px;float:left;width:250px;">
        <asp:FormView ID="FormView1" DataKeyNames="TechID" runat="server" CellPadding="4" DataSourceID="dbTechDetails" ForeColor="#333333">
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                Tech ID:
                <asp:Label ID="TechIDLabel" runat="server"
                    text='<%# Eval("TechID")%>' /><br />
                 Name:
                <asp:Label ID="NameLabel" runat="server"
                    text='<%# Eval("Name")%>' /><br />
                 Email:
                <asp:Label ID="EmailLabel" runat="server"
                    text='<%# Eval("Email")%>' /><br />
                 Phone:
                <asp:Label ID="PhoneLabel" runat="server"
                    text='<%# Eval("Phone")%>' /><br />

                    <asp:LinkButton ID="EditButton" runat="server"
                     CausesValidation="False" CommandName="Edit"
                     Text="Edit">
                  </asp:LinkButton>
                  <asp:LinkButton ID="DeleteButton" runat="server"
                    CausesValidation="False" CommandName="Delete"
                    Text="Delete">
                 </asp:LinkButton>
                <asp:LinkButton ID="NewButton" runat="server"
                    CausesValidation="False" CommandName="New"
                    Text="New">
                </asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                 Tech ID:
                <asp:Label ID="TechIDLbl" runat="server"
                    text='<%# Eval("TechID")%>' /><br />
                 Name:
                <asp:TextBox ID="NameEditTextBox" runat="server"
                    text='<%# Eval("Name")%>' />
                <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" 
                    runat="server" ControlToValidate="NameEditTextBox" ErrorMessage="Name is required" 
                    ValidationGroup="Edit" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                 Email:
                <asp:TextBox ID="EmailEditTextBox" runat="server"
                    text='<%# Eval("Email")%>' />
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" 
                    runat="server" ControlToValidate="EmailEditTextBox" ErrorMessage="Email is required" 
                    ValidationGroup="Edit" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                 Phone:
                <asp:TextBox ID="PhoneEditTextBox" runat="server"
                    text='<%# Eval("Phone")%>' />
                <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" 
                    runat="server" ControlToValidate="PhoneEditTextBox" ErrorMessage="Phone # is required" 
                    ValidationGroup="Edit" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                <asp:LinkButton ID="UpdateButton" runat="server"
                    CausesValidation="True" ValidationGroup="Edit" CommandName="Update"
                    Text="Update">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server"
                    CausesValidation="False" CommandName="Cancel"
                    Text="Cancel">
                </asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                   Tech ID:
                <asp:TextBox ID="TechIDTextBox" runat="server"
                    text='<%# Eval("TechID")%>' /><br />
                 Name:
                <asp:TextBox ID="NameInsertTextBox" runat="server"
                    text='<%# Eval("Name")%>' />
                <asp:RequiredFieldValidator ID="NameRequiredFieldValidator2" 
                    runat="server" ControlToValidate="NameInsertTextBox" ErrorMessage="Name is required" 
                    ValidationGroup="Add" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                 Email:
                <asp:TextBox ID="EmailInsertTextBox" runat="server"
                    text='<%# Eval("Email")%>' />
                 <asp:RequiredFieldValidator ID="EmailFieldValidator1" 
                    runat="server" ControlToValidate="EmailInsertTextBox" ErrorMessage="Email is required" 
                    ValidationGroup="Add" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                 Phone:
                <asp:TextBox ID="PhoneInsertTextBox" runat="server"
                    text='<%# Eval("Phone")%>' />
                 <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator1" 
                    runat="server" ControlToValidate="PhoneInsertTextBox" ErrorMessage="Phone is required" 
                    ValidationGroup="Add" SetFocusOnError="True">*</asp:RequiredFieldValidator><br />
                <asp:LinkButton ID="InsertButton" runat="server"
                    CausesValidation="True" ValidationGroup="Add" CommandName="Insert"
                    Text="Insert">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server"
                    CausesValidation="False" CommandName="Cancel"
                    Text="Cancel">
                </asp:LinkButton>
            </InsertItemTemplate>
        </asp:FormView>
     </div>

    <div style="float:left;">
    <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please correct the following errors:"
        ValidationGroup="Edit" runat="server" />
    <asp:ValidationSummary ID="ValidationSummary2" HeaderText="Please correct the following errors:"
        ValidationGroup="Add" runat="server" />
   </div>
    <div style="clear:both;">
        <br />
        <br />
         <asp:Label ID="lblError" runat="server" ForeColor="#FF3300" EnableViewState="False"></asp:Label>
    </div>
</asp:Content>

