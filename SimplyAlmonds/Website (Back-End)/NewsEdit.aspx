<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewsEdit.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.NewsEdit" %>
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
        <h1 class="heading_characteristics" style="text-align: center;">EDIT EXISTING NEWS</h1>
        <div class="form-group" runat="server">
            <label for="editNewsTitle_text">Event Title</label>
            <asp:TextBox runat="server" class="form-control" ID="editNewsTitle_text" placeholder="Title (e.g. Simply Almonds' New Single)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NewsTitle_validator" runat="server" ErrorMessage="News Title is required. ( * )" ControlToValidate="editNewsTitle_text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group" runat="server">
            <label for="editNewsDetails_text">Event Details</label>
            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="editNewsDetails_text" placeholder="Details (Place, Time, etc.)" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NewsDetails_validator" runat="server" ErrorMessage="News Details are required. ( * )" ControlToValidate="editNewsDetails_text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p style="font-style: oblique;"><small>NOTE: All fields must be filled.</small></p>
        </div>
        <asp:Button ID="alterconfirm" runat="server" Text="Submit Edited Data" class="btn btn-primary" OnClick="alterconfirm_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="deleteconfirm" runat="server" Text="Delete News Data" class="btn btn-danger" OnClick="deleteconfirm_Click" />
        <br />
        <br />

        <!-- Modal for Editing Event -->
        <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="modalEd" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalEd">Confirmation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure about these changes?
                    </div>
                    <div class="modal-footer">
                        <asp:Button type="button" id="yes_editnews" class="btn btn-primary" runat="server" Text="Yes" OnClick="yes_editnews_Click"/>
                        <asp:Button type="button" ID="no_editnews" class="btn btn-secondary" runat="server" data-dismiss="modal" Text="No"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Deleting Event -->
        <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="modalDel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalDel">Confirmation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Delete this event?
                    </div>
                    <div class="modal-footer">
                        <asp:Button type="button" id="yes_deletenews" class="btn btn-primary" runat="server" Text="Yes" OnClick="yes_deletenews_Click"/>
                        <asp:Button type="button" ID="no_deletenews" class="btn btn-secondary" runat="server" data-dismiss="modal" Text="No"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
