using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class SalesSummary : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {
            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            DataSet ds = new DataSet();
            strSQL = "SELECT TOP 1 SUM(quantity) FROM [order] GROUP BY productID ORDER BY SUM(quantity)";
            OleDbDataAdapter dtAdapter = new OleDbDataAdapter(strSQL, objConn);
            dtAdapter.Fill(ds);
            PieChartProducts.DataSource = ds;
            
        }
    }
}