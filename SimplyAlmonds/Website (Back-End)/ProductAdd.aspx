<%@ Page Title="Add New Product" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ProductAdd.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.ProductAdd" MaintainScrollPositionOnPostback="True" %>

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
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="True" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1 class="heading_characteristics" style="text-align: center;">ADD A NEW SINGLE</h1>
        <div class="form-group">
            <label for="ProductName_text">Product Name</label>
            <asp:TextBox runat="server" class="form-control" ID="ProductName_text" aria-describedby="productName" placeholder="Product Name (e.g. Simply Almonds Manila Tour)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ProductName_validator" runat="server" ErrorMessage="Product Name is required. ( * )" ControlToValidate="ProductName_text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="ProductDescription_text">Product Description</label>
            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="ProductDescription_text" placeholder="Product Desription (Place, Time, etc.)" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ProductDescription_validator" runat="server" ErrorMessage="Product Description are required. ( * )" ControlToValidate="ProductDescription_text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-5">
                    <label for="ProductDescription_text">Stock On Hand</label>
                    <asp:TextBox runat="server" class="form-control w-25" ID="Stock_text" aria-describedby="productName" placeholder="Stock"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Stock_validator" runat="server" ErrorMessage="Stock On Hand is required. ( * )" ControlToValidate="Stock_text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Stock On Hand must be a number. ( * )" Type="Integer" ControlToValidate="Stock_text" Font-Italic="True" Operator="DataTypeCheck"></asp:CompareValidator>
                </div>

                <div class="col-5">
                    <label for="ProductDescription_text">Product Type</label>

                    <asp:UpdatePanel ID="ProductPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True" ClientIDMode="Static" RenderMode="Inline">
                        <Triggers>
                            <asp:PostBackTrigger ControlID="ProductList" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:DropDownList ID="ProductList" class="form-control w-25" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ProductList_SelectedIndexChanged">
                                <asp:ListItem Value="Ticket">Ticket</asp:ListItem>
                                <asp:ListItem Value="Single">Single</asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="col-5">
                    <label for="ProductDescription_text">Product Price</label>
                    <asp:TextBox runat="server" class="form-control w-25" ID="ProductPrice_Text" aria-describedby="productPrice" placeholder="Price"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ProductPrice_validator" runat="server" ErrorMessage="Product Price is required. ( * )" ControlToValidate="ProductPrice_Text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Product Price must be a number. ( * )" Type="Currency" ControlToValidate="ProductPrice_Text" Font-Italic="True" Operator="DataTypeCheck"></asp:CompareValidator>
                </div>
            </div>
        </div>

        <div class="form-group">
            <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
        </div>

        <div>
            <p style="font-style: oblique;"><small>NOTE: All fields must be filled.</small></p>
        </div>
        <asp:Button ID="addNewProduct" runat="server" Text="Submit New Product" class="btn btn-primary" OnClick="checkModal_click" />
        <br />
        <br />

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure about these changes?
                    </div>
                    <div class="modal-footer">
                        <asp:Button type="button" id="yes" class="btn btn-primary" runat="server" Text="Yes" OnClick="addProduct_click"/>
                        <asp:Button type="button" ID="no" class="btn btn-secondary" runat="server" data-dismiss="modal" Text="No"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
