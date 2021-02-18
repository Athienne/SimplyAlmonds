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
    public partial class ProductEdit : System.Web.UI.Page
    {
        OleDbConnection objConn;
        OleDbCommand objCmd;
        String strSQL, strConnString;

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
                {
                    Session["UploadedFile"] = FileUpload1;
                }
                else if (Session["UploadedFile"] != null && (!FileUpload1.HasFile))
                {
                    FileUpload1 = (FileUpload)Session["UploadedFile"];
                }
                else if (FileUpload1.HasFile)
                {
                    Session["UploadedFile"] = FileUpload1;
                }

                if (!Page.IsPostBack)
                {
                    try
                    {
                        HttpContext con = HttpContext.Current;
                        int idvalue = int.Parse(con.Request["id"]);

                        strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                        Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
                        objConn = new OleDbConnection(strConnString);
                        objConn.Open();

                        // Load Event Data
                        strSQL = "SELECT ProductName, ProductDescription, ProductPrice, StockOnHand, ProductType FROM Shop WHERE ShopID = " + idvalue + "";
                        objCmd = new OleDbCommand(strSQL, objConn);
                        OleDbDataReader reader = objCmd.ExecuteReader();

                        // Value holder for Stock and Product Price(reader code does not work)
                        int stockValueHolder = 0;
                        double productPriceHolder = 0;

                        while (reader.Read())
                        {
                            ProductName_text.Text = reader.GetString(0);
                            ProductDescription_text.Text = reader.GetString(1);
                            productPriceHolder = reader.GetDouble(2);
                            stockValueHolder = reader.GetInt32(3);
                            ProductList.SelectedValue = reader.GetString(4);
                        }

                        Stock_text.Text = stockValueHolder.ToString();
                        ProductPrice_Text.Text = productPriceHolder.ToString();

                        if (ProductList.SelectedValue == "Single")
                        {
                            FileUpload1.Visible = true;
                        }

                        reader.Close();
                        objConn.Close();
                    }
                    catch (Exception)
                    {
                        Response.Redirect("~/Website%20(Back-End)/ShopAdmin.aspx");
                    }
                }
            }        
        }

        protected void checkModal_click(object sender, EventArgs e)
        {
            // Verify if Product Title and Product Details are not null
            if (!string.IsNullOrWhiteSpace(ProductName_text.Text) && !string.IsNullOrWhiteSpace(ProductDescription_text.Text) && !string.IsNullOrWhiteSpace(Stock_text.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#myModal').modal('show')", true);
            }
        }

        protected void deleteModal_click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#deleteModal').modal('show')", true);
        }

        protected void editProduct_click(object sender, EventArgs e)
        {
            // Opens database connection, adds a new record in the database and closes the connection
            // Immediate redirects to the Admin Home Page

            HttpContext con = HttpContext.Current;
            int idvalue = int.Parse(con.Request["id"]);

            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/Pictures/");
                FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

                strSQL = "UPDATE Shop SET ProductName = @prodname, ProductDescription = @proddesc, ProductPrice = @prodprice, StockOnHand = @stock, ProductType = @prodtype, " +
                    $"ImageUrl = '{"~/Pictures/" + Path.GetFileName(FileUpload1.FileName)}' WHERE ShopID = @prodID";
            }
            else
            {
                strSQL = "UPDATE Shop SET ProductName = @prodname, ProductDescription = @proddesc, ProductPrice = @prodprice, StockOnHand = @stock, ProductType = @prodtype " +
                    "WHERE ShopID = @prodID";
            }

            objCmd = new OleDbCommand(strSQL, objConn);
            objCmd.Parameters.AddWithValue("@prodname", ProductName_text.Text);
            objCmd.Parameters.AddWithValue("@proddesc", ProductDescription_text.Text);
            objCmd.Parameters.AddWithValue("@prodprice", double.Parse(ProductPrice_Text.Text));
            objCmd.Parameters.AddWithValue("@stock", int.Parse(Stock_text.Text));
            objCmd.Parameters.AddWithValue("@prodtype", ProductList.SelectedValue);
            objCmd.Parameters.AddWithValue("@prodID", idvalue);

            objCmd.ExecuteNonQuery();
            objConn.Close();
            Session.Remove("UploadedFile");
            Response.Redirect("~/Website%20(Back-End)/HomeAdmin.aspx");
        }

        protected void deleteProduct_click(object sender, EventArgs e)
        {
            HttpContext con = HttpContext.Current;
            int idvalue = int.Parse(con.Request["id"]);

            String strConnString;
            strConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
            Server.MapPath("~/App_Data/simplyalmonds.mdb") + ";";
            objConn = new OleDbConnection(strConnString);
            objConn.Open();

            strSQL = "DELETE FROM Shop WHERE ShopID = " + idvalue + "";
            objCmd = new OleDbCommand(strSQL, objConn);
            objCmd.ExecuteNonQuery();
            objConn.Close();
            Session.Remove("UploadedFile");
            Response.Redirect("~/Website%20(Back-End)/ShopAdmin.aspx");
        }

        protected void ProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProductPanel.Update();
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