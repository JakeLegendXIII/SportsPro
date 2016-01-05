<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomerIncidentDisplay.aspx.vb" Inherits="SportsPro.CustomerIncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
          .auto-style1
        {
            width: 700px;
        }
        .col-left
        {
            width: 175px;
        }
        .col-right
        {
            width: 175px;
            text-align: right;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Select a customer: "></asp:Label>

     <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="dbCustomers" 
            DataTextField="Name" DataValueField="CustomerID" Width="150px" 
            AutoPostBack="true"></asp:DropDownList>

        <asp:SqlDataSource ID="dbCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT
             [CustomerID], [Name] FROM [Customers] ORDER BY [Name]">
        </asp:SqlDataSource>
    <br />
    <br />
        <asp:DataList ID="dlIncidents" runat="server" DataSourceID="dbIncidents" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
            BorderWidth="1px" CellPadding="4" GridLines="Vertical" RepeatColumns="1" Width="623px">
            <AlternatingItemStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" VerticalAlign="Middle" BorderColor="Black" 
                Font-Italic="False" Font-Names="Tahoma" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" Font-Size="Larger" />
            <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
            <HeaderTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="col-left">
                            Product/Incident</td>
                        <td class="col-right">
                            Tech name</td>
                        <td class="col-right">
                            Date opened</td>
                        <td class="col-right">
                            Date closed</td>
                    </tr>
                </table>
            </HeaderTemplate>
        <ItemTemplate>
            <table class="auto-style1">
                    <tr>
                        <td class="col-left">
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' /></td>
                        <td class="col-right">
                            <asp:Label CssClass="tab" ID="TechNameLabel" runat="server" Text='<%# Eval("TechName") %>' /></td>
                        <td class="col-right">
                            <asp:Label CssClass="tab" ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened", "{0:d}") %>' /></td>
                        <td class="col-right">
                            <asp:Label CssClass="tab" ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed", "{0:d}")%>' /></td>
                    </tr>
                <tr>
                    <td colspan="4">
                           <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                </tr>
                </table>                                                          
        <br />
        </ItemTemplate>
            <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>

    <asp:SqlDataSource ID="dbIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT Technicians.Name AS TechName, Incidents.Description, 
        Products.Name AS ProductName, Incidents.DateOpened, Incidents.DateClosed, 
        Incidents.CustomerID FROM ((Incidents INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode) 
        INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID) 
        WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
        <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID"
            PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
