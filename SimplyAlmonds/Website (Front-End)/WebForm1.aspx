<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SimplyAlmonds.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet"/>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>

    <style>
        .heading_characteristics {
            font-size: 70px;
            font-family: 'Permanent Marker', cursive;
        }
    </style>
</head>
<body style="background-color: #cd83ff">
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
            </div>
            <br />
            <br />
            <div class="jumbotron" style="background-color: #d3b0ff">
                <h1 class="heading_characteristics">NEWS</h1>
                <hr />
            </div>
        </div>
    </form>
</body>
</html>
