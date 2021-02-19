<%@ Page Title="My Account" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="SimplyAlmonds.Website__Front_End_.useraccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: -1px;
        }

        .display-2 {
            font-family: 'Bebas';
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           &nbsp;</center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h3>Update User Details</h3>
                        </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label>Username</label>
                                    <div class="form-group">
                                        <asp:Label CssClass="form-control" ID="username" runat="server"></asp:Label>
                                    </div>
                                    <label>New Username</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="newusername" runat="server" placeholder="New Username" MaxLength="30"></asp:TextBox>
                                    </div>
                                    <label>Old Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="oldpass" runat="server" placeholder="Old Password" TextMode="Password" MaxLength="30"></asp:TextBox>
                                    </div>
                                    <label>New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="newpass" runat="server" placeholder="New Password" TextMode="Password" MaxLength="30"></asp:TextBox>
                                    </div>
                                    <label>Re-type New Password</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="newpass2" runat="server" placeholder="Retype New Password" TextMode="Password" MaxLength="30"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="updatebtn" runat="server" Text="Update" OnClick="updatebtn_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="home.aspx"><< Back to Home</a><br>
                    <br>
                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="jumbotron">
            <h3 class="display-3" style="font-weight: bold; text-align: center">Purchase History</h3>
            <br />
            <br />
            <div class="auto-style2" style="background-color: #FFFFFF">
                <asp:GridView ID="purchasehistory" runat="server" Height="100px" HorizontalAlign="Center" Width="1045px" Font-Names="Bebas" Font-Overline="False" Font-Size="XX-Large"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
