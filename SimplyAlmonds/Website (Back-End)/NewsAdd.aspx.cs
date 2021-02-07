using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class NewsAdd : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addNews_Click(object sender, EventArgs e)
        {
            // Verify if News Title and News Details are not null
            if (NewsTitle_text.Text != "" && NewsDetails_text.Text != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#myModal').modal('show')", true);
            }
        }

        protected void addnewsdata_Click(object sender, EventArgs e)
        {
            // Opens database connection, adds a new record in the database and closes the connection
            // Immediate redirects to the Admin Home Page

            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            strSQL = "INSERT INTO table_News (NewsTitle, NewsDetails, DateAdded) " +
                "VALUES (@newstitle, @newsdetails, '" + DateTime.Now + "')";
            objCmd = new OleDbCommand(strSQL, objConn);
            objCmd.Parameters.AddWithValue("@newstitle", NewsTitle_text.Text);
            objCmd.Parameters.AddWithValue("@newsdetails", NewsDetails_text.Text);
            objCmd.ExecuteNonQuery();
            objConn.Close();
            Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
        }
    }
}