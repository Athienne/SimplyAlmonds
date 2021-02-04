using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Front_End_
{
    public partial class home : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            try
            {
                this.Page.MasterPageFile = "~/UserPages/MasterUser.master";
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
            strSQL = "SELECT EventTitle, EventDetails, DateAdded FROM table_LatestEvents";

            OleDbDataReader dtReader;
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            latestEvents_repeater.DataSource = dtReader;
            latestEvents_repeater.DataBind();

            strSQL = "SELECT NewsTitle, NewsDetails, DateAdded FROM table_News";
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            news_repeater.DataSource = dtReader;
            news_repeater.DataBind();

            dtReader.Close();
            objConn.Close();
        }
    }
}