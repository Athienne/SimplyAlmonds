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
                if (uname.Text==""||email.Text==""||pass.Text=="")
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
                else
                {

                    string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                    connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
                    OleDbConnection conn = new OleDbConnection(connstr);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand("insert into users(username,passw,email,user_type) values('" + uname.Text.Trim() + "' , '" + pass.Text + "','"+email.Text.Trim() + "','user');", conn);
                    OleDbCommand cmd2 = new OleDbCommand("select * from users where email='" + email.Text.Trim()+"';", conn);
                    OleDbDataReader reader = cmd2.ExecuteReader();

                    if (reader.Read() == true)
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('the email you entered is already in the database')", true);

                    }

                    else
                    {
                        Response.Write("<script>alert('sign up successful!');</script>");

                        cmd.ExecuteNonQuery();

                        conn.Close();
                        Response.Redirect("~/Website (Front-End)/home.aspx");
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