using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormsOverDataSamples.Samples
{
  public partial class GridViewSample02 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!Page.IsPostBack)
      {
        // Make sure the GridView writes a 'thead' tag
        // This helps with the responsiveness
        grdProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
      }
    }
  }
}