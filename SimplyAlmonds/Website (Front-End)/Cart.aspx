<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SimplyAlmonds.Website__Front_End_.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: #cd83ff">
        <div class="container py-3">
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics">CART</h1>
                <hr />

                <div class="list-group">

                </div>
            </div>

        </div>
    </div>
</asp:Content>
