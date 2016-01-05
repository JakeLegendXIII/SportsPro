<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProductMaintenance.aspx.vb" Inherits="SportsPro.ProductMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="dbProducts" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = ? AND [Name] = ? AND [Version] = ? AND [ReleaseDate] = ?" 
        InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]" 
        UpdateCommand="UPDATE [Products] SET [Name] = ?, [Version] = ?, [ReleaseDate] = ? WHERE [ProductCode] = ? AND [Name] = ? AND [Version] = ? AND [ReleaseDate] = ?">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductCode" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Version" Type="Decimal" />
            <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            <asp:Parameter Name="original_ProductCode" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Version" Type="Decimal" />
            <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dbProducts" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
             <asp:BoundField DataField="ProductCode" HeaderText="Product Code"
                        ReadOnly="True" Visible="True">
             </asp:BoundField>
             
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGridName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server"
                        ControlToValidate="txtGridName" ErrorMessage="Name is required" ValidationGroup="Edit">*
                    </asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGridName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Version">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGridVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="VersionRequiredFieldValidator" runat="server"
                        ControlToValidate="txtGridVersion" ErrorMessage="Version is required" ValidationGroup="Edit">*
                    </asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGridVersion" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Release Date">
                <EditItemTemplate>
                <asp:TextBox ID="txtGridReleaseDate" runat="server" 
                    Columns="20" MaxLength="50" Text='<%# Bind("ReleaseDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReleaseDateRequiredFieldValidator" 
                    runat="server" ControlToValidate="txtGridReleaseDate" ErrorMessage="Release Date is required" 
                    ValidationGroup="Edit" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ReleaseDateRegExp" runat="server" ControlToValidate="txtGridReleaseDate"
                        ValidationExpression="^([0-9]{1,2})[./-]+([0-9]{1,2})[./-]+([0-9]{2}|[0-9]{4})$" 
                        ErrorMessage="Enter date as mm/dd/yyyy format" ValidationGroup="Edit">*
                    </asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                <asp:Label ID="ReleaseDate" runat="server"  Text='<%# Bind("ReleaseDate", "{0:MM/dd/yyyy}") %>' ></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 

            <asp:CommandField ButtonType="Button" CausesValidation="true" ShowEditButton="true" ValidationGroup="Edit" />
            <asp:CommandField ButtonType="Button" CausesValidation="false" ShowDeleteButton="true" />

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
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please correct the following errors:"
        ValidationGroup="Edit" runat="server" />
    <asp:ValidationSummary ID="ValidationSummary2" HeaderText="Please correct the following errors:"
        ValidationGroup="Add" runat="server" />
    <br />
    <asp:Label ID="ValidationMsgLbl" runat="server" ForeColor="#FF3300" EnableViewState="False"></asp:Label>
    <br /><br />
    <asp:Label ID="Label1" runat="server" ForeColor="#0066CC" Text="To add a new product, enter the product information and click Add Product"></asp:Label>
    <br />
    <table>
        <tr>
            <td>
                <asp:Label ID="lblProductCode" runat="server" Text="Product code: "></asp:Label>
            </td>
             <td>
                 <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="PCodeFieldValidator" runat="server"
                        ControlToValidate="txtProductCode" ErrorMessage="Product Code is required" ValidationGroup="Add">*
                    </asp:RequiredFieldValidator>         
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Width="185px"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtName" ErrorMessage="Name is required" ValidationGroup="Add">*
                    </asp:RequiredFieldValidator>        
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Label ID="lblVersion" runat="server" Text="Version:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtVersion" ErrorMessage="Version is required" ValidationGroup="Add">*
                    </asp:RequiredFieldValidator>  
            </td>
        </tr>
         <tr>
            <td>
                 <asp:Label ID="lblReleaseDate" runat="server" Text="Release date: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtReleaseDate" runat="server" Text="mm/dd/yyyy"></asp:TextBox>  
                 <asp:RequiredFieldValidator ID="ReleaseDRequiredFieldValidator" 
                    runat="server" ControlToValidate="txtReleaseDate" ErrorMessage="Release Date is required" 
                    ValidationGroup="Add" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ReleaseDRegExp" runat="server" ControlToValidate="txtReleaseDate"
                        ValidationExpression="^([0-9]{1,2})[./-]+([0-9]{1,2})[./-]+([0-9]{2}|[0-9]{4})$" 
                        ErrorMessage="Enter date as mm/dd/yyyy format" ValidationGroup="Add">*
                    </asp:RegularExpressionValidator>
            </td>
        </tr>
        </table>
    <br />
    <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CausesValidation="true" ValidationGroup="Add" />
</asp:Content>
