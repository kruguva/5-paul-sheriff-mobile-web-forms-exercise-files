using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsOverDataSamples
{
  public partial class DualPurpose : System.Web.UI.Page
  {
    #region DisplayMobile Property
    protected bool DisplayMobile
    {
      get
      {
        object value;

        value = ViewState["Mode"];

        return (bool)(value == null ? false : value);
      }
      set { ViewState["Mode"] = value; }
    }
    #endregion

    #region Page_Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Request.QueryString["switch"] == null)
      {
        DisplayMobile = (Request.Browser.IsMobileDevice);
      }
      else
      {
        if (Request.QueryString["switch"].ToString() == "normal")
          DisplayMobile = false;
        else
          DisplayMobile = true;
      }

      if (!Page.IsPostBack)
      {
        if (DisplayMobile)
        {
          grdAltProducts.DataSourceID = "odsProducts";
          grdAltProducts.DataBind();
          aSwitch.Attributes["href"] = "DualPurpose.aspx?switch=normal";
        }
        else
        {
          grdProducts.DataSourceID = "odsProducts";
          grdProducts.DataBind();
          aSwitch.Attributes["href"] = "DualPurpose.aspx?switch=mobile";
        }
      }
    }
    #endregion

    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
      if(DisplayMobile)
      {
        grdAltProducts.PageIndex = e.NewPageIndex;
        grdAltProducts.DataSourceID = "odsProducts";
        grdAltProducts.DataBind();
      }
      else
      {
        grdProducts.PageIndex = e.NewPageIndex;
        grdProducts.DataSourceID = "odsProducts";
        grdProducts.DataBind();
      }
    }

    #region grdAltProducts_RowCommand Event
    protected void grdAltProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      AppCache.LastPage = Request.Url.AbsoluteUri;
      AppCache.ProductId = Convert.ToInt32(e.CommandArgument);

      switch (e.CommandName.ToLower())
      {
        case "edit":
          Response.Redirect("../ProductForms/ProductEdit.aspx");
          break;

        case "delete":
          // Write code here to delete

          System.Diagnostics.Debugger.Break();
          e.Handled = true;
          break;

        default:
          break;
      }
    }
    #endregion

    #region grdProducts_RowCommand Event
    protected void grdProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      AppCache.LastPage = "DualPurpose.aspx";
      //AppCache.ProductId = Convert.ToInt32(((ButtonField)e.CommandSource).Attributes["ProductId"]);

      switch (e.CommandName.ToLower())
      {
        case "edit":
          Response.Redirect("../ProductForms/ProductEdit.aspx");
          break;

        case "delete":
          // Write code here to delete

          System.Diagnostics.Debugger.Break();
          e.Handled = true;
          break;

        default:
          break;
      }
    }
    #endregion
  }
}