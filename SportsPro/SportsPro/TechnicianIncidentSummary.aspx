<%@ Page Title="Display Open Incidents" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TechnicianIncidentSummary.aspx.vb" Inherits="SportsPro.TechnicianIncidentSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblTech" runat="server" Text="Technician:"></asp:Label>

    <asp:DropDownList ID="ddlTech" runat="server" AutoPostBack="true" DataSourceID="ObjectDataSource1"
         DataTextField="Name" DataValueField="TechID">
    </asp:DropDownList>

    <asp:ObjectDataSource ID="ObjectDataSource1" 
        runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetAllTechnicians" 
        TypeName="TechnicianDB"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetOpenTechIncidents" TypeName="IncidentDB">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTech" Name="techID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ObjectDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
          <Columns>
             <asp:BoundField DataField="DateOpened" HeaderText="Date Opened" dataformatstring="{0:MM/d/yyyy}" htmlencode="false">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProductCode" HeaderText="Product" ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Customer" ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
            </asp:BoundField>
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
   
</asp:Content>
