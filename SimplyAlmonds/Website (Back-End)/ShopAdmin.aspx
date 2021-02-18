<%@ Page Title="Shop" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ShopAdmin.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.ShopAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <!-- CSS Scripts -->
    <style>
        .heading_characteristics {
            font-size: 70px;
            font-family: 'Permanent Marker', cursive;
        }

        .socialmedia_header {
            font-size: 50px;
            font-family: 'Permanent Marker', cursive;
            align-self: center;
        }

        .socialmedia_item {
            display: flex;
            flex-direction: column;
        }

        /* width */
        ::-webkit-scrollbar {
            width: 12px;
            background: transparent;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0);
            background-color: #555;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <!-- Ticket Part -->
    <div class="container">
        <div class="jumbotron">
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics" style="text-align: center; background-color: #44f9ff; border-radius: 25px; border: 5px solid #cd83ff">TICKETS</h1>
                <hr />

                <div class="container-fluid">
                    <div class="row flex-row flex-nowrap" style="overflow-x: scroll;">
                        <asp:Repeater ID="TicketRepeater" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-3">
                                    <a href="/Website%20(Back-End)/ProductEdit.aspx?id=<%#Eval("ShopID")%>">
                                        <div class="card-deck h-100">
                                            <div class="card" style="width: 18rem;">
                                                <h5 class="card-header"><%#Eval("ProductName")%></h5>
                                                <div class="card-body h-100 d-flex flex-column">
                                                    <p class="card-text">
                                                        <%#Eval("ProductDescription")%>
                                                    </p>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    Stock on Hand: <%#Eval("StockOnHand")%>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <!--Single Part-->
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics" style="text-align: center; background-color: #44f9ff; border-radius: 25px; border: 5px solid #cd83ff">SINGLES</h1>
                <hr />
                <div class="container-fluid">
                    <div class="row flex-row flex-nowrap" style="overflow-x: scroll;">
                        <asp:Repeater ID="SingleRepeater" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-3">
                                    <a href="/Website%20(Back-End)/ProductEdit.aspx?id=<%#Eval("ShopID")%>">
                                        <div class="card-deck h-100">
                                            <div class="card" style="width: 18rem;">
                                                <img class="card-img-top" src='<%#Eval("ImageUrl")%>' runat="server" alt="Card image cap">
                                                <div class="card-body h-100 d-flex flex-column">
                                                    <h5 class="card-title"><%#Eval("ProductName")%></h5>
                                                    <p class="card-text"><%#Eval("ProductDescription")%></p>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    Stock on Hand: <%#Eval("StockOnHand")%>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>

            </div>
            <asp:Button runat="server" ID="ProductAddButton" class="btn btn-success" Text="Add New Product" OnClick="ProductAddButton_Click"/>
            &nbsp;&nbsp;
            <asp:Button runat="server" ID="OrderRequestsButton" class="btn btn-primary" Text="View Order Requests" OnClick="OrderRequestsButton_Click"/>
        </div>
    </div>

</asp:Content>
