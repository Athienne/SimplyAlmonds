using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class LatestEventEdit : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL, strConnString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                HttpContext con = HttpContext.Current;
                int idvalue = int.Parse(con.Request["id"]);

                strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
                objConn = new OleDbConnection(strConnString);
                objConn.Open();

                // Load Event Data
                strSQL = "SELECT EventTitle, EventDetails FROM table_LatestEvents WHERE ID = " + idvalue + "";
                objCmd = new OleDbCommand(strSQL, objConn);
                OleDbDataReader reader = objCmd.ExecuteReader();

                while (reader.Read())
                {
                    editEventTitle_text.Text = reader.GetString(0);
                    editEventDetails_text.Text = reader.GetString(1);
                }

                reader.Close();
                objConn.Close();
            }
        }

        protected void alterconfirm_Click(object sender, EventArgs e)
        {
            // Verify if Event Title and Event Details are not null
            if (editEventTitle_text.Text != "" && editEventDetails_text.Text != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalEdit').modal('show')", true);
            }
        }

        protected void yes_editlatestevent_Click(object sender, EventArgs e)
        {
            HttpContext con = HttpContext.Current;
            int idvalue = int.Parse(con.Request["id"]);
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            // Update Event Data
            strSQL = "UPDATE table_LatestEvents SET EventTitle = '" + editEventTitle_text.Text + "', EventDetails = '" + editEventDetails_text.Text + "', DateAdded = '" + DateTime.Now + "' " +
                "WHERE ID = " + idvalue + ";";
            objCmd = new OleDbCommand(strSQL, objConn);
            objCmd.ExecuteNonQuery();
            objConn.Close();
            Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
        }

        protected void yes_deletelatestevent_Click(object sender, EventArgs e)
        {

        }
    }
}