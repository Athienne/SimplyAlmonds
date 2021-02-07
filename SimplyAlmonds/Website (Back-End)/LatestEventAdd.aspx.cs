using System;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class LatestEventAdd : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addNewEvent_Click(object sender, EventArgs e)
        {
            // Verify if Event Title and Event Details are not null
            if (EventTitle_text.Text != "" && EventDetails_text.Text != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#myModal').modal('show')", true);
            }
        }
        protected void addevent_Click(object sender, EventArgs e)
        {
            // Opens database connection, adds a new record in the database and closes the connection
            // Immediate redirects to the Admin Home Page

            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            strSQL = "INSERT INTO table_LatestEvents (EventTitle, EventDetails, DateAdded) " +
                "VALUES (@eventtitle, @eventdetails, '" + DateTime.Now + "')";
            objCmd = new OleDbCommand(strSQL, objConn);
            objCmd.Parameters.AddWithValue("@eventtitle", EventTitle_text.Text);
            objCmd.Parameters.AddWithValue("@eventdetails", EventDetails_text.Text);
            objCmd.ExecuteNonQuery();
            objConn.Close();
            Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
        }
    }
}