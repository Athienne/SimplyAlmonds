﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Front_End_
{
    public partial class Shop : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "admin")
                {
                    Response.Redirect("~/Website%20(Back-End)/ShopAdmin.aspx");
                }
            }

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

        protected void minus_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;

            Button minusButton = (Button)item.FindControl("minusButton");
            TextBox qtyText = (TextBox)item.FindControl("quantityTxt");
            bool minusClicked = button == minusButton;
            int qty = int.Parse(qtyText.Text);

            if (minusClicked && qty > 1)
            {
                qty -= 1;
                qtyText.Text = qty.ToString();
            }
        }
        protected void plus_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;
            var argument = ((Button)sender).CommandArgument;

            Button plusButton = (Button)item.FindControl("plusButton");
            TextBox qtyText = (TextBox)item.FindControl("quantityTxt");
            bool plusClicked = button == plusButton;
            int qty = int.Parse(qtyText.Text);

            if (plusClicked && qty < int.Parse(argument))
            {
                qty += 1;
                qtyText.Text = qty.ToString();
            }
        }

        protected void addToCartButton_Click(object sender, EventArgs e)
        {
                string quantity = "1";
                RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
                quantity = (item.FindControl("quantityTxt") as TextBox).Text;

                OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
                conn.Open();

                OleDbCommand checker = new OleDbCommand("SELECT ProductType FROM Shop WHERE ShopID = " + Int32.Parse(((Button)sender).CommandArgument) + "", conn);
                string chk = (string)checker.ExecuteScalar();

                OleDbCommand pricecmd = new OleDbCommand("SELECT ProductPrice FROM Shop WHERE ShopID = " + Int32.Parse(((Button)sender).CommandArgument) + "", conn);
                double price = (double)pricecmd.ExecuteScalar();

                OleDbCommand qCmd = new OleDbCommand("INSERT INTO cart VALUES(" + getUniqueID() + ", " + Int32.Parse(((Button)sender).CommandArgument) + "," + Convert.ToInt32(quantity) + "," + (price * Convert.ToInt32(quantity)) + ")", conn);
                qCmd.ExecuteNonQuery();

                conn.Close();
                Response.Write("<script>alert('" + "Added to Cart." + "')</script>");
        }

        protected void addToCartButtonProd_Click(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();

            OleDbCommand checker = new OleDbCommand("SELECT ProductType FROM Shop WHERE ShopID = " + Int32.Parse(((Button)sender).CommandArgument) + "", conn);
            string chk = (string)checker.ExecuteScalar();

            OleDbCommand pricecmd = new OleDbCommand("SELECT ProductPrice FROM Shop WHERE ShopID = " + Int32.Parse(((Button)sender).CommandArgument) + "", conn);
            double price = (double)pricecmd.ExecuteScalar();

            OleDbCommand qCmd = new OleDbCommand("INSERT INTO cart VALUES(" + getUniqueID() + ", " + Int32.Parse(((Button)sender).CommandArgument) + ",1," + (price * 1) + ")", conn);
            qCmd.ExecuteNonQuery();

            conn.Close();
            Response.Write("<script>alert('" + "Added to Cart." + "')</script>");
        }

        public int getUniqueID()
        {
            try
            {
                OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
                conn.Open();
                OleDbCommand qCmd = new OleDbCommand("SELECT MAX(CartID) FROM cart;", conn);
                int uniqueid = ((int)qCmd.ExecuteScalar() + 1);
                conn.Close();

                return uniqueid;
            }
            catch
            {
                return 0;
            }
        }

    }
}