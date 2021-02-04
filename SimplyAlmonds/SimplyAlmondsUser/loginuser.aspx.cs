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
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";

                connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");

                OleDbConnection conn = new OleDbConnection(connstr);

                OleDbCommand cmd = new OleDbCommand("select * from users where username='" + TextBox1.Text.Trim() + "' AND passw='" + TextBox2.Text.Trim() + "' AND user_type='user';", conn);
                conn.Open();
                OleDbDataReader reader = cmd.ExecuteReader();

                if (reader.Read() == true)
                {
                    
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Login Successful!')", true);
                    Session["username"] = TextBox1.Text.Trim();
                    Session["fullname"] = TextBox2.Text.Trim();
                    Session["role"] = "user";
                    Response.Redirect("~/Website (Front-End)/useraccount.aspx");
                }

                else
                {
                    
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Credentials')", true);
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}