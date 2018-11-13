<%@ Page Title="Dual Purpose Form"
  Language="C#"
  MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true"
  CodeBehind="DualPurpose.aspx.cs"
  Inherits="FormsOverDataSamples.DualPurpose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <!-- Bring in Pager Styles -->
  <link href="../css/PagerStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h3>Dual Purpose Form</h3>
  <a href="DualPurpose.aspx?switch=mobile" runat="server" id="aSwitch">Switch to Other
    View</a>
  <form id="form1" runat="server">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-8">
        <div class="table-responsive">
          <asp:GridView ID="grdProducts" runat="server"
            CssClass="table table-striped table-bordered"
            PageSize="4"
            AllowPaging="True"
            OnPageIndexChanging="PageIndexChanging"
            OnRowCommand="grdProducts_RowCommand">
          </asp:GridView>
        </div>
      </div>
    </div>
    <asp:GridView ID="grdAltProducts" runat="server"
      PageSize="4"
      AllowPaging="true"
      ShowHeader="False"
      AutoGenerateColumns="False"
      GridLines="None"
      OnPageIndexChanging="PageIndexChanging"
      OnRowCommand="grdAltProducts_RowCommand">
      <Columns>
        <asp:TemplateField>
          <ItemTemplate>
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-8">
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
                    <asp:Button ID="btnEdit" CssClass="btn btn-primary" Text="Edit" CommandName="Edit"
                      CommandArgument='<%# Eval("ProductId")%>'
                      runat="server" />
                    <asp:Button ID="btnDelete" CssClass="btn btn-primary" Text="Delete" CommandName="Delete"
                      CommandArgument='<%# Eval("ProductId")%>'
                      runat="server" OnClientClick="javascript: confirm('Delete Product?');" />
                  </div>
                </div>
              </div>
            </div>
          </ItemTemplate>
        </asp:TemplateField>
      </Columns>
    </asp:GridView>
  </form>
  <asp:ObjectDataSource runat="server"
    ID="odsProducts"
    TypeName="FormsOverDataSamples.ProductManager"
    SelectMethod="GetProducts" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
