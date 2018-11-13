using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsOverDataSamples
{
  public partial class RepeaterSample02 : System.Web.UI.Page
  {
    protected override void OnPreInit(EventArgs e)
    {
      // Must override EnableViewState on Master Page
      Bootstrap master = Page.Master as Bootstrap;
      master.EnableViewState = true;

      base.OnPreInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (!Page.IsPostBack)
      {
        ProductManager mgr = new ProductManager();
        List<Product> list = new List<Product>();

        list = mgr.GetProducts();

        repProductsHeaders.DataSource = list;
        repProductsHeaders.DataBind();
        repProducts.DataSource = list;
        repProducts.DataBind();
      }
    }

    protected void repProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
      ProductManager mgr = new ProductManager();
      AppCache.LastPage = Request.Url.AbsoluteUri;
      AppCache.ProductId = Convert.ToInt32(e.CommandArgument);

      switch (e.CommandName.ToLower())
      {
        case "edit":
          Response.Redirect("../ProductForms/ProductEdit.aspx");
          break;

        case "delete":
          mgr.Delete(Convert.ToInt32(e.CommandArgument));
          break;

        default:
          break;
      }
    }

  }
}