using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimplyAlmonds.Website__Front_End_
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Join Shop table and cart table
        }
        protected void minus_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;

            Button minusButton = (Button)item.FindControl("minusButton");
            TextBox qtyText = (TextBox)item.FindControl("quantityTxt");
            bool minusClicked = button == minusButton;
            int qty = int.Parse(qtyText.Text);

            if (minusClicked && qty > 1)
            {
                qty -= 1;
                qtyText.Text = qty.ToString();
            }
        }
        protected void plus_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;
            var argument = ((Button)sender).CommandArgument;

            Button plusButton = (Button)item.FindControl("plusButton");
            TextBox qtyText = (TextBox)item.FindControl("quantityTxt");
            bool plusClicked = button == plusButton;
            int qty = int.Parse(qtyText.Text);

            if (plusClicked && qty < int.Parse(argument))
            {
                qty += 1;
                qtyText.Text = qty.ToString();
            }
        }

        protected void RemoveItemBtn_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            RepeaterItem item = (RepeaterItem)button.NamingContainer;
            var argument = ((Button)sender).CommandArgument;  //Product ID is passed here

            //Back-end code here; delete item where ShopID = $"{argument}"
        }
    }
}