using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace SimplyAlmonds.Website__Front_End_
{
    public partial class AboutUs : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();
            string st = "SELECT * FROM about;";
            OleDbCommand dbc = new OleDbCommand(st, conn);
            OleDbDataReader read = dbc.ExecuteReader();

            if (read.Read())
            {
                aboutDetails.Text = read.GetString(read.GetOrdinal("companyabout"));
                bandDetails.Text = read.GetString(read.GetOrdinal("bandabout"));
                companyInquire.Text = read.GetString(read.GetOrdinal("companyname")) + ": " + read.GetString(read.GetOrdinal("companyemail")) + " " + read.GetString(read.GetOrdinal("companynumber"));
                bandInquire.Text = read.GetString(read.GetOrdinal("bandname")) + ": " + read.GetString(read.GetOrdinal("bandemail")) + " " + read.GetString(read.GetOrdinal("bandnumber"));
            }

            read.Close();
            conn.Close();

        }
    }
}