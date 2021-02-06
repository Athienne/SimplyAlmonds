<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="accountadmin.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.accountadmin" %>
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


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron" style="background-color: #d3b0ff">
        <h1 class="heading_characteristics">Account</h1>
        <asp:Repeater id="accounts" runat="server">
            <ItemTemplate>
                <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><%#Eval("username")%></h5>
                        <small><%#Eval("passw")%></small>
                    </div>
                    <p class="mb-1"><%#Eval("email")%></p>
                    <p class="mb-1"><%#Eval("active")%></p>
                    
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
