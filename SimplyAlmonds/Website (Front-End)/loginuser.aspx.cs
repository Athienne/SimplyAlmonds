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
    public partial class loginuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";

                connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");

                OleDbConnection conn = new OleDbConnection(connstr);

                conn.Open();

                OleDbCommand cmd = new OleDbCommand("select * from users where username='" + TextBox1.Text.Trim() + "' AND password='" + TextBox2.Text.Trim() + "'", conn);
                cmd.ExecuteNonQuery();
                int row = (int)cmd.ExecuteScalar();
                conn.Close();
                if (row > 0)
                {
                    Response.Write("<script>alert('Successful login');</script>");
                    Session["username"] = TextBox1.Text.Trim();
                    Session["fullname"] = TextBox2.Text.Trim();
                    Session["role"] = "user";
                    Response.Redirect("home.aspx");
                }

                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}