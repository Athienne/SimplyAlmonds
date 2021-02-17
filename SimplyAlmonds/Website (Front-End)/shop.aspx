﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="SimplyAlmonds.Website__Front_End_.Shop" %>

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

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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
                                        <div class="card-deck h-100">
                                            <div class="card" style="width: 18rem;">
                                                <h5 class="card-header"><%#Eval("ProductName")%></h5>
                                                <div class="card-body h-100 d-flex flex-column">

                                                    <p class="card-text">
                                                        <%#Eval("ProductDescription")%>
                                                    </p>

                                                    <label for="Quantity">Quantity</label>

                                                    <div class="input-group sm-3">
                                                        <asp:Button ID="minusButton" runat="server" Text="-" class="btn btn-outline-dark" OnClick="minus_Click" />
                                                        <asp:TextBox ID="quantityTxt" runat="server" TextMode="Number" min="1" max='<%#Eval("StockOnHand")%>' Text="1" class="col-sm-4" Style="text-align: center"></asp:TextBox>
                                                        <asp:Button ID="plusButton" runat="server" Text="+" class="btn btn-outline-dark" OnClick="plus_Click" CommandArgument='<%#Eval("StockOnHand")%>' />
                                                    </div>
                                                    <br />
                                                    <a href="#" class="btn btn-primary mt-auto">Add to cart</a>

                                                </div>
                                                <div class="card-footer text-muted">
                                                    Stock on Hand: <%#Eval("StockOnHand")%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="jumbotron" style="background-color: #d3b0ff">
                    <h1 class="heading_characteristics" style="text-align: center; background-color: #44f9ff; border-radius: 25px; border: 5px solid #cd83ff">SINGLES</h1>
                    <hr />
                    <div class="container-fluid">
                        <div class="row flex-row flex-nowrap" style="overflow-x: scroll;">
                            <asp:Repeater ID="SingleRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-3">
                                        <div class="card-deck h-100">
                                            <div class="card" style="width: 18rem;">
                                                <img class="card-img-top" src='<%#Eval("ImageUrl")%>' runat="server" alt="Card image cap">
                                                <div class="card-body h-100 d-flex flex-column">
                                                    <h5 class="card-title"><%#Eval("ProductName")%></h5>
                                                    <p class="card-text"><%#Eval("ProductDescription")%></p>
                                                    <a href="#" class="btn btn-primary mt-auto">Add to cart</a>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    Stock on Hand: <%#Eval("StockOnHand")%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>


                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><%#Eval("ProductName")%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <%#Eval("ProductDescription")%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>


    </div>

</asp:Content>
