using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Front_End_
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                String strConnString;
                strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
                objConn = new OleDbConnection(strConnString);
                objConn.Open();

                // Intial load of Latest Events and News
                strSQL = "SELECT * FROM Shop where ProductType='Ticket'";

                OleDbDataReader dtReader;
                objCmd = new OleDbCommand(strSQL, objConn);
                dtReader = objCmd.ExecuteReader();

                TicketRepeater.DataSource = dtReader;
                TicketRepeater.DataBind();

                strSQL = "SELECT * FROM Shop where ProductType='Single'";
                objCmd = new OleDbCommand(strSQL, objConn);
                dtReader = objCmd.ExecuteReader();

                SingleRepeater.DataSource = dtReader;
                SingleRepeater.DataBind();

                dtReader.Close();
                objConn.Close();
            }
        }
    }
}