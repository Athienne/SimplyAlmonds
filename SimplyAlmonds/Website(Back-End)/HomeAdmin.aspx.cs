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
                this.Page.MasterPageFile = "~/AdminMaster.Master";
            }
            catch (Exception ex)
            {

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}