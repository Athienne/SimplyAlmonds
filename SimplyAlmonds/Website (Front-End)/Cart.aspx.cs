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
        bool creditCardisValid(string dateString)
        {
            DateTime dateValue;

            if (DateTime.TryParse(dateString, out dateValue))
                if (dateValue < DateTime.Now)
                    return false;
                else
                    return true;
            else
                return false;
        }


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
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "admin")
                {
                    Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
                }

            }
            else
            {
                Response.Redirect("~/Website%20(Front-End)/LoginUser.aspx");
            }

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
            OleDbCommand qCmd = new OleDbCommand("DELETE FROM cart WHERE CartID = " + Int32.Parse(((Button)sender).CommandArgument) + "", conn);
            qCmd.ExecuteNonQuery();
            conn.Close();

            connection();

        }

        protected void purchaseButton_Click(object sender, EventArgs e)
        {
            if (customerName.Text == "" || cardNumber.Text == "" || expiryDate.Text == "" || cvv.Text == "" || streetAddress.Text == "" || city.Text == "" || stateProvince.Text == "" || zipCode.Text == "")
            {
                Response.Write("<script>alert('" + "Information provided not complete." + "')</script>");
            }
            else
            {
                if (!creditCardisValid(expiryDate.Text) || !(cardNumber.Text.Length >= 13 && cardNumber.Text.Length <= 16) || !(cvv.Text.Length >= 3 && cvv.Text.Length <= 4))
                {
                    Response.Write("<script>alert('" + "Invalid Credit Card Info." + "')</script>");
                }
                else
                {
                    int maxRow = getMaxRow();
                    int uniqueID = getUniqueID();

                    OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
                    conn.Open();

                    for (int i = 0; i < maxRow; i++) 
                    {
                        OleDbCommand shopidcmd = new OleDbCommand("SELECT TOP 1 ShopID FROM cart;", conn);
                        int shpid = (int)shopidcmd.ExecuteScalar();
                        OleDbCommand prodtypecmd = new OleDbCommand("SELECT ProductType FROM Shop WHERE ShopID = " + shpid + ";", conn);
                        string prodtype = (string)prodtypecmd.ExecuteScalar();
                        OleDbCommand quantitycmd = new OleDbCommand("SELECT TOP 1 Quantity FROM cart;", conn);
                        int quan = (int)quantitycmd.ExecuteScalar();
                        string date = DateTime.Now.ToString("MM/dd/yyyy");
                        string userName = Session["username"].ToString();
                        string status = "Finished";

                        OleDbCommand qCmd = new OleDbCommand("INSERT INTO [order] VALUES ('" + uniqueID + "','" + shpid + "','" + prodtype + "','" + date + "','" + userName + "','" + quan + "','" + status + "')", conn);
                        qCmd.ExecuteNonQuery();

                        OleDbCommand stockded = new OleDbCommand("UPDATE Shop SET StockOnHand = StockOnHand - " + quan + " WHERE ShopID = " + shpid + ";", conn);
                        stockded.ExecuteNonQuery();

                        OleDbCommand delz = new OleDbCommand("DELETE FROM (SELECT TOP 1 * FROM cart);", conn);
                        delz.ExecuteNonQuery();

                    }

                    conn.Close();
                    Response.Write("<script>alert('" + "Transaction Complete!" + "')</script>");
                    Response.Redirect("~/Website%20(Front-End)/Home.aspx");

                }
            }

        }


        public int getUniqueID()
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();
            OleDbCommand qCmd = new OleDbCommand("SELECT MAX(orderID) FROM [order];", conn);
            int uniqueid = ((int)qCmd.ExecuteScalar()+1);
            conn.Close();

            return uniqueid;
        }

        public int getMaxRow()
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();
            OleDbCommand qCmd = new OleDbCommand("SELECT COUNT(CartID) FROM cart;", conn);
            int rows = (int)qCmd.ExecuteScalar();
            conn.Close();

            return rows;
        }


    }
}
