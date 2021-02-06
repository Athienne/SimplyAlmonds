using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class LatestEventEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext konteskto = HttpContext.Current;
            string idstring = konteskto.Request["id"];
            Response.Write("<script>alert('the id is " + idstring + "')</script>");
        }
    }
}