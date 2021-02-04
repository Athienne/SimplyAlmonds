using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimplyAlmonds.Website_Back_End_
{
    public partial class HomeAdmin : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            try
            {
                this.Page.MasterPageFile = "~/AdminPages/AdminMaster.master";
            }
            catch (Exception ex)
            {

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addLatestEvents_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('addlatestevents button works!')</script>");
        }

        protected void editLatestEvents_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('editlatestevents button works!')</script>");
        }

        protected void deleteLatestEvents_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('deletelatestevents button works!')</script>");
        }

        protected void addNews_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('addnews button works!')</script>");
        }

        protected void editNews_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('editnews button works!')</script>");
        }

        protected void deleteNews_Click(object sender, EventArgs e)
        {
            // Test
            Response.Write("<script>alert('deletenews button works!')</script>");
        }
    }
}