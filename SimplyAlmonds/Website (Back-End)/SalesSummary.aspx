<%@ Page Title="Summary of Sales" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="SalesSummary.aspx.cs" Inherits="SimplyAlmonds.Website__Back_End_.SalesSummary" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
    <div class="container">
        <div class="jumbotron">
            <br />
            <div align="center">
                <h1 style="text-align: center; font-weight: 500">OVERALL PRODUCTS SOLD</h1>
                <h6>Top Selling and Least Selling Products</h6>
                <br />
                Top Selling Product: 
                <asp:Label ID="topLabel" runat="server"></asp:Label>
                <br />
                Least Selling Product:
                <asp:Label ID="botLabel" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Chart ID="PieChartProducts" runat="server" Width="400px"> 
                    <Series>
                        <asp:Series Name="Series1" XValueMember="0" YValueMembers="1"></asp:Series>
                    </Series>
                    <Legends>
                        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="false" Name="Default" LegendStyle="Row" />
                    </Legends>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-6" align="center">
                    <asp:Chart ID="SinglesChart" runat="server">
                        <Titles>
                            <asp:Title Font="Segoe UI, 18pt, style=Bold, Italic" Name="SinglesTitle"
                                Text="Singles" Alignment="MiddleCenter">
                            </asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="SingleSeries" XValueMember="1" YValueMembers="0"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="SinglesArea">

                                <AxisX Title="Month" TitleFont="Segoe UI, 12pt, style=Bold"></AxisX>
                                <AxisY Title="Buyers" TitleFont="Segoe UI, 12pt, style=Bold"></AxisY>

                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
                <div class="col-6" align="center">
                    <asp:Chart ID="TicketChart" runat="server">
                        <Titles>
                            <asp:Title Font="Segoe UI, 18pt, style=Bold, Italic" Name="TicketTitle"
                                Text="Tickets" Alignment="MiddleCenter">
                            </asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="TicketSeries" XValueMember="1" YValueMembers="0"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="TicketArea">

                                <AxisX Title="Month" TitleFont="Segoe UI, 12pt, style=Bold"></AxisX>
                                <AxisY Title="Buyers" TitleFont="Segoe UI, 12pt, style=Bold"></AxisY>

                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
