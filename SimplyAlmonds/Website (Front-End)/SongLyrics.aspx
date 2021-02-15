<%@ Page Title="Lyrics" Language="C#" MasterPageFile="~/UserPages/MasterUser.Master" AutoEventWireup="true" CodeBehind="SongLyrics.aspx.cs" Inherits="SimplyAlmonds.UserPages.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
        .center {
            margin: 0 auto;
            margin-left:auto; 
            margin-right:auto;
            width:100%
         }
        .txtLyrics {
            border:none;
            text-align:center;
            resize: none;
         }
    </style>

</asp:Content>
<asp:Content ID="songLyricsContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section class="py-5 text-center container">
        <div class="row py-lg-5">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">DISCOGRAPHY</h1>
            <p class="lead text-muted">Simply Almonds' Single</p>
          </div>
        </div>
      </section>
  

    <asp:DataList ID="dataListLyrics" runat="server" DataKeyField="songID" DataSourceID="SqlDataSourceLyrics"  class="center" Width="50%">
        <ItemTemplate>
                

       <table class="center">
        <tr class="center">
            <td class="text-center">
                <asp:Image ID="songImg" runat="server" ImageUrl='<%# String.Format("~/Pictures/{0}", Eval("songPicture")) %>'  class="bd-placeholder-img" width="200px" height="200px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"/><title>Single Pic</title>
            </td>
        </tr>
        <tr class="center">
            <td class="text-center">
                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("songTitle") %>' Font-Size="XX-Large" ></asp:Label>
            </td>
        </tr>
        <tr class="center">
            <td class="text-center">
                <a href='<%# Eval("songSpotify") %>' target="_blank" >
                    <svg width="50px" height="50px" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Listen on Spotify</title><path d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.66 0 12 0zm5.521 17.34c-.24.359-.66.48-1.021.24-2.82-1.74-6.36-2.101-10.561-1.141-.418.122-.779-.179-.899-.539-.12-.421.18-.78.54-.9 4.56-1.021 8.52-.6 11.64 1.32.42.18.479.659.301 1.02zm1.44-3.3c-.301.42-.841.6-1.262.3-3.239-1.98-8.159-2.58-11.939-1.38-.479.12-1.02-.12-1.14-.6-.12-.48.12-1.021.6-1.141C9.6 9.9 15 10.561 18.72 12.84c.361.181.54.78.241 1.2zm.12-3.36C15.24 8.4 8.82 8.16 5.16 9.301c-.6.179-1.2-.181-1.38-.721-.18-.601.18-1.2.72-1.381 4.26-1.26 11.28-1.02 15.721 1.621.539.3.719 1.02.419 1.56-.299.421-1.02.599-1.559.3z"/></svg>
                </a>
            </td>
        </tr>
        <tr class="center">
            <td class="text-center">
                <br />
                Song Information
                <br />
                <asp:Label ID="lblSongInfo" runat="server" Text='<%# Eval("songInfo") %>' Font-Size="Large"></asp:Label>
            </td>
        </tr>
           <tr class="center">
            <td class="text-center">&nbsp;</td>
        </tr>
        <tr class="center">
            <td class="text-center">
                <br /><br />
                Lyrics:
                <br />
                <br />
                <asp:TextBox ID="txtLyrics" runat="server" Text='<%# Eval("songLyrics") %>'  Width="100%" Font-Size="Medium" TextMode="MultiLine" Rows="100"  CssClass="txtLyrics"></asp:TextBox>
            </td>
        </tr>
    </table>    


                  
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSourceLyrics" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\simplyalmonds.mdb" 
        ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [discography] WHERE (songID = @songID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="songID" QueryStringField="songID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
