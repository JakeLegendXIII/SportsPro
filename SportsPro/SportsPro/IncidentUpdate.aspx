<%@ Page Title="Update Incidents" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="IncidentUpdate.aspx.vb" Inherits="SportsPro.IncidentUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Select a customer: "></asp:Label>
    <asp:ObjectDataSource ID="ObjectDataSource1" 
        runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetCustomersWithIncidents" TypeName="CustomerDB"></asp:ObjectDataSource>
    <asp:DropDownList ID="ddlCustomer" AutoPostBack="true" DataValueField="CustomerID" DataTextField="Name"  runat="server" DataSourceID="ObjectDataSource1"></asp:DropDownList>
    <br /><br />

    <asp:GridView ID="GridView1" DataKeyNames="IncidentID" AutoGenerateColumns="false" 
        runat="server" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
         <Columns>
              <asp:BoundField DataField="IncidentID" HeaderText="ID" ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="75px" />
            </asp:BoundField>
              <asp:BoundField DataField="ProductCode" HeaderText="Product Code" ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
            </asp:BoundField>
             <asp:BoundField DataField="DateOpened" HeaderText="Date Opened" ReadOnly="true" dataformatstring="{0:MM/d/yyyy}" htmlencode="false">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
            </asp:BoundField>
              <asp:BoundField DataField="DateClosed" HeaderText="Date Closed" dataformatstring="{0:MM/d/yyyy}" htmlencode="false">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
                <ControlStyle Width="55px" />
            </asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="200px" />
            </asp:BoundField>
           <asp:TemplateField HeaderText="Description">
               <ItemTemplate>
                <asp:Label ID="Description" Width="325px" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
               </ItemTemplate>
               <EditItemTemplate>
                   <asp:TextBox ID="Description" Width="325px" runat="server" Text='<%# Bind("Description") %>'
                    TextMode="MultiLine"></asp:TextBox>
               </EditItemTemplate>
               <HeaderStyle HorizontalAlign="Left" />
               <ItemStyle Width="400px" />
            </asp:TemplateField>
             <asp:CommandField ButtonType="Button" CausesValidation="true" ShowEditButton="true" ValidationGroup="Edit" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

     <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
        DataObjectTypeName="Incident"
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetCustomerIncidents"
        TypeName="IncidentDB" 
        UpdateMethod="UpdateIncident"
        ConflictDetection="CompareAllValues">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomer" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_Incident" Type="Object" />
            <asp:Parameter Name="incident" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <br />
    <asp:Label ID="lblErrors" runat="server" Text="" Font-Bold="True" ForeColor="#FF3300"></asp:Label>

</asp:Content>
