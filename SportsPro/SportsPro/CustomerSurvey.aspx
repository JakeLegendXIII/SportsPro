<%@ Page Title="Customer Survey" Language="vb" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeBehind="CustomerSurvey.aspx.vb" Inherits="SportsPro.CustomerSurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .style2 {
            width:100%;
            color: red;
        }
        .style3
        {
            width: 370px;
        }
        .style4
        {
            width: 270px;
        }
        .style5
        {
            height: 25px;
        }
        .style6
        {
            width: 325px;
        }
        .style7
        {
            width: 350px;
        }
        .style8
        {
            width: 190px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    <table style="width:670px; height:45px;">
        <tr>
             <td class="style6">     
        <asp:Label ID="Label1" runat="server" Text="Enter your Customer ID:"></asp:Label>
             </td>
            <td class="style7">
                <asp:TextBox ID="txtCustID" runat="server" Height="20px" Width="125px"></asp:TextBox>
                <asp:Button ID="btnIncidents" runat="server" Text="Get Incidents" 
                    style="margin-left: 18px" ValidationGroup="GetIncidents" />
            </td>
             <td>
                &nbsp;
             </td>
        </tr>
        <tr>
        <td class="style6">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtCustID" 
            ErrorMessage="Please enter a Customer ID value." 
            ForeColor="Red" ValidationGroup="GetIncidents"></asp:RequiredFieldValidator>
       </td>
            <td class="style7">
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToValidate="txtCustID" 
               ErrorMessage="Customer ID must be an integer." ForeColor="Red" 
               Type="Integer" Operator="DataTypeCheck" ValidationGroup="GetIncidents"></asp:CompareValidator>
    
           <br />
    
    <asp:Label ID="lblNoIncidentsFound" runat="server" Text="No Incidents found..." ForeColor="Red"></asp:Label>
    </td>        
    </tr>
    </table>
        <table>
            <tr>
             <td>
        <asp:ListBox ID="lstIncidents" runat="server" Width="605px" Height="145px"></asp:ListBox>
             </td>
    
    </tr>
        <tr>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Please Select an Incident..." ValidationGroup="SubmitSurvey" 
                ControlToValidate="lstIncidents" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        
        </tr>
     </table>

     <table>
        <tr>
            <td class="style3">
                <asp:Label ID="lblCategories" runat="server" Text="Please rate this incident by the following categories: " Font-Bold="True"></asp:Label>
            </td>
        </tr>
     </table>

        <table style="margin-left: 8px">
        <tr>
        <td class="style8">
            <asp:Label ID="lblRateResponseTime" runat="server" Text="Response time: "></asp:Label>
       </td>
       <td>
            <asp:RadioButtonList ID="rblResponseTime" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
           <asp:ListItem Value="1">Not satisfied</asp:ListItem>
           <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
           <asp:ListItem Value="3">Satisfied</asp:ListItem> 
           <asp:ListItem Value="4" Selected="True">Completely satisfied</asp:ListItem>                   
            </asp:RadioButtonList>
             </td>
        </tr> 
        <tr>
        <td class="style8">
            <asp:Label ID="lblTechnicianEfficiency" runat="server" Text="Technician efficiency: "></asp:Label>
       </td>
       <td>
            <asp:RadioButtonList ID="rbrTechnicianEfficiency" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
           <asp:ListItem Value="1">Not satisfied</asp:ListItem>
           <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
           <asp:ListItem Value="3">Satisfied</asp:ListItem> 
           <asp:ListItem Value="4" Selected="True">Completely satisfied</asp:ListItem>                   
            </asp:RadioButtonList>
             </td>
        </tr>  
        <tr>
        <td class="style8">
            <asp:Label ID="lblProblemResolution" runat="server" Text="Problem resolution: "></asp:Label>
       </td>
       <td>
            <asp:RadioButtonList ID="rbrProblemResolution" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
           <asp:ListItem Value="1">Not satisfied</asp:ListItem>
           <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
           <asp:ListItem Value="3">Satisfied</asp:ListItem> 
           <asp:ListItem Value="4" Selected="True">Completely satisfied</asp:ListItem>                   
            </asp:RadioButtonList>
             </td>
        </tr> 
        </table>
    </div>

    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblComments" runat="server" Text="Additional comments:"></asp:Label>
                </td>

                <td>    
                </td>

                <td>
                <asp:TextBox ID="txtComments" runat="server" Height="72px" Width="607px"></asp:TextBox>
                </td>    
            </tr> 
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                SelectCommand="SELECT [IncidentID], [CustomerID], [ProductCode], [TechID], 
                [DateOpened], [DateClosed], [Title] FROM [Incidents] ORDER BY [DateClosed]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <td class="style4">
                <asp:CheckBox ID="chkContact" runat="server" 
                Text="Please contact me to discuss this incident" />
            </td>
        </tr>

        <tr>
    
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rbrEmail" runat="server" Text="Contact by email" 
                    GroupName="ContactGroup" />
            </td>
        </tr>
    <tr>
     <td class="style5">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RadioButton ID="rbrPhone" runat="server" Text="Contact by phone" 
             GroupName="ContactGroup" />
    </td>
    </tr> 
        <tr>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                ValidationGroup="SubmitSurvey" />
            </td>
        </tr>
    </table>  
  </div>
</asp:Content>
