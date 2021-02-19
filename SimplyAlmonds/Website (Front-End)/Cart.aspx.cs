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
    public partial class Cart : System.Web.UI.Page
    {
        public void connection()
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();
            string st = "SELECT * FROM cart INNER JOIN Shop ON cart.ShopID = Shop.ShopID;";
            OleDbCommand dbc = new OleDbCommand(st, conn);
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter(dbc);
            da.Fill(ds);
            CartItemRepeater.DataSource = ds;
            CartItemRepeater.DataBind();
            conn.Close();

            totalPriceProd.InnerHtml = getTotalPrice();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                connection();
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

        public string getTotalPrice()
        {
            try
            {
                OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
                string query = "SELECT SUM(TotalPrice) from cart;";
                OleDbCommand command = new OleDbCommand(query, conn);
                conn.Open();
                double total = (double)command.ExecuteScalar();
                conn.Close();
                return String.Format("₱ {0:N2}", total);
            }
            catch
            {
                return String.Format("₱ 0.00");
            }
        }

        protected void removeButton_Click(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();
            OleDbCommand qCmd = new OleDbCommand("DELETE FROM cart WHERE OrderID = " + Int32.Parse(((Button)sender).CommandArgument) + "", conn);
            qCmd.ExecuteNonQuery();
            conn.Close();

            connection();

        }

    }
}
