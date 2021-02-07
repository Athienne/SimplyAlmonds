using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimplyAlmonds.AdminPages
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"] == "")
                {
                    loginuser.Visible = true; // user login link button
                    signuplb.Visible = true; // sign up link button

                    logout.Visible = false; // logout link button
                    account.Visible = false; // hello user link button


                    admin.Visible = true; // admin login link button


                }
                else if (Session["role"].Equals("admin"))
                {
                    loginuser.Visible = false; // user login link button
                    signuplb.Visible = false; // sign up link button

                    logout.Visible = true; // logout link button
                    account.Visible = true; // hello user link button
                    account.Text = "Hello " + "Admin".ToString();


                    admin.Visible = true; // admin login link button
                }

            }
            catch (Exception ex)
            {

            }
        }
        protected void admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Website (Front-End)/loginadmin.aspx");
        }

        protected void loginuser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Website (Front-End)/loginuser.aspx");
        }

        protected void signuplb_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Website (Front-End)/signup.aspx");
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            //Session["status"] = "";

            loginuser.Visible = true; // user login link button
            signuplb.Visible = true; // sign up link button

            logout.Visible = false; // logout link button
            account.Visible = false; // hello user link button


            admin.Visible = true; // admin login link button

        }
        protected void account_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Website (Back-End)/accountadmin.aspx");
        }
    }
}