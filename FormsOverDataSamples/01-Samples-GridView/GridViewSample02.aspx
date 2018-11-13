<%@ Page Title="Responsive GridView" Language="C#"
  MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true"
  CodeBehind="GridViewSample02.aspx.cs"
  Inherits="FormsOverDataSamples.Samples.GridViewSample02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <!-- Bring in Pager Styles -->
  <link href="../css/PagerStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h3>Responsive GridView</h3>
  <form id="form1" runat="server">
    <div class="table-responsive">
      <asp:GridView ID="grdProducts" runat="server"
        DataSourceID="odsProducts"
        CssClass="table table-striped"
        PageSize="4"
        AllowPaging="true">
      </asp:GridView>
    </div>
  </form>
  <asp:ObjectDataSource ID="odsProducts" runat="server"
    TypeName="FormsOverDataSamples.ProductManager"
    SelectMethod="GetProducts" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
