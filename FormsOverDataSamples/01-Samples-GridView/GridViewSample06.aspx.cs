using System;
using System.Web.UI.WebControls;

namespace FormsOverDataSamples.Samples
{
  public partial class GridViewSample06 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void grdProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      ProductManager mgr = new ProductManager();
      AppCache.LastPage = Request.Url.AbsoluteUri;
      AppCache.ProductId = Convert.ToInt32(e.CommandArgument);

      switch (e.CommandName.ToLower())
      {
        case "edit":
          Response.Redirect("../ProductForms/ProductEdit.aspx");
          e.Handled = true;
          break;

        case "delete":
          mgr.Delete(AppCache.ProductId);
          e.Handled = true;
          break;

        default:
          break;
      }
    }
  }
}