using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace SimplyAlmonds.Website__Back_End_
{
    public partial class accountadmin : System.Web.UI.Page
    {
        OleDbConnection conn;
        protected void Page_Load(object sender, EventArgs e)
           
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";

            connstr += Server.MapPath("~/App_Data/simplyalmonds.Mdb");
            conn = new OleDbConnection(connstr);
            conn = new OleDbConnection(connstr);
            conn.Open();
            OleDbDataAdapter sqldata = new OleDbDataAdapter("select id as [ID], username as [Customer Name],  passw as [Password], email as [E-mail], active as [Active] from users where user_type='user'", conn);
            DataTable table = new DataTable();
            sqldata.Fill(table);
            GridView1.DataSource = table;
            GridView1.DataBind();
            
            conn.Close();
        }

        protected void updatebtn_Click(object sender, EventArgs e)
        {
            string deacorac = deactoract.Text;
            string[] arr = deacorac.Split(',');
            for(int i=0;i<arr.Length;i++)
            {
                conn.Open();
            
                
                OleDbCommand cmd = new OleDbCommand("select active from users where id=" +arr[i] + ";", conn);
                OleDbDataReader dr = cmd.ExecuteReader();


                if (dr.Read() && dr.GetValue(0).ToString() == "False")
                {
                    OleDbCommand cmd2 = new OleDbCommand("update users set active='True' where id=" +  arr[i] + " and user_type='user';", conn);
                    cmd2.ExecuteNonQuery();

                }
                else
                {

                    OleDbCommand cmd3 = new OleDbCommand("update users set active='False' where id=" + arr[i]  + " and user_type='user';", conn);
                    cmd3.ExecuteNonQuery();

                }
                deactoract.Text = "ha";
                i++;
            }
            
            
            Response.Write(@"
                         <script>
                            alert('Update Successful!');
                            
                        </script>
                    ");
        }
    }
}