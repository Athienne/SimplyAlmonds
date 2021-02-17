<%@ Page Title="Order Requests" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="OrderRequests.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.OrderRequests" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <div class="container">
        <div class="jumbotron">
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics" style="text-align: center; background-color: #44f9ff; border-radius: 25px; border: 5px solid #cd83ff">LIST OF ORDER REQUESTS</h1>
                <hr />
                <br />
                <div class="list-group" style="overflow-y: scroll; max-height: 300px;">
                    <div class="list-group">
                        <asp:Repeater ID="orderlist" runat="server">
                            <ItemTemplate>
                                <div class="d-flex w-100 justify-content-between">
                                    <asp:LinkButton ID="markOrder" runat="server" class="list-group-item list-group-item-action flex-column align-items-start" OnClick="markModal_Click" CommandArgument='<%#Eval("orderID")%>'>
                                        <h5 class="mb-1">Order ID: <%#Eval("orderID")%></h5>
                                        <p class="mb-1">User ID: <%#Eval("username")%></p>
                                        <asp:LinkButton runat="server" ID="orderDetailsLink" class="list-group-item" CommandArgument='<%#Eval("orderID")%>' OnClick="orderDetails_Click">Details</asp:LinkButton>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for Marking Finished Orders -->
    <div class="modal fade" id="modalMark" tabindex="-1" role="dialog" aria-labelledby="modalMrk" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalMrk">Order Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Mark this order as finished?
                </div>
                <div class="modal-footer">
                    <asp:Button type="button" ID="yes_mark" class="btn btn-primary" runat="server" Text="Yes" OnClick="yes_mark_Click" />
                    <asp:Button type="button" ID="no_mark" class="btn btn-secondary" runat="server" data-dismiss="modal" Text="No" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for Viewing Order Details -->
    <div class="modal fade" id="modalDetails" tabindex="-1" role="dialog" aria-labelledby="modalData" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalData">Order Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Username:
                    <asp:Label ID="usernameLabel" runat="server" Text=""></asp:Label>
                    <br />
                    E-Mail Address:
                    <asp:Label ID="emailLabel" runat="server" Text=""></asp:Label>
                    <br />
                    Product Ordered:
                    <asp:Label ID="productLabel" runat="server" Text=""></asp:Label>
                    <br />
                    Date of Purchase:
                    <asp:Label ID="dateLabel" runat="server" Text=""></asp:Label>
                    <br />
                    Status:
                    <asp:Label ID="statusLabel" runat="server" Text="" ForeColor="#3366FF"></asp:Label>
                </div>
                <div class="modal-footer">
                    <asp:Button type="button" ID="no_editlatestevent" class="btn btn-primary" runat="server" data-dismiss="modal" Text="Close" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
