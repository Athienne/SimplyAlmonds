<%@ Page Title="Simply Almonds – About Us" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="SimplyAlmonds.Website__Front_End_.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="aboutUsContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="py-5 text-center container">
      </section>

    <div class="album py-5 bg-light" style="background-color: #d3b0ff">
        <div class="container">
            <div class="jumbotron">
                <div class="g-3">

            <h1 class="fw-light">About Us</h1>
            <p class="lead text-muted"><!---->&nbsp;<asp:Label ID="aboutDetails" runat="server" Text="Label"></asp:Label>
                    </p>
              <h1 class="fw-light">About The Band</h1>
              <p class="lead text-muted"><asp:Label ID="bandDetails" runat="server" Text="Label"></asp:Label>
                    </p>
              <p class="lead text-muted">&nbsp;</p>
              <h1 class="fw-light">For Inquiries</h1>
              <p class="lead text-muted"><asp:Label ID="companyInquire" runat="server" Text="Label"></asp:Label>
                    </p>
              <p class="lead text-muted"><!----><asp:Label ID="bandInquire" runat="server" Text="Label"></asp:Label>
                    </p>
              <p class="lead text-muted">&nbsp;</p>

            </div>
            </div>
        </div>
    </div>

</asp:Content>
