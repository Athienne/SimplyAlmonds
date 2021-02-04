<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SimplyAlmonds.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>

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
</head>
<body style="background-color: #cd83ff">
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v9.0" nonce="2ZFddNXz"></script>
    <form id="form1" runat="server">
        <div class="container">
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
            <!--
            <a class="carousel-control-prev" href="#carouselExampleSlidesOnly" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleSlidesOnly" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            -->
            <br />
            <br />
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics">LATEST EVENTS</h1>
                <hr />
                <br />
                <div class="list-group" style="overflow-y: scroll; max-height: 300px;">
                    <!-- put asp:Repeater here -->
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">List group item heading</h5>
                                <small>3 days ago</small>
                            </div>
                            <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                            <small>Donec id elit non mi porta.</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">List group item heading</h5>
                                <small class="text-muted">3 days ago</small>
                            </div>
                            <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                            <small class="text-muted">Donec id elit non mi porta.</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1">List group item heading</h5>
                                <small class="text-muted">3 days ago</small>
                            </div>
                            <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                            <small class="text-muted">Donec id elit non mi porta.</small>
                        </a>
                    </div>
                </div>
                <br />
                <br />
                <button type="button" class="btn btn-success">Add Items</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-info">Edit Items</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-danger">Delete Items</button>
            </div>
            <br />
            <br />
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics">NEWS</h1>
                <hr />
                <br />
                <div class="list-group" style="overflow-y: scroll; max-height: 300px;">
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small>Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
                </div>
                <br />
                <br />
                <button type="button" class="btn btn-success">Add Items</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-info">Edit Items</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-danger">Delete Items</button>
            </div>
        </div>
        <br />
        <br />
        <!-- Embed Facebook -->
        <div class="container">
            <div class="row">
                <br />
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
                <div class="socialmedia_item col-4">
                    <h1 class="socialmedia_header">TWITTER</h1>
                    <a class="twitter-timeline" data-width="350" data-height="500" href="https://twitter.com/SimplyAlmonds?ref_src=twsrc%5Etfw">Tweets by SimplyAlmonds</a>
                    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
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
    </form>
</body>
</html>
