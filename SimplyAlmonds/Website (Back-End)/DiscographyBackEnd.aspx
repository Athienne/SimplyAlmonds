<%@ Page Title="Discography - BackEnd" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DiscographyBackEnd.aspx.cs" Inherits="SimplyAlmonds.AdminPages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .rfvStyle {
            color: red;
            font-size: medium;
            font-family: Helvetica, Arial, sans-serif;
        }
        .formViewStyle {
            margin-left: auto;
            margin-right: auto;
            border: 2px solid black;
        }
        </style>
</asp:Content>
<asp:Content ID="discographyBackEndContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">DISCOGRAPHY</h1>
          </div>
        </div>
      </section>

    <asp:FormView ID="bandDiscograhy" runat="server" AllowPaging="True" CellPadding="4" 
        DataSourceID="SqlDataSourceDiscography" ForeColor="#333333" Width="400px" Height="400px" 
        DataKeyNames="songID" CssClass="formViewStyle" OnItemDeleting="bandDiscograhy_ItemDeleting"
        OnItemInserted="bandDiscograhy_ItemInserted" OnItemUpdating="bandDiscograhy_ItemUpdating">

        <EditItemTemplate>
            Song ID:
            <asp:Label ID="lblSongID" runat="server" Text='<%# Eval("songID") %>' />
            <br />
            Song Title: <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("songTitle") %>' Width="100%" />
            <br />
            Information: <asp:RequiredFieldValidator ID="rfvInfo" runat="server" ControlToValidate="txtInfo" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtInfo" runat="server" Text='<%# Bind("songInfo") %>'  TextMode="MultiLine" Rows="2"  Width="100%"/>
            <br />
            Picture:
            <br />
            <asp:Image ID="imgMemPic" runat="server" ImageUrl='<%# String.Format("~/Pictures/{0}", Eval("songPicture")) %>' Width="200" Height="200" />
            <br />
            Change to New Picture:
            <asp:FileUpload ID="FileUploadEditPic" runat="server" />
            <br />
            Spotify:  <asp:RequiredFieldValidator ID="rfvSpotify" runat="server" ControlToValidate="txtSpotify" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtSpotify" runat="server" Text='<%# Bind("songSpotify") %>' CssClass="txtNotResizable" Width="100%" />
            <br />
            Lyrics: <asp:RequiredFieldValidator ID="rfvLyrics" runat="server" ControlToValidate="txtLyrics" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtLyrics" runat="server" Text='<%# Bind("songLyrics") %>' TextMode="MultiLine" Rows="30"  Width="100%"/>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>

        <EmptyDataTemplate>
            NO DATA FOUND
        </EmptyDataTemplate>

        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />

        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <div class="text-center">
                SIMPLY ALMOND&#39;S SINGLES
            </div>
        </HeaderTemplate>

        <InsertItemTemplate>
            <br />
            Song Title:<asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="titleTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("songTitle") %>' width="100%"/>
            <br />
            <br />
            Information:  <asp:RequiredFieldValidator ID="rfvInfo" runat="server" ControlToValidate="infoTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="infoTextBox" runat="server" Text='<%# Bind("songInfo") %>' TextMode="MultiLine" Rows="2"  Width="100%" />
            <br />
            <br />
            Picture:<asp:RequiredFieldValidator ID="rfvImg" runat="server" ControlToValidate="FileUploadAddPic" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:FileUpload ID="FileUploadAddPic" runat="server" />
            <br />
            <br />
            Spotify Link:  <asp:RequiredFieldValidator ID="rfvSpotify" runat="server" ControlToValidate="spotifyTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="spotifyTextBox" runat="server" Text='<%# Bind("songSpotify") %>'  Width="100%"/>
            <br />
            <br />
            Lyrics: <asp:RequiredFieldValidator ID="rfvLyrics" runat="server" ControlToValidate="lyricsTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="lyricsTextBox" runat="server" Text='<%# Bind("songLyrics") %>' TextMode="MultiLine" Rows="30"  Width="100%"/>
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>

        <ItemTemplate>
            Song ID:
            <asp:Label ID="songIDLabel" runat="server" Text='<%# Eval("songID") %>' />
            <br />
            Song Title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("songTitle") %>' />
            <br />
            Information:
            <asp:Label ID="infoLabel" runat="server" Text='<%# Bind("songInfo") %>' TextMode="MultiLine" Rows="2"  Width="100%"/>
            <br />
            Picture:
            <br />
            <asp:Image ID="imgSinglePic" runat="server" ImageUrl='<%# String.Format("~/Pictures/{0}", Eval("songPicture")) %>' Width="200" Height="200" />
            <br />
            Picture Name:
            <asp:Label ID="picLabel" runat="server" Text='<%# Bind("songPicture") %>'></asp:Label>
            <br />
            Spotify Link:
            <asp:Label ID="spotifyLabel" runat="server" Text='<%# Bind("songSpotify") %>' />
            <br />
            Lyrics:
            <asp:TextBox ID="lyricsLabel" runat="server" Text='<%# Bind("songLyrics") %>' TextMode="MultiLine" Rows="30"  Width="100%" Enabled="False" ReadOnly="True" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>

        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>


    <asp:SqlDataSource ID="SqlDataSourceDiscography" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\simplyalmonds.mdb;Persist Security Info=True" 
        ProviderName="System.Data.OleDb" 
        SelectCommand="SELECT * FROM [discography]" 
        DeleteCommand="DELETE * FROM discography WHERE (songID = @songID)" 
        InsertCommand="INSERT INTO discography(songTitle, songInfo, songSpotify, songLyrics) VALUES (@songTitle, @songInfo, @songSpotify,@songLyrics)" 
        UpdateCommand='UPDATE [discography] SET songTitle = @songTitle, songInfo = @songInfo, songSpotify = @songSpotify, songLyrics = @songLyrics WHERE songID = @songID'>
        
    </asp:SqlDataSource>


</asp:Content>
