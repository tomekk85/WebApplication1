using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class rodzaj_wydatku : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == false)
                Response.Redirect("~/Account/Login.aspx");//User?.Identity.Name
        }

        protected void dv_r_w_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void gv_r_w_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void dv_r_w_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            gv_r_w.DataBind();
        }

        protected void dv_r_w_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            gv_r_w.DataBind();
        }

        protected void dv_r_w_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            gv_r_w.DataBind();
        }

    }
}