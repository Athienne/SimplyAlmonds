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


        .auto-style2 {
            border-radius: .3rem;
            width: 988px;
            text-align: center;
            margin-bottom: 2rem;
            background-color: #e9ecef;
            align-items: center;
            position: relative;
            left: 243px;
            top: 3px;
            height: 476px;
            margin-right: 2px;
        }

        .auto-style3 {
            border-radius: .3rem;
            margin-left: 29px;
            margin-bottom: 2rem;
            background-color: #e9ecef;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
        <div class="jumbotron">
            <div class="auto-style3">
                <h1 class="heading_characteristics">Account</h1>
                <h1 class="display-2">Activate/Deactivate an Account</h1>
                <h1 class="display-4">All deactivated items entered are activated and vice versa</h1>

                <div class="form-group">
                    <asp:TextBox CssClass="auto-style1" ID="deactoract" runat="server" placeholder="ID to activate/deactivate" MaxLength="30" Width="346px" Height="45px"></asp:TextBox>

                    <asp:Button class="btn btn-success btn-block btn-lg" ID="updatebtn" runat="server" Text="Update" OnClick="updatebtn_Click" Width="226px" Height="41px" />

                </div>
                <div class="form-group">
                </div>
                <div class="auto-style2" style="background-color: #FFFFFF">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" Height="393px" HorizontalAlign="Center" Width="842px" Font-Names="Bebas" Font-Overline="False" Font-Size="XX-Large"></asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
