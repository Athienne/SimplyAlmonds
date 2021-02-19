using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimplyAlmonds.UserPages
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].ToString() == null)
                {
                    Response.Redirect("~/Website%20(Front-End)/LoginUser.aspx");
                }
                else if (Session["role"].ToString() == "admin")
                {
                    Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
                }
            }
            catch (Exception)
            {

            }
        }
    }
}