using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.OleDb;
using System.Data;
using System.Net.Mail;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class AboutUsEdit : System.Web.UI.Page
    {
        public bool emailValid(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void checkModalCompany_click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(companyDetails.Text) && !string.IsNullOrWhiteSpace(companyEmail.Text) && !string.IsNullOrWhiteSpace(companyName.Text) && !string.IsNullOrWhiteSpace(companyNumber.Text))
            {
                if ((companyNumber.Text.Length != 11 && !Regex.IsMatch(companyNumber.Text, @"^\d+$")))
                {
                    Response.Write("<script>alert('" + "Not Valid Phone Number!" + "')</script>");
                }
                if (!emailValid(companyEmail.Text))
                {
                    Response.Write("<script>alert('" + "Not Valid E-mail Address!" + "')</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalCompany').modal('show')", true);
                }

            }

            if (companyDetails.Text == "" || companyEmail.Text == "" || companyName.Text == "" || companyNumber.Text == "")
            {
                Response.Write("<script>alert('" + "Not All Fields are Filled!" + "')</script>");
            }

        }

        protected void checkModalBand_click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(bandDetails.Text) && !string.IsNullOrWhiteSpace(bandEmail.Text) && !string.IsNullOrWhiteSpace(bandName.Text) && !string.IsNullOrWhiteSpace(bandNumber.Text))
            {
                if ((bandNumber.Text.Length != 11 && !Regex.IsMatch(bandNumber.Text, @"^\d+$")))
                {
                    Response.Write("<script>alert('" + "Not Valid Phone Number!" + "')</script>");
                }
                if (!emailValid(bandEmail.Text))
                {
                    Response.Write("<script>alert('" + "Not Valid E-mail Address!" + "')</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#modalBand').modal('show')", true);
                }

            }

            if (bandDetails.Text == "" || bandEmail.Text == "" || bandName.Text == "" || bandNumber.Text == "")
            {
                Response.Write("<script>alert('" + "Not All Fields are Filled!" + "')</script>");
            }

        }

        protected void editAboutCompany_click(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();
            OleDbCommand qCmd = new OleDbCommand("UPDATE about SET companyname = '" + companyName.Text + "', companyabout = '" + companyDetails.Text + "', companyemail = '" + companyEmail.Text + "', companynumber = '" + companyNumber.Text + "'", conn);
            qCmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('" + "Company Details Changed Sucessfully." + "')</script>");
        }

        protected void editAboutBand_click(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/simplyalmonds.MDB"));
            conn.Open();
            OleDbCommand qCmd = new OleDbCommand("UPDATE about SET bandname = '" + bandName.Text + "', bandabout = '" + bandDetails.Text + "', bandemail = '" + bandEmail.Text + "', bandnumber = '" + bandNumber.Text + "'", conn);
            qCmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('" + "Band Details Changed Sucessfully." + "')</script>");
        }
    }
}