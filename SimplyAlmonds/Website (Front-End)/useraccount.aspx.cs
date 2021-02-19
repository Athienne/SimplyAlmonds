using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Front_End_
{
    public partial class useraccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (Session["role"].ToString() == "admin")
                {
                    Response.Redirect("~/Website%20(Back-End)/AccountAdmin.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Website%20(Front-End)/LoginUser.aspx");
            }

            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            //Set current session
            username.Text = Session["username"].ToString();

            OleDbCommand sqldata2 = new OleDbCommand("SELECT [order].orderID as [Order ID], [order].prodtype as [Product Type], [order].dateofpurchase as [Date of Purchase], [order].status as [Status], users.email as [E-Mail] from users LEFT JOIN [order] ON users.username = [order].username WHERE users.username = '" + Session["username"] + "';", conn);
            OleDbDataReader gridReader = sqldata2.ExecuteReader();

            purchasehistory.DataSource = gridReader;
            purchasehistory.DataBind();
        }

        protected void updatebtn_Click(object sender, EventArgs e)
        {        
            try
            {
                if (newpass.Text==newpass2.Text)
                {
                    string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";

                    connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");

                    OleDbConnection conn = new OleDbConnection(connstr);
                    OleDbCommand cmd = new OleDbCommand("select * from users where username='" + Session["username"].ToString() + "' AND passw='" + oldpass.Text + "' AND user_type='user' and active='True';", conn);
                    OleDbCommand cmd2 = new OleDbCommand("update users set passw='" + newpass.Text + "', username='" + newusername.Text + "' where active='True' and passw='456';", conn);
                    conn.Open();

                    //OleDbDataAdapter sqldata2 = new OleDbDataAdapter("SELECT orderID as [Order ID],  prodtype as [Product Type], dateofpurchase as [Date of Purchase], status as [Status], users.email as [E-Mail] from users LEFT JOIN [order] ON users.username = [order].username WHERE username = '" + Session["username"] + "';", conn);
                    //OleDbDataAdapter sqldata2 = new OleDbDataAdapter("select id as [ID], orderID as [Order ID],  proddesc as [Product Description], email as [E-mail], dateofpurchase as [Date of Purchase] from users where username='" + Session["username"] + "';", conn);

                    //OleDbCommand sqldata2 = new OleDbCommand("SELECT * FROM [order]", conn);
                    //OleDbCommand sqldata2 = new OleDbCommand("SELECT [order].orderID as [Order ID],  [order].prodtype as [Product Type], [order].dateofpurchase as [Date of Purchase], [order].status as [Status], users.email as [E-Mail] from users LEFT JOIN [order] ON users.username = [order].username WHERE username = '" + Session["username"] + "';", conn);
                    //OleDbDataReader gridReader = sqldata2.ExecuteReader();

                    //purchasehistory.DataSource = gridReader;
                    //purchasehistory.DataBind();

                    //DataTable table2 = new DataTable();
                    //sqldata2.Fill(table2);
                    //purchasehistory.DataSource = table2;
                    //purchasehistory.DataBind();

                    OleDbDataReader reader = cmd.ExecuteReader();

                    if (reader.Read() == true)
                    {
                        cmd2.ExecuteReader();
                        Session["username"] = newusername.Text.Trim();
                        conn.Close();
                        Response.Write(@"
                         <script>
                            alert('Update Successful!');
                            window.location = 'home.aspx';
                        </script>
                    ");
                        //Response.Redirect("~/Website (Back-End)/HomeAdmin.aspx");

                    }

                    else
                    {
                        Response.Write(@"
                         <script>
                            alert('Invalid Credentials ');
                        </script>
                    ");
                    }
                }
                else
                {

                }
                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        
    }
}