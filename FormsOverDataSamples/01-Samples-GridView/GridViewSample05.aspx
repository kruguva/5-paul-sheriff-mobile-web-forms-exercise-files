<%@ Page Title="GridView with Modal Input" Language="C#"
  MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true" CodeBehind="GridViewSample05.aspx.cs"
  Inherits="FormsOverDataSamples.Samples.GridViewSample05" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <!-- Bring in Pager Styles -->
  <link href="../css/PagerStyle.css" rel="stylesheet" type="text/css" />
  <script>
    function AddData() {
      $("#hdnPK").val("-1");
      $("#lblTitle").text("Add New Product");
      $("#txtProductName").val("");
      $("#txtIntroductionDate").val(new Date().toLocaleDateString());
      $("#txtCost").val("0");
      $("#txtPrice").val("0");
      $("#btnSave").val("Create Product");
      $("#hdnAddMode").val("true");
      $('#productDialog').modal();
    }
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row">
    <div class="col-xs-12 col-sm-6 col-md-8">
      <h3>Products</h3>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12 col-sm-6 col-md-8">
      <!-- Add Button -->
      <a href="#" data-toggle="modal" onclick="AddData();" class="btn btn-primary">Add New
        Product</a>
    </div>
  </div>
  <form id="frmProduct" runat="server">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-8">
        <div class="modal fade" id="productDialog" tabindex="-1" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="lblTitle" runat="server">Product</h4>
              </div>
              <div class="modal-body">
                <input type="hidden" id="hdnPK" runat="server" />
                <input type="hidden" id="hdnAddMode" runat="server" value="false" />
                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group">
                      <label for="txtProductName">Product Name</label>
                      <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                          <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" autofocus="autofocus"
                            required="required" placeholder="Product Name" title="Product Name"></asp:TextBox>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="txtIntroductionDate">Introduction Date</label>
                      <div class="row">
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                          <asp:TextBox ID="txtIntroductionDate" runat="server"
                            CssClass="form-control" TextMode="Date"
                            placeholder="Introduction Date" title="Introduction Date"></asp:TextBox>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="txtCost">Cost</label>
                      <div class="input-group">
                        <asp:TextBox ID="txtCost" runat="server" TextMode="Number" CssClass="form-control"
                          min="0" max="9999" step="any" required="required" placeholder="Cost" title="Cost"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="txtPrice">Price</label>
                      <div class="input-group">
                        <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" CssClass="form-control"
                          min="1" max="9999" step="any" required="required" placeholder="Price" title="Price"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="checkbox">
                        <label>
                          <asp:CheckBox ID="chkIsDiscontinued" runat="server" />Is Discontinued?
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
                <div id="divMessageArea" runat="server" visible="false">
                  <div class="clearfix"></div>
                  <div class="row messageArea">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                      <div class="well">
                        <asp:Label ID="lblMessage" runat="server"
                          CssClass="text-warning"
                          Text="This is some text to show what a message would look like."></asp:Label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <asp:Button ID="btnCancel" runat="server" 
                  Text="Cancel" 
                  CssClass="btn btn-default"
                  title="Cancel" 
                  data-dismiss="modal" />
                <asp:Button ID="btnSave" runat="server" 
                  Text="Update Product" 
                  CssClass="btn btn-primary"
                  title="Update Product" 
                  OnClick="btnSave_Click" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <asp:GridView ID="grdAltProducts" runat="server"
        CssClass="table table-striped table-bordered"
        DataSourceID="odsProducts"
        PageSize="4"
        AllowPaging="True"
        AutoGenerateColumns="False"
        OnRowCommand="grdProducts_RowCommand">
        <Columns>
          <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
              <a href='GridViewSample05.aspx?id=<%# Eval("ProductId") %>'>
                <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
              </a>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="IntroductionDate" HeaderText="Introduction Date" />
          <asp:BoundField DataField="Cost" DataFormatString="{0:c}" HeaderText="Cost" />
          <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Price" />
          <asp:BoundField DataField="IsDiscontinued" HeaderText="Is Discontinued?" />
        </Columns>
      </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="odsProducts" runat="server"
      TypeName="FormsOverDataSamples.ProductManager"
      SelectMethod="GetProducts" />
  </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
