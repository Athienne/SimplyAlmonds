﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Front_End_
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signupbtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (uname.Text == "" || email.Text == "" || pass.Text == "")
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
                else
                {
                    string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                    connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
                    OleDbConnection conn = new OleDbConnection(connstr);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand("insert into users(username, passw, email, user_type, active) values('" + uname.Text.Trim() + "' , '" + pass.Text + "','"+email.Text.Trim() + "','user', 'True');", conn);
                    OleDbCommand cmd2 = new OleDbCommand("select * from users where email='" + email.Text.Trim()+"' or username='"+uname.Text.Trim()+"';", conn);
                    OleDbDataReader reader = cmd2.ExecuteReader();

                    if (reader.Read() == true)
                    {
                        Response.Write(@"
                        <script>
                            alert('The E-Mail and/or Username you entered is already in the database!');      
                        </script>
                        ");
                    }
                    else
                    {
                        cmd.ExecuteNonQuery();

                        conn.Close();
                        Response.Write(@"
                        <script>
                            alert('Sign Up Successful!');
                            window.location = 'Home.aspx';
                        </script>
                        ");
                    }                 
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}