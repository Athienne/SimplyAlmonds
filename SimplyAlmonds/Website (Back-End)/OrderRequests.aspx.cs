using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class OrderRequests : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL, strConnString;

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

            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            // Intial load of Latest Events and News
            strSQL = "SELECT * FROM [order]";

            OleDbDataReader dtReader;
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            orderlist.DataSource = dtReader;
            orderlist.DataBind();

            dtReader.Close();
            objConn.Close();
        }

        protected void orderDetails_Click(object sender, EventArgs e)
        {
            // Value Holder for Date Purchased
            DateTime time = new DateTime(2000, 1, 1);

            // Get ID Value from LinkButton
            int value = Convert.ToInt32((sender as LinkButton).CommandArgument);
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            // Intial load of Latest Events and News
            strSQL = "SELECT [order].*, users.email FROM users LEFT JOIN [order] ON users.username = [order].username WHERE orderID = " + value + "";

            OleDbDataReader dtReader;
            objCmd = new OleDbCommand(strSQL, objConn);
            dtReader = objCmd.ExecuteReader();

            while (dtReader.Read())
            {
                productLabel.Text = dtReader.GetString(2);
                time = dtReader.GetDateTime(3);
                usernameLabel.Text = dtReader.GetString(4);
                quantityLabel.Text = dtReader.GetInt32(5).ToString();
                statusLabel.Text = dtReader.GetString(6);
                emailLabel.Text = dtReader.GetString(7);
            }

            dateLabel.Text = time.Date.ToString("MM/dd/yyyy");
            dtReader.Close();
            objConn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalDetails').modal('show')", true);
        }

        protected void markModal_Click(object sender, EventArgs e)
        {
            // Store ID Value in Session
            int value = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Session["IdforMarking"] = value.ToString();

            // Invoke Modal for marking of Finished Orders
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalMark').modal('show')", true);
        }

        protected void yes_mark_Click(object sender, EventArgs e)
        {
            int idvalueholder = Convert.ToInt32(Session["IdforMarking"]);
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            strSQL = "UPDATE [order] SET status = 'Finished' WHERE orderID = " + idvalueholder + "";
            objCmd = new OleDbCommand(strSQL, objConn);
            objCmd.ExecuteNonQuery();
            Session.Remove("IdForMarking");
            Response.Redirect("~/Website%20(Back-End)/OrderRequests.aspx");
        }
    }
}