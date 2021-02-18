<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SimplyAlmonds.Website__Front_End_.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-3">
        <div class="jumbotron">
            <h1 class="heading_characteristics">CART</h1>
            <hr />

            <div class="container-fluid">
                <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th scope="col">Product ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="CartItemRepeater" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <!--Get Product ID of chosen product-->
                                        <%#Eval("ShopID")%>
                                    </td>

                                    <td>
                                        <!--Get Product Name of chosen product-->
                                        <%#Eval("ProductName")%>
                                    </td>

                                    <td>
                                        <!--Quantity Part, Stock on hand of the chosen product-->
                                        <div class="input-group sm-3">
                                            <asp:Button ID="minusButton" runat="server" Text="-" class="btn btn-outline-dark" OnClick="minus_Click" />
                                            <asp:TextBox ID="quantityTxt" runat="server" TextMode="Number" min="1" max='<%#Eval("StockOnHand")%>' Text="1" class="col-sm-2" Style="text-align: center"></asp:TextBox>
                                            <asp:Button ID="plusButton" runat="server" Text="+" class="btn btn-outline-dark" OnClick="plus_Click" CommandArgument='<%#Eval("StockOnHand")%>' />
                                        </div>
                                    </td>

                                    <td>
                                        <!--Get Product Price of chosen product multiplied by Quantity-->
                                        <asp:Label ID="ProductPriceLabel" runat="server" Text="PRICE"></asp:Label>
                                    </td>

                                    <td>
                                        <!--Get Product ID to remove-->
                                        <asp:Button ID="RemoveItemBtn" runat="server" Text="&times;" class="close" aria-label="Close" OnClick="RemoveItemBtn_Click" CommandArgument='<%#Eval("ShopID")%>'/>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</asp:Content>
