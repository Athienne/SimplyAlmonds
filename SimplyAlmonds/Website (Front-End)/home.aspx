<%@ Page Title="Simply Almonds" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SimplyAlmonds.Website__Front_End_.home" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <script src="https://unpkg.com/pretty-scroll@1.1.0/js/pretty-scroll.js"></script>
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
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v9.0" nonce="2ZFddNXz"></script>
    <div style="background-color: #cd83ff">
        <div class="container">
            <!--Carousel Slides-->
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleSlidesOnly" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleSlidesOnly" data-slide-to="1"></li>
                    <li data-target="#carouselExampleSlidesOnly" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <br />
                    <br />
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="~/Pictures/asdasdasd.png" runat="server" alt="First slide" />
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="~/Pictures/simply almonds.png" runat="server" alt="Second slide" />
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="~/Pictures/simply almonds223.png" runat="server" alt="Third slide" />
                    </div>
                </div>
            </div>

            <br />
            <br />

            <!--Latest Events-->
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics">LATEST EVENTS</h1>
                <hr />
                <br />
                <div class="list-group" style="overflow-y: scroll; max-height: 300px;">
                    <div class="list-group">
                        <asp:Repeater ID="latestEvents_repeater" runat="server">
                            <ItemTemplate>
                                <a href="?" class="list-group-item list-group-item-action flex-column align-items-start">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1"><%#Eval("EventTitle")%></h5>
                                        <small><%#Eval("DateAdded")%></small>
                                    </div>
                                    <p class="mb-1"><%#Eval("EventDetails")%></p>
                                    <small>Click for more details.</small>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <br />
            <br />
            <!--News-->
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics">NEWS</h1>
                <hr />
                <br />
                <div class="list-group" style="overflow-y: scroll; max-height: 300px;">
                    <asp:Repeater ID="news_repeater" runat="server">
                        <ItemTemplate>
                            <a href="?" class="list-group-item list-group-item-action flex-column align-items-start">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1"><%#Eval("NewsTitle")%></h5>
                                    <small><%#Eval("DateAdded")%></small>
                                </div>
                                <p class="mb-1"><%#Eval("NewsDetails")%></p>
                                <small>Click for more details.</small>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

        <br />
        <br />

        <div class="container">
            <div class="row">
                <br />
                <!-- Embed Facebook -->
                <div class="socialmedia_item col-4">
                    <h1 class="socialmedia_header">FACEBOOK</h1>
                    <div class="fb-page" data-href="https://www.facebook.com/SimplyAlmonds/"
                        data-tabs="timeline" data-width="" data-height="" data-small-header="false"
                        data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                        <blockquote cite="https://www.facebook.com/SimplyAlmonds/" class="fb-xfbml-parse-ignore">
                            <a href="https://www.facebook.com/SimplyAlmonds/">Simply Almonds</a>
                        </blockquote>
                    </div>
                </div>
                <!-- Embed Twitter -->
                <div class="socialmedia_item col-4">
                    <h1 class="socialmedia_header">TWITTER</h1>
                    <a class="twitter-timeline" data-width="350" data-height="500" href="https://twitter.com/SimplyAlmonds?ref_src=twsrc%5Etfw">Tweets by SimplyAlmonds</a>
                    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
                <!-- Embed Instagram (not yet fully functional, still in-progress) -->
                <div class="socialmedia_item col-4">
                    <h1 class="socialmedia_header">INSTAGRAM</h1>
                    <div class="fb-page" data-href="https://www.facebook.com/SimplyAlmonds/"
                        data-tabs="timeline" data-width="" data-height="" data-small-header="false"
                        data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                        <blockquote cite="https://www.facebook.com/SimplyAlmonds/" class="fb-xfbml-parse-ignore">
                            <a href="https://www.facebook.com/SimplyAlmonds/">Simply Almonds</a>
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />
        <br />

    </div>
</asp:Content>

