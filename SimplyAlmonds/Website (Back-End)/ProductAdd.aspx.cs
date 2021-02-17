using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class ProductAdd : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Redirect("~/Website%20(Front-End)/LoginUser.aspx");
            }
            else if (Session["role"].ToString() == "user")
            {
                Response.Redirect("~/Website%20(Front-End)/Home.aspx");
            }
            else
            {
                if (Session["UploadedFile"] == null && FileUpload1.HasFile)
                    Session["UploadedFile"] = FileUpload1;
                else if (Session["UploadedFile"] != null && (!FileUpload1.HasFile))
                    FileUpload1 = (FileUpload)Session["UploadedFile"];
                else if (FileUpload1.HasFile)
                    Session["UploadedFile"] = FileUpload1;
            }
        }

        protected void checkModal_click(object sender, EventArgs e)
        {
            // Verify if Event Title and Event Details are not null
            if (!string.IsNullOrWhiteSpace(ProductName_text.Text) && !string.IsNullOrWhiteSpace(ProductDescription_text.Text) && !string.IsNullOrWhiteSpace(Stock_text.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#myModal').modal('show')", true);
            }
        }

        protected void addProduct_click(object sender, EventArgs e)
        {
            // Opens database connection, adds a new record in the database and closes the connection
            // Immediate redirects to the Admin Home Page

            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/Pictures/");
                FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

                strSQL = "insert into Shop (ProductName, ProductDescription, StockOnHand, ProductType, ImageUrl) " +
                    $"values(@Name, @Description, @Price, @Stock, @Type, '{"~/Pictures/" + Path.GetFileName(FileUpload1.FileName)}')";
            }
            else
            {
                strSQL = $"insert into Shop (ProductName, ProductDescription, StockOnHand, ProductType) " +
                    "values(@Name, @Description, @Price, @Stock, @Type)";
            }

            objCmd = new OleDbCommand(strSQL, objConn);
            objCmd.Parameters.AddWithValue("@Name", ProductName_text.Text);
            objCmd.Parameters.AddWithValue("@Description", ProductDescription_text.Text);
            objCmd.Parameters.AddWithValue("@Price", double.Parse(ProductPrice_Text.Text));
            objCmd.Parameters.AddWithValue("@Stock", int.Parse(Stock_text.Text));
            objCmd.Parameters.AddWithValue("@Type", ProductList.SelectedValue);

            objCmd.ExecuteNonQuery();
            objConn.Close();
            Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ProductList.SelectedIndex == 1)
            {
                FileUpload1.Visible = true;
            }
            else
            {
                FileUpload1.Visible = false;
            }
        }
    }
}