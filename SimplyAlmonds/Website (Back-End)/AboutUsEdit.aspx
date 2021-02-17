<%@ Page Title="About Us Edit" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AboutUsEdit.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.AboutUsEdit" %>

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
    <div class="container">
        <h1 class="heading_characteristics" style="text-align: center;">EDIT ABOUT US PAGE</h1>
        <div class="form-group">
            <label for="ProductName_text">Developer Company Name</label>
            <asp:TextBox runat="server" class="form-control" ID="companyName" aria-describedby="companyName" placeholder="Company Name (e.g. Simply Inc.)" Width="318px"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="ProductName_text">Developer Company Details</label>
            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="companyDetails" placeholder="Company Details" Rows="5"></asp:TextBox>
            Developer Company E-Mail<asp:TextBox runat="server" class="form-control w-25" ID="companyEmail" aria-describedby="companyEmail" placeholder="company@email.com"></asp:TextBox>
                Developer Company Hotline Number<asp:TextBox runat="server" class="form-control w-25" ID="companyNumber" aria-describedby="companyNumber" placeholder="0XXXXXXXXXX"></asp:TextBox>
                <br />
        </div>
        <div align="center">
            <p style="font-style: oblique;"><small style="text-align: center">NOTE: All fields must be filled.</small></p>
        <asp:Button ID="editAboutCompany" runat="server" Text="Edit Company Details" class="btn btn-primary" OnClick="checkModalCompany_click" />
        </div>
        <div>
            <div class="form-group">
                <div>
                    <label for="ProductDescription_text">Band Name</label>
                    <asp:TextBox runat="server" class="form-control w-25" ID="bandName" aria-describedby="bandName" placeholder="Band Name (e.g. Simply Almonds)"></asp:TextBox>

                    <label for="ProductDescription_text">Band Details</label>
                    <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="bandDetails" placeholder="Band Details" Rows="5"></asp:TextBox>
                <label for="ProductDescription_text">Band E-Mail</label>
                <asp:TextBox runat="server" class="form-control w-25" ID="bandEmail" aria-describedby="bandEmail" placeholder="band@email.com"></asp:TextBox>
                <label for="ProductDescription_text">Band Hotline Number</label>
                <asp:TextBox runat="server" class="form-control w-25" ID="bandNumber" aria-describedby="bandNumber" placeholder="0XXXXXXXXXX"></asp:TextBox>
                </div>

                <br />
            </div>
            </div>
        </div>

        <div class="form-group">
        </div>

        <div align="center">
            <p style="font-style: oblique;"><small style="text-align: center">NOTE: All fields must be filled.</small></p>
        <asp:Button ID="editAboutBand" runat="server" Text="Edit Band Details" class="btn btn-primary" OnClick="checkModalBand_click" />
        </div>
        <br />
        <br />

        <!-- Modal Band-->
        <div class="modal fade" id="modalBand" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <asp:Button type="button" id="yes" class="btn btn-primary" runat="server" Text="Yes" OnClick="editAboutBand_click"/>
                        <asp:Button type="button" ID="no" class="btn btn-secondary" runat="server" data-dismiss="modal" Text="No"/>
                    </div>
                </div>
            </div>
        </div>
    <!-- Modal Company-->
    <div class="modal fade" id="modalCompany" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Confirmation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure about these changes?
                    </div>
                    <div class="modal-footer">
                        <asp:Button type="button" id="Button1" class="btn btn-primary" runat="server" Text="Yes" OnClick="editAboutCompany_click"/>
                        <asp:Button type="button" ID="Button2" class="btn btn-secondary" runat="server" data-dismiss="modal" Text="No"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
