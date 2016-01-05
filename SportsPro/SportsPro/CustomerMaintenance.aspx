<%@ Page Title="Maintain Customers" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomerMaintenance.aspx.vb" Inherits="SportsPro.CustomerMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid{
            float:left;
            width:400px;
        }
        .details{
            float:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="DbCustomers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT [CustomerID], [Name], [City], [State] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
    <div class="grid">
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="CustomerID"
        AllowPaging="True" SelectedIndex="0"
        AllowSorting="True" CellPadding="4" AutoGenerateColumns="false" DataSourceID="DbCustomers" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
             <asp:BoundField DataField="CustomerID" HeaderText=""
                 Visible="false" ReadOnly="true">
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name " ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="City" HeaderText="City " ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="125px" />
            </asp:BoundField>
            <asp:BoundField DataField="State" HeaderText="State " ReadOnly="true">
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
    </div>
    <div class="details">
        <asp:DetailsView ID="DetailsView1" 
            runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="CustomerID" DataSourceID="dbCustDetail" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>

        <asp:SqlDataSource ID="dbCustDetail" runat="server" ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = ? AND [Name] = ? AND [Address] = ? AND [City] = ? AND [State] = ? AND [ZipCode] = ? AND (([Phone] = ?) OR ([Phone] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL))" 
            InsertCommand="INSERT INTO [Customers] ([CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
            OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" 
            UpdateCommand="UPDATE [Customers] SET [Name] = ?, [Address] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ? WHERE [CustomerID] = ? AND [Name] = ? AND [Address] = ? AND [City] = ? AND [State] = ? AND [ZipCode] = ? AND (([Phone] = ?) OR ([Phone] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL))">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CustomerID"
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <br /><br /><br />
    <div style="clear:both;">
     <asp:Label ID="lblError" runat="server" ForeColor="#FF3300" EnableViewState="False"></asp:Label>
        </div>
</asp:Content>
