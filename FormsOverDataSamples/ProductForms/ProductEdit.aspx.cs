using System;
using System.Web.UI;

namespace FormsOverDataSamples.ProductForms
{
  public partial class ProductEdit : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if(!Page.IsPostBack)
      {
        DisplayProduct();
      }
    }

    private void DisplayProduct()
    {
      ProductManager mgr = new ProductManager();
      Product entity = null;

      entity = mgr.GetProduct(AppCache.ProductId);
      if(entity!= null)
      {
        txtProductName.Text = entity.ProductName;
        txtIntroductionDate.Text = entity.IntroductionDate.ToString("yyyy-MM-dd");
        txtCost.Text = entity.Cost.ToString();
        txtPrice.Text = entity.Price.ToString();
        chkIsDiscontinued.Checked = entity.IsDiscontinued;
      }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
      Response.Redirect(AppCache.LastPage);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
      // Write Code to Save Here

      Response.Redirect(AppCache.LastPage);
    }
  }
}