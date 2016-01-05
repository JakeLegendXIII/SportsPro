<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Map.aspx.vb" Inherits="SportsPro.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Site Map</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1">
</asp:TreeView>
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
</asp:Content>
