using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class AccountAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";

            connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbDataReader dtReader;
            string strSQL = "SELECT username, passw, email, active FROM users";
            OleDbCommand objCmd = new OleDbCommand(strSQL, conn);
            dtReader = objCmd.ExecuteReader();

            accounts.DataSource = dtReader;
            accounts.DataBind();

            dtReader.Close();
            conn.Close();
        }
    }
}