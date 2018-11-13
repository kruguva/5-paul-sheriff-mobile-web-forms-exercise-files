using System;
using System.Globalization;
using System.Text;
using System.Web.UI.WebControls;

namespace FormsOverDataSamples.Samples
{
  public partial class GridViewSample05 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!Page.IsPostBack)
      {
        // Check to see if this is a postback or was submitted via the <a href>
        if (Request.QueryString["id"] != null)
        {
          var PK = Convert.ToString(Request.QueryString["id"]);

          lblTitle.InnerText = "Update Product";
          btnSave.Text = "Update Product";
          hdnPK.Value = PK;
          hdnAddMode.Value = "false";

          LoadInfoForEdit(PK);
          LoadEditScript();
        }
      }
    }

    private void LoadInfoForEdit(string PK)
    {
      ProductManager mgr = new ProductManager();
      Product entity = new Product();
      entity = mgr.GetProduct(Convert.ToInt32(PK));

      txtProductName.Text = entity.ProductName;
      txtIntroductionDate.Text = entity.IntroductionDate.ToString("yyyy-MM-dd");
      txtCost.Text = entity.Cost.ToString("#.##");
      txtPrice.Text = entity.Price.ToString("#.##");
      hdnPK.Value = entity.ProductId.ToString();
      hdnAddMode.Value = "false";
    }

    private void LoadEditScript()
    {
      StringBuilder sb = new StringBuilder();

      sb.AppendLine("$(document).ready(function() {");
      sb.AppendLine("$('#productDialog').modal();");
      sb.AppendLine("});");

      Page.ClientScript.RegisterStartupScript(this.GetType(), "EditData", sb.ToString(), true);
    }

    protected void grdProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      ProductManager mgr = new ProductManager();

      switch (e.CommandName.ToLower())
      {
        case "delete":
          mgr.Delete(Convert.ToInt32(e.CommandArgument));
          e.Handled = true;
          break;

        default:
          break;
      }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
      ProductManager mgr = new ProductManager();
      Product entity = new Product();

      entity.ProductId = Convert.ToInt32(hdnPK.Value);
      entity.ProductName = txtProductName.Text;
      // Have to check for different types of date formats
      entity.IntroductionDate = DataConvert.HTMLDateToDotNet(txtIntroductionDate.Text);
      entity.Cost = Convert.ToDecimal(txtCost.Text);
      entity.Price = Convert.ToDecimal(txtPrice.Text);
      entity.IsDiscontinued = chkIsDiscontinued.Checked;

      if (Convert.ToBoolean(hdnAddMode.Value))
      {
        mgr.Insert(entity);
      }
      else
      {
        mgr.Update(entity);
      }
    }
  }
}