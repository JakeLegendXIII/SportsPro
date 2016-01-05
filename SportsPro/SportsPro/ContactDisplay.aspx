<%@ Page Language="vb" Title="Contact Display" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeBehind="ContactDisplay.aspx.vb" Inherits="SportsPro.ContactDisplay" %>

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
            height:155px;
        }
        .style4 {
            width:430px;
            height: 155px;
        }
    </style>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        Contact list:

        <table class="style1">
            <tr>
                <td class="style4">
                    <asp:ListBox ID="lstContact" runat="server" Height="135" Width="425"></asp:ListBox>
                </td>

                <td class="style3">
                    <br />
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Contact" /><br /><br />
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty List" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Select Additional Customers" PostBackUrl="~/CustomerDisplay.aspx" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="" EnableViewState="False" ForeColor="#CC3300"></asp:Label>
    </div>
</asp:Content>
