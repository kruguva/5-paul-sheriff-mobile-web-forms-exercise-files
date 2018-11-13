<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Bootstrap.Master" AutoEventWireup="true"
  CodeBehind="ProductEdit.aspx.cs" Inherits="FormsOverDataSamples.ProductForms.ProductEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <form id="MainForm" runat="server" role="form">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-8">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">Manage Product</h3>
          </div>
          <div class="panel-body">
            <div class="form-group">
              <label for="txtProductName">Product Name</label>
              <div class="row">
                <div class="col-xs-12 col-sm-8 col-md-8">
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
          <div class="panel-footer">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
              title="Cancel" formnovalidate="formnovalidate" OnClick="btnCancel_Click" UseSubmitBehavior="false" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
              title="Save" OnClick="btnSave_Click" />
          </div>
        </div>
      </div>
    </div>
  </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
