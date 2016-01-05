<%@ Page Title="Survey Complete" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="SurveyComplete.aspx.vb" Inherits="SportsPro.SurveyComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
     .style1 {
            width: 100%;
        }
        .style2 {
            width:100%;
            color: red;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblThanks" runat="server" Text="Thank you for your feedback!"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblContact" runat="server" Text="A customer representative will contact you within 24 hours."></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnReturn" runat="server" Text="Return to Survey" PostBackUrl="~/CustomerSurvey.aspx" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
