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
        String strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "user")
                {
                    Response.Redirect("~/Website%20(Front-End)/Home.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Website%20(Front-End)/LoginUser.aspx");
            }

            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            DataSet ds = new DataSet();
            strSQL = "SELECT Shop.ProductName, SUM([order].quantity) FROM [order] INNER JOIN Shop ON [order].productID = Shop.ShopID GROUP BY ProductName ORDER BY SUM([order].quantity)";
            OleDbDataAdapter dtAdapter = new OleDbDataAdapter(strSQL, objConn);
            dtAdapter.Fill(ds);
            PieChartProducts.DataSource = ds;
            PieChartProducts.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Pie;
            PieChartProducts.Legends[0].Enabled = true;

            strSQL = "SELECT TOP 1 Shop.ProductName, SUM([order].quantity) FROM [order] INNER JOIN Shop ON [order].productID = Shop.ShopID GROUP BY ProductName ORDER BY SUM([order].quantity) DESC";
            OleDbCommand topCmd = new OleDbCommand(strSQL, objConn);
            OleDbDataReader topReader = topCmd.ExecuteReader();

            while (topReader.Read())
            {
                topLabel.Text = topReader.GetString(0);
            }

            strSQL = "SELECT TOP 1 Shop.ProductName, SUM([order].quantity) FROM [order] INNER JOIN Shop ON [order].productID = Shop.ShopID GROUP BY ProductName ORDER BY SUM([order].quantity)";
            OleDbCommand botCmd = new OleDbCommand(strSQL, objConn);
            OleDbDataReader botReader = botCmd.ExecuteReader();

            while (botReader.Read())
            {
                botLabel.Text = botReader.GetString(0);
            }

            DataSet SingleDS = new DataSet();
            strSQL = "SELECT Buyers, Month_Name " +
                    "FROM (" +
                    "SELECT Format(dateofpurchase, 'm') AS Month_Start, Format(dateofpurchase, 'mmm') AS Month_Name, SUM(quantity) AS Buyers " +
                    "FROM [order] " +
                    "WHERE (prodtype = 'Single') " +
                    "GROUP BY Format(dateofpurchase, 'm'), Format(dateofpurchase, 'mmm') " +
                    ") sub " +
                    "ORDER BY Month_Start"
                ;
            OleDbDataAdapter SingleAdapter = new OleDbDataAdapter(strSQL, objConn);
            SingleAdapter.Fill(SingleDS);
            SinglesChart.DataSource = SingleDS;


            //Ticket Data
            DataSet TicketDS = new DataSet();
            strSQL = "SELECT Buyers, Month_Name " +
                    "FROM (" +
                    "SELECT Format(dateofpurchase, 'm') AS Month_Start, Format(dateofpurchase, 'mmm') AS Month_Name, SUM(quantity) AS Buyers " +
                    "FROM [order] " +
                    "WHERE (prodtype = 'Ticket') " +
                    "GROUP BY Format(dateofpurchase, 'm'), Format(dateofpurchase, 'mmm') " +
                    ") sub " +
                    "ORDER BY Month_Start"
                ;
            OleDbDataAdapter TicketAdapter = new OleDbDataAdapter(strSQL, objConn);
            TicketAdapter.Fill(TicketDS);
            TicketChart.DataSource = TicketDS;
        }
    }
}