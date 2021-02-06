using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website_Back_End_
{
    public partial class HomeAdmin : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            try
            {
                this.Page.MasterPageFile = "~/AdminPages/AdminMaster.master";
            }
            catch (Exception ex)
            {

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            // Intial load of Latest Events and News
            strSQL = "SELECT * FROM table_LatestEvents";

            OleDbDataReader dtReader;
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            latestEvents_repeater.DataSource = dtReader;
            latestEvents_repeater.DataBind();

            strSQL = "SELECT * FROM table_News";
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            news_repeater.DataSource = dtReader;
            news_repeater.DataBind();

            dtReader.Close();
            objConn.Close();
        }

        // Code commented for future references
        // Do not delete, thanks~!

        /*
        protected void DisplayLatestEvents()
        {
            objConn.Open();
            strSQL = "SELECT EventTitle, EventDetails, DateAdded FROM table_LatestEvents";
            OleDbDataReader dtReader;
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            latestEvents_repeater.DataSource = dtReader;
            latestEvents_repeater.DataBind();

            dtReader.Close();
            objConn.Close();
        }

        protected void DisplayNews()
        {
            objConn.Open();
            strSQL = "SELECT NewsTitle, NewsDetails, DateAdded FROM table_News";
            OleDbDataReader dtReader;
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            news_repeater.DataSource = dtReader;
            news_repeater.DataBind();

            dtReader.Close();
            objConn.Close();
        }
        */

        protected void addLatestEvents_Click(object sender, EventArgs e)
        {
            // Go to LatestEventAdd Page
            Response.Redirect("~/Website%20(Back-End)/LatestEventAdd.aspx");
        }

        protected void editLatestEvents_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('editlatestevents button works!')</script>");

            // Code for editing latest events
            //
            //
            //
        }

        protected void deleteLatestEvents_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('deletelatestevents button works!')</script>");

            // Code for delete latest events
            //
            //
            //
        }

        protected void addNews_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('addnews button works!')</script>");
        }

        protected void editNews_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('editnews button works!')</script>");
        }

        protected void deleteNews_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('deletenews button works!')</script>");
        }
    }
}