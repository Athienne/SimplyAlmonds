<%@ Page Title="Simply Almonds – Discography" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="Discography.aspx.cs" Inherits="SimplyAlmonds.UserPages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        .ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display:block;
            width : 150px;
        }
        </style>

</asp:Content>
<asp:Content ID="discographyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">DISCOGRAPHY</h1>
            <p class="lead text-muted">Simply Almond's Singles</p>
          </div>
        </div>
      </section>

        <div class="album py-5 bg-light">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <asp:Repeater ID="bandSinglesRepeater" runat="server" DataSourceID="SqlDataSourceDiscography" >
                <ItemTemplate>
                    <div class="col">
                        <div class="card mb-4 shadow-sm">
                            <asp:Image ID="songImg" runat="server" ImageUrl='<%# String.Format("~/Pictures/{0}", Eval("songPicture")) %>' />
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title">
                                    <asp:LinkButton ID="LinkButtonLyrics" runat="server" PostBackUrl='<%# Eval("songID","SongLyrics.aspx?songID={0}") %>' Font-Size = "XX-Large"><%# String.Format("{0}",Eval("songTitle"))  %></asp:LinkButton>
                                    <ul class="list-unstyled mt-3 mb-4">
                                        <li>
                                            <asp:Label ID="lblSongInfo" runat="server"  CssClass="ellipsis" Text='<%# Eval("songInfo") %>' Font-Size="X-Large"></asp:Label>
                                            <br />
                                            <a href='<%# Eval("songSpotify") %>' target="_blank" >
                                                <svg width="20px" height="20px" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Listen on Spotify</title><path d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.66 0 12 0zm5.521 17.34c-.24.359-.66.48-1.021.24-2.82-1.74-6.36-2.101-10.561-1.141-.418.122-.779-.179-.899-.539-.12-.421.18-.78.54-.9 4.56-1.021 8.52-.6 11.64 1.32.42.18.479.659.301 1.02zm1.44-3.3c-.301.42-.841.6-1.262.3-3.239-1.98-8.159-2.58-11.939-1.38-.479.12-1.02-.12-1.14-.6-.12-.48.12-1.021.6-1.141C9.6 9.9 15 10.561 18.72 12.84c.361.181.54.78.241 1.2zm.12-3.36C15.24 8.4 8.82 8.16 5.16 9.301c-.6.179-1.2-.181-1.38-.721-.18-.601.18-1.2.72-1.381 4.26-1.26 11.28-1.02 15.721 1.621.539.3.719 1.02.419 1.56-.299.421-1.02.599-1.559.3z"/></svg>
                                            </a>
                                        </li>
                                    </ul>
                              </div>
                         </div>
                      </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSourceDiscography" runat="server"
                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\simplyalmonds.mdb" 
                    ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [discography]"></asp:SqlDataSource>

            </div>
        </div>
    </div>

</asp:Content>
