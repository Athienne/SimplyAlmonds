using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb; 

namespace SimplyAlmonds.AdminPages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Redirect("~/Website%20(Front-End)/LoginUser.aspx");
            }
            else if (Session["role"].ToString() == "user")
            {
                Response.Redirect("~/Website%20(Front-End)/Home.aspx");
            }
        }

        protected void membersBiography_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            FileUpload newfileuploadcontrol = membersBiography.FindControl("FileUploadAddPic") as FileUpload;
            TextBox memberName = membersBiography.FindControl("memnameTextBox") as TextBox;
            TextBox memberPosition = membersBiography.FindControl("mempositionTextBox") as TextBox;

            if (newfileuploadcontrol.HasFile)
            {
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();
                string sqlComm = "UPDATE biography SET mempic = @picname " +
                    "WHERE memname = @memname and memposition = @memberPosition;";
                OleDbCommand cmd = new OleDbCommand(sqlComm, conn);
                cmd.Parameters.AddWithValue("@picname", newfileuploadcontrol.FileName);
                cmd.Parameters.AddWithValue("@memname", memberName.Text);
                cmd.Parameters.AddWithValue("@memposition", memberPosition.Text);
                cmd.ExecuteNonQuery();
                conn.Close();
                string path = Server.MapPath("~/Pictures/") + newfileuploadcontrol.FileName;
                newfileuploadcontrol.SaveAs(path);

            }
        }

        protected void membersBiography_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload newfileuploadcontrol = membersBiography.FindControl("FileUploadEditPic") as FileUpload;
            Label memberNumber = membersBiography.FindControl("lblmemnumber") as Label;
            Image picName = membersBiography.FindControl("imgMemPic") as Image;
            string oldPicName = picName.ImageUrl.Substring(11);
            if (newfileuploadcontrol.HasFile)
            {
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();
                string sqlComm = "UPDATE biography SET mempic = @picname " +
                    "WHERE memnumber = @memberNumber;";
                OleDbCommand cmd = new OleDbCommand(sqlComm, conn);
                cmd.Parameters.AddWithValue("@picname", newfileuploadcontrol.FileName);
                cmd.Parameters.AddWithValue("@memberNumber", memberNumber.Text);
                cmd.ExecuteNonQuery();
                conn.Close();
                System.IO.File.Delete(Server.MapPath("~/Pictures/") + oldPicName);
                newfileuploadcontrol.SaveAs(Server.MapPath("~/Pictures/") + newfileuploadcontrol.FileName);
            }
        }

        protected void membersBiography_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            Label picName = membersBiography.FindControl("picLabel") as Label;
            string path = Server.MapPath("~/Pictures/") + picName.Text;
            System.IO.File.Delete(path);
        }

    }
}