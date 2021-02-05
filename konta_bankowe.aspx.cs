using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class konta_bankowe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == false)
                Response.Redirect("~/Account/Login.aspx");//User?.Identity.Name
        }


        protected void dv_k_b_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            gv_k_b.DataBind();
        }

        protected void dv_k_b_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            gv_k_b.DataBind();
        }

        protected void dv_k_b_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            gv_k_b.DataBind();
        }
    }
}