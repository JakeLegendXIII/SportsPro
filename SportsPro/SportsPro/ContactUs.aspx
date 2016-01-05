<%@ Page Title="Contact Us" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ContactUs.aspx.vb" Inherits="SportsPro.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .cTableColumns1 {
        width: 105px;
        vertical-align: top;
    }
    .cTableColumns2 {
        width: 350px;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>How to contact us</h2>

    <p style="width:430px;">If you ever have any questions or comments about our products,
         please be sure to contact us in whatever way is most convenient for you.</p>

    <table>
        <tr>
            <td class="cTableColumns1">
                <asp:Label ID="Label1" runat="server" Text="Phone: "></asp:Label>
            </td>
            <td class="cTableColumns2">
                <asp:Label ID="Label2" runat="server" Text="1-800-555-0400"></asp:Label><br />
                <asp:Label ID="Label3" runat="server" Text="Weekdays, 8 to 5 Pacific Time"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="cTableColumns1">
                <asp:Label ID="Label4" runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td class="cTableColumns2">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="mailto:sportspro@sportsprosoftware.com">sportspro@sportsprosoftware.com</asp:HyperLink>
            </td>
        </tr>

        <tr>
            <td class="cTableColumns1">
                <asp:Label ID="Label5" runat="server" Text="Fax: "></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="1-559-555-2732"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="cTableColumns1">
                <asp:Label ID="Label7" runat="server" Text="Address: "></asp:Label>
            </td>
            <td class="cTableColumns2">
                <asp:Label ID="Label8" runat="server" Text="SportsPro Software, Inc."></asp:Label><br />
                <asp:Label ID="Label9" runat="server" Text="1500 N. Main Street"></asp:Label><br />
                <asp:Label ID="Label10" runat="server" Text="Fresno, California 93710"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
