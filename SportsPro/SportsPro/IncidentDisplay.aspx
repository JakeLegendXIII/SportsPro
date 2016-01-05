<%@ Page Title="Incident Display" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="IncidentDisplay.aspx.vb" Inherits="SportsPro.IncidentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
.info
{
    margin-left: 150px;
}
.label
{
    float: left;
    width: 130px;
    margin-top: 0;
    margin-bottom: 4px;
}
.control
{
    margin-top: 0;
    margin-bottom: 4px;
    margin-left: 10px;
}
.listCol1{
    float:left;
    width: 350px;
}
.listCol2{
    float:left;
    width: 220px;
}
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td colspan="3">
                    <div class="listCol1">
                    <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("Product") %>' />
                    </div>
                    <div class="listCol2">
                    <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' />
                    </div>
                    <div style="float:left;">
                     <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Eval("Technician") %>' />
                    </div>
                
                <br /><br />
                 <div class="info">
                        <p class="label">Date Opened:</p>
                        <p class="control">
                            <asp:Label ID="DateOpenedLabel" runat="server" 
                                Text='<%# Eval("DateOpened", "{0:MM/dd/yyyy}") %>' />
                        </p>
                        <p class="label">Date Closed:</p>
                        <p class="control">
                            <asp:Label ID="DateClosedLabel" runat="server" 
                                Text='<%# Eval("DateClosed", "{0:MM/dd/yyyy}") %>' /><br />
                        </p>
                        <p class="label">Title: </p>
                        <p class="control">
                            <asp:Label ID="TitleLabel" runat="server" 
                                Text='<%# Eval("Title") %>' />
                        </p>
                        <p class="label">Description:</p>
                        <p class="control">
                            <asp:Label ID="DescriptionLabel" runat="server" 
                                Text='<%# Eval("Description") %>' />
                        </p>
                    </div>
                    </td>
           </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
             <tr style="background-color: #E0FFFF;color: #333333;">
                <td colspan="3">
                    <div class="listCol1">
                    <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("Product") %>' />
                    </div>
                    <div class="listCol2">
                    <asp:Label ID="CustomerLabel" runat="server" Text='<%# Eval("Customer") %>' />
                    </div>
                    <div style="float:left;">
                     <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Eval("Technician") %>' />
                    </div>
                
                <br /><br />
                 <div class="info">
                        <p class="label">Date Opened:</p>
                        <p class="control">
                            <asp:Label ID="DateOpenedLabel" runat="server" 
                                Text='<%# Eval("DateOpened", "{0:MM/dd/yyyy}") %>' />
                        </p>
                        <p class="label">Date Closed:</p>
                        <p class="control">
                            <asp:Label ID="DateClosedLabel" runat="server" 
                                Text='<%# Eval("DateClosed", "{0:MM/dd/yyyy}") %>' /><br />
                        </p>
                        <p class="label">Title: </p>
                        <p class="control">
                            <asp:Label ID="TitleLabel" runat="server" 
                                Text='<%# Eval("Title") %>' />
                        </p>
                        <p class="label">Description:</p>
                        <p class="control">
                            <asp:Label ID="DescriptionLabel" runat="server" 
                                Text='<%# Eval("Description") %>' />
                        </p>
                    </div>
                    </td>
                    </tr>
        </ItemTemplate>
        <LayoutTemplate>
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="width: 800px;color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="Tr1" runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th id="Th1" runat="server" style="text-align:left;" colspan="3">
                                <div class="listCol1">Product</div>
                                <div class="listCol2">Customer</div>
                                <div style="float:left;">Technician</div>
                                </th>       
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                <table id="Table2" style="width:auto;" runat="server">
                    <tr id="Tr2" runat="server">
                    <td id="Td1" runat="server" style="width: 800px;text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="False" ShowLastPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                        </tr>
                </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="SELECT Products.Name AS Product, Customers.Name AS Customer, Technicians.Name AS Technician, Incidents.DateOpened, Incidents.DateClosed, Incidents.Title, Incidents.Description FROM (((Incidents INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode) INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID) INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID) ORDER BY Incidents.DateOpened"></asp:SqlDataSource>

</asp:Content>

