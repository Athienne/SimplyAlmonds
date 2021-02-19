<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AccountAdmin.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.accountadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <style>
        .heading_characteristics {
            font-size: 70px;
            font-family: 'Permanent Marker', cursive;
        }
        .display-2 {
            font-family: 'Bebas';
        }
        .auto-style1 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
        .center {
            margin: 0 auto;
            margin-left:auto; 
            margin-right:auto;
            width:100%
         }
        .auto-style4 {
            font-size: 70px;
            font-family: 'Permanent Marker', cursive;
            text-align: center;
        }
        .auto-style5 {
            font-size: 3rem;
            font-weight: 300;
            line-height: 1.2;
            font-family: Bebas;
            text-align: center;
        }
        .auto-style6 {
            font-size: 2.5rem;
            font-weight: 300;
            line-height: 1.2;
            text-align: center;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
        <div class="jumbotron">
            <table class="center">
                <tr class="center">
                    <td><h1 class="auto-style4">Account</h1></td>
                </tr>
                <tr class="center">
                    <td>
                        <h1 class="auto-style5">Activate/Deactivate an Account</h1>
                    </td>
                </tr>
                <tr class="center">
                    <td>
                        <h1 class="auto-style6">All deactivated items entered are activated and vice versa</h1>
                    </td>
                </tr>
                <tr class="center">
                    <td>&nbsp;</td>
                </tr>
                <tr class="center">
                    <td>
                        <asp:TextBox CssClass="auto-style1" ID="deactoract" runat="server" placeholder="ID to activate/deactivate" MaxLength="30" Width="50%" Height="45px" ></asp:TextBox> &nbsp;
                        <asp:Button class="btn btn-success btn-block btn-lg" ID="updatebtn" runat="server" Text="Update" OnClick="updatebtn_Click" Width="30%" Height="45px" />
                    </td>
                </tr>
                <tr class="center">
                    <td>&nbsp;</td>
                </tr>
                <tr class="center">
                    <td>
                        <asp:GridView ID="GridView1" runat="server"  HorizontalAlign="Center" class="center" Font-Names="Bebas" Font-Overline="False" Font-Size="Large" CellPadding="4" ForeColor="#333333" >
                            <AlternatingRowStyle BackColor="White" />
                            <EmptyDataTemplate>
                                <div style="text-align:center;">
                                    DATA IS EMPTY</div>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="center">
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
