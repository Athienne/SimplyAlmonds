using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.AdminPages
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "user")
                {
                    Response.Redirect("~/Website%20(Front-End)/Discography.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Website%20(Front-End)/LoginUser.aspx");
            }
        }

        protected void bandDiscograhy_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            FileUpload newfileuploadcontrol = bandDiscograhy.FindControl("FileUploadAddPic") as FileUpload;
            TextBox sTitle = bandDiscograhy.FindControl("titleTextBox") as TextBox;
            TextBox sInfo = bandDiscograhy.FindControl("infoTextBox") as TextBox;

            if (newfileuploadcontrol.HasFile)
            {
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();
                string sqlComm = "UPDATE discography SET songPicture = @picname " +
                    "WHERE songTitle = @title and songInfo = @info;";
                OleDbCommand cmd = new OleDbCommand(sqlComm, conn);
                cmd.Parameters.AddWithValue("@picname", newfileuploadcontrol.FileName);
                cmd.Parameters.AddWithValue("@title", sTitle.Text);
                cmd.Parameters.AddWithValue("@info", sInfo.Text);
                cmd.ExecuteNonQuery();
                conn.Close();
                string path = Server.MapPath("~/Pictures/") + newfileuploadcontrol.FileName;
                newfileuploadcontrol.SaveAs(path);

            }
        }

        protected void bandDiscograhy_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            Label picName = bandDiscograhy.FindControl("picLabel") as Label;
            string path = Server.MapPath("~/Pictures/") + picName.Text;
            System.IO.File.Delete(path);
        }

        protected void bandDiscograhy_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload newfileuploadcontrol = bandDiscograhy.FindControl("FileUploadEditPic") as FileUpload;
            Label songNum = bandDiscograhy.FindControl("lblSongID") as Label;
            Image picName = bandDiscograhy.FindControl("imgMemPic") as Image;
            string oldPicName = picName.ImageUrl.Substring(11);
            if (newfileuploadcontrol.HasFile)
            {
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();
                string sqlComm = "UPDATE discography SET songPicture = @picname " +
                    "WHERE songID = @songID;";
                OleDbCommand cmd = new OleDbCommand(sqlComm, conn);
                cmd.Parameters.AddWithValue("@picname", newfileuploadcontrol.FileName);
                cmd.Parameters.AddWithValue("@songID", songNum.Text);
                cmd.ExecuteNonQuery();
                conn.Close();
                System.IO.File.Delete(Server.MapPath("~/Pictures/") + oldPicName);
                newfileuploadcontrol.SaveAs(Server.MapPath("~/Pictures/") + newfileuploadcontrol.FileName);
            }
        }

    }
}