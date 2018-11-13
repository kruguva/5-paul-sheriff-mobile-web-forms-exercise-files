<%@ Page Title="Alternate GridView" Language="C#" MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true" CodeBehind="GridViewSample06.aspx.cs" Inherits="FormsOverDataSamples.Samples.GridViewSample06" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <!-- Bring in Pager Styles -->
  <link href="../css/PagerStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h3>Alternate GridView</h3>
  <form id="form1" runat="server">
    <asp:GridView ID="grdAltProducts" runat="server"
      DataSourceID="odsProducts"      
      AutoGenerateColumns="False"
      PageSize="4"
      AllowPaging="true"
      ShowHeader="False"
      GridLines="None"
      OnRowCommand="grdProducts_RowCommand">
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
            <div class="row">
              <div class="productBlock">
                <div class="productNameTitle">
                  <%# Eval("ProductName") %>
                </div>
                <div>
                  Introduction Date:
                    <%# Convert.ToDateTime(Eval("IntroductionDate")).ToShortDateString() %>
                  <br />
                  Is Discontinued? <%# (Convert.ToBoolean(Eval("IsDiscontinued")) ? "Yes" : "No") %>
                </div>
                <div>
                  Cost is <%# Convert.ToDecimal(Eval("Cost")).ToString("c") %>
                    and the Price is <%# Convert.ToDecimal(Eval("Price")).ToString("c") %>
                </div>
                <br />
                <div>
                  <asp:Button ID="btnEdit" runat="server"
                    CssClass="btn btn-primary"
                    Text="Edit"
                    CommandName="Edit"
                    CommandArgument='<%# Eval("ProductId")%>' />
                  <asp:Button ID="btnDelete" runat="server"
                    CssClass="btn btn-primary"
                    Text="Delete"
                    CommandName="Delete"
                    CommandArgument='<%# Eval("ProductId")%>'
                    OnClientClick="javascript: confirm('Delete Product?');" />
                </div>
              </div>
            </div>
          </ItemTemplate>
        </asp:TemplateField>
      </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsProducts" 
      runat="server"
      TypeName="FormsOverDataSamples.ProductManager"
      SelectMethod="GetProducts" />
  </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
