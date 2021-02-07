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
            username.Text = Session["username"].ToString();
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
                    OleDbDataAdapter sqldata2 = new OleDbDataAdapter("select id as [ID], orderID as [Order ID],  proddesc as [Product Description], email as [E-mail], dateofpurchase as [Date of Purchase] from users where username='" + Session["username"] + "';", conn);
                    DataTable table2 = new DataTable();
                    sqldata2.Fill(table2);
                    purchasehistory.DataSource = table2;
                    purchasehistory.DataBind();

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