using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class formy_platnosci : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User?.Identity.IsAuthenticated == false)
                Response.Redirect("~/Account/Login.aspx");//User?.Identity.Name
        }

        protected void dv_f_p_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            gv_f_p.DataBind();
        }

        protected void dv_f_p_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            gv_f_p.DataBind();
        }

        protected void dv_f_p_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            gv_f_p.DataBind();
        }
    }
}