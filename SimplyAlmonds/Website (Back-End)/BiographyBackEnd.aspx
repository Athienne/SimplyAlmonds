<%@ Page Title="Biography - Back-End" Language="C#" MasterPageFile="~/AdminPages/AdminMaster.Master" AutoEventWireup="true" CodeBehind="BiographyBackEnd.aspx.cs" Inherits="SimplyAlmonds.AdminPages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .rfvStyle {
            color: red;
            font-size: medium;
            font-family: Helvetica, Arial, sans-serif;
        }
        .txtNotResizable{
            resize: none;
        }
        .formViewStyle {
            margin-left: auto;
            margin-right: auto;
            border: 2px solid black;
        }
    </style>

</asp:Content>
<asp:Content ID="biographyBackEndContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">BIOGRAPHY</h1>
          </div>
        </div>
      </section>

    <asp:FormView ID="membersBiography" runat="server" AllowPaging="True" CellPadding="4" 
        DataSourceID="SqlDataSourceBiography" ForeColor="#333333" Width="400px" Height="400px" 
        OnItemUpdating="membersBiography_ItemUpdating" OnItemInserted="membersBiography_ItemInserted"
        OnItemDeleting="membersBiography_ItemDeleting" DataKeyNames="memnumber" CssClass="formViewStyle">

        <EditItemTemplate>
            Member Number:
            <asp:Label ID="lblmemnumber" runat="server" Text='<%# Eval("memnumber") %>' />
            <br />
            Name: <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="memnameTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="memnameTextBox" runat="server" Text='<%# Bind("memname") %>' />
            <br />
            <br />
            Position:<asp:RequiredFieldValidator ID="rfvPosition" runat="server" ControlToValidate="mempositionTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="mempositionTextBox" runat="server" Text='<%# Bind("memposition") %>' />
            <br />
            Picture:
            <br />
            <asp:Image ID="imgMemPic" runat="server" ImageUrl='<%# String.Format("~/Pictures/{0}", Eval("mempic")) %>' Width="200" Height="200" />
            <br />
            Change to New Picture:
            <asp:FileUpload ID="FileUploadEditPic" runat="server" />
            <br />
            Facebook:<asp:RequiredFieldValidator ID="rfvFb" runat="server" ControlToValidate="memfacebookTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="memfacebookTextBox" runat="server" Text='<%# Bind("memfacebook") %>' TextMode="MultiLine" Rows="3" CssClass="txtNotResizable" Width="70%" />
            <br />
            Twitter:<asp:RequiredFieldValidator ID="rfvTwitter" runat="server" ControlToValidate="memtwitterTextBox" CssClass="rfvStyle" SetFocusOnError="True">* is REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="memtwitterTextBox" runat="server" Text='<%# Bind("memtwitter") %>' TextMode="MultiLine" Rows="3" CssClass="txtNotResizable" Width="70%"/>
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
                SIMPLY ALMOND&#39;S MEMBERS
            </div>
        </HeaderTemplate>

        <InsertItemTemplate>
            <br />
            Name:  <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="memnameTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="memnameTextBox" runat="server" Text='<%# Bind("memname") %>' />
            <br />
            <br />
            Position:<asp:RequiredFieldValidator ID="rfvPosition" runat="server" ControlToValidate="mempositionTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="mempositionTextBox" runat="server" Text='<%# Bind("memposition") %>' />
            <br />
            <br />
            Picture:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="FileUploadAddPic" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <asp:FileUpload ID="FileUploadAddPic" runat="server" />
            <br />
            <br />
            Facebook Link:<asp:RequiredFieldValidator ID="rfvFb" runat="server" ControlToValidate="memfacebookTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:TextBox ID="memfacebookTextBox" runat="server" Text='<%# Bind("memfacebook") %>' TextMode="MultiLine" Rows="3" CssClass="txtNotResizable" Width="70%"/>
            <br />
            <br />
            Twitter Link:<asp:RequiredFieldValidator ID="rfvTwitter" runat="server" ControlToValidate="memtwitterTextBox" CssClass="rfvStyle" SetFocusOnError="True">* REQUIRED</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:TextBox ID="memtwitterTextBox" runat="server" Text='<%# Bind("memtwitter") %>' TextMode="MultiLine" Rows="3" CssClass="txtNotResizable" Width="70%"/>
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>

        <ItemTemplate>
            Member Number:
            <asp:Label ID="memnumberLabel" runat="server" Text='<%# Eval("memnumber") %>' />
            <br />
            Name:
            <asp:Label ID="memnameLabel" runat="server" Text='<%# Bind("memname") %>' />
            <br />
            Position:
            <asp:Label ID="mempositionLabel" runat="server" Text='<%# Bind("memposition") %>' />
            <br />
            Picture:
            <br />
            <asp:Image ID="imgMemPic" runat="server" ImageUrl='<%# String.Format("~/Pictures/{0}", Eval("mempic")) %>' Width="200" Height="200" />
            <br />
            Picture Name:<asp:Label ID="picLabel" runat="server" Text='<%# Bind("mempic") %>'></asp:Label>
            <br />
            Facebook Link:
            <asp:Label ID="memfacebookLabel" runat="server" Text='<%# Bind("memfacebook") %>' />
            <br />
            Twitter Link:
            <asp:Label ID="memtwitterLabel" runat="server" Text='<%# Bind("memtwitter") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>

        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>


    <asp:SqlDataSource ID="SqlDataSourceBiography" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\simplyalmonds.mdb;Persist Security Info=True" 
        ProviderName="System.Data.OleDb" 
        SelectCommand="SELECT * FROM [biography]" 
        DeleteCommand="DELETE * FROM biography WHERE (memnumber = @memnumber)" 
        InsertCommand="INSERT INTO biography(memname, memposition, memfacebook, memtwitter) VALUES (@memname, @memposition, @memfacebook,@memtwitter)" 
        UpdateCommand='UPDATE [biography] SET memname = @memname, memposition = @memposition, memfacebook = @memfacebook, memtwitter = @memtwitter WHERE memnumber = @memnumber'>
        
    </asp:SqlDataSource>

</asp:Content>
