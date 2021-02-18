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
            Session.Remove("role");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = "", passw = "", user_type = "", status = "";
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from users where username='" + TextBox1.Text.Trim() + "' AND passw='" + TextBox2.Text + "'", conn);
            OleDbCommand cmd2 = new OleDbCommand("select * from users where username='" + TextBox1.Text.Trim() + "' AND passw='" + TextBox2.Text + "' AND user_type='user' AND active='No';", conn);

            OleDbDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                username = reader.GetString(1);
                passw = reader.GetString(2);
                user_type = reader.GetString(4);
                status = reader.GetString(5);
            }

            if (TextBox1.Text == username && TextBox2.Text == passw)
            {
                if (status == "True")
                {
                    if (user_type == "user")
                    {
                        Session["username"] = TextBox1.Text.Trim();
                        Session["email"] = TextBox2.Text;
                        Session["role"] = "user";
                        Response.Write(@"
                            <script>
                                alert('Login Successful!');
                                window.location = 'home.aspx';
                            </script>
                        ");
                    }
                    else if (user_type == "admin")
                    {
                        Session["username"] = TextBox1.Text.Trim();
                        Session["email"] = TextBox2.Text;
                        Session["role"] = "admin";
                        Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
                    }
                }
                else if (status == "No")
                {
                    Response.Write(@"
                        <script>
                            alert('Your account is deactivated');
                        </script>
                    ");
                }
            }
            else
            {
                Response.Write(@"
                    <script>
                        alert('Invalid Credentials or your account might be deactivated!');
                    </script>
                ");
            }
        }
    }
}

                //try
                //{         
                //    string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";

                //    connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");

                //    OleDbConnection conn = new OleDbConnection(connstr);

                //    OleDbCommand cmd = new OleDbCommand("select * from users where username='" + TextBox1.Text.Trim() + "' AND passw='" + TextBox2.Text + "' AND user_type='user' AND active='True';", conn);
                //    OleDbCommand cmd2 = new OleDbCommand("select * from users where username='" + TextBox1.Text.Trim() + "' AND passw='" + TextBox2.Text + "' AND user_type='user' AND active='No';", conn);

                //    conn.Open();
                //    OleDbDataReader reader = cmd.ExecuteReader();
                //    OleDbDataReader reader2 = cmd2.ExecuteReader();
                //    if (reader.Read() == true)
                //    {

                //        Session["username"] = TextBox1.Text.Trim();
                //        Session["email"] = TextBox2.Text;
                //        Session["role"] = "user";
                //        Response.Write(@"
                //             <script>
                //                alert('Login Successful!');
                //                window.location = 'home.aspx';
                //            </script>
                //        ");
                //    }
                //    if (reader2.Read() == true)
                //    {

                //        Response.Write(@"
                //             <script>
                //                alert('Your account is deactivated');
                //            </script>
                //        ");
                //    }
                //    else
                //    {

                //        Response.Write(@"
                //             <script>
                //                alert('Invalid Credentials or your account might be deactivated!');
                //            </script>
                //        ");
                //    }

                //}
                //catch (Exception ex)
                //{
                //    Response.Write("<script>alert('" + ex.Message + "');</script>");
                //}
