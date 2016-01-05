<%@ Page Title="Customer Display" Language="vb" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeBehind="CustomerDisplay.aspx.vb" Inherits="SportsPro.CustomerDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .style2 {
            width:100%;
            color: red;
        }
        .style3 {
            width:100px;
        }
        .style4 {
            width:200px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Select a customer: "></asp:Label>

        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="Name" DataValueField="CustomerID" Width="150px" 
            AutoPostBack="true"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT
             [CustomerID], [Name], [Address], [City], 
            [State], [ZipCode], [Phone], [Email] FROM [Customers] ORDER BY [Name]">
        </asp:SqlDataSource>
        <table class="style1">
            <tr>
                <td class="style3">
                    <asp:Label ID="Label1z" runat="server" Text="Address:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblState" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblZip" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="Phone:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add to Contact List" />
        <asp:Button ID="btnDisplay" runat="server" Text="Display Contact List" PostBackUrl="~/ContactDisplay.aspx" />
        <br />
        <asp:Label ID="lblMessage" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
    </div>
</asp:Content>