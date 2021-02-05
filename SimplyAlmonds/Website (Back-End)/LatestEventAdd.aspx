<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="LatestEventAdd.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.LatestEventAdd" %>

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
        <h1 class="heading_characteristics" style="text-align: center;">ADD A NEW EVENT</h1>
        <div class="form-group">
            <label for="EventTitle_text">Event Title</label>
            <asp:TextBox runat="server" class="form-control" ID="EventTitle_text" aria-describedby="emailHelp" placeholder="Title (e.g. Simply Almonds Manila Tour)"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EventTitle_validator" runat="server" ErrorMessage="Event Title is required. ( * )" ControlToValidate="EventTitle_text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="EventDetails_text">Event Details</label>
            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="EventDetails_text" placeholder="Details (Place, Time, etc.)" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="EventDetails_validator" runat="server" ErrorMessage="Event Details are required. ( * )" ControlToValidate="EventDetails_text" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p style="font-style: oblique;"><small>NOTE: All fields must be filled.</small></p>
        </div>
        <asp:Button ID="addNewEvent" runat="server" Text="Submit New Event" class="btn btn-primary" OnClick="addNewEvent_Click" />

        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure about these changes?
                    </div>
                    <div class="modal-footer">
                        <asp:Button type="button" id="yes_latestevents" class="btn btn-secondary" runat="server" Text="Yes" OnClick="addevent_Click"/>
                        <asp:Button type="button" ID="no_latestevents" class="btn btn-primary" runat="server" data-dismiss="modal" Text="No"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
