<%@ Page Title="Non-Responsive GridView" Language="C#" 
  MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true" 
  CodeBehind="GridViewSample01.aspx.cs" 
  Inherits="FormsOverDataSamples.Samples.GridViewSample01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h3>Non-Responsive GridView</h3>
  <form id="form1" runat="server">
    <asp:GridView ID="grdProducts"
      DataSourceID="odsProducts"
      AllowPaging="true"
      PageSize="4"
      runat="server" CellPadding="4"
      ForeColor="#333333" GridLines="Both">
      <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
      <EditRowStyle BackColor="#999999" />
      <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
      <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
      <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
      <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
      <SortedAscendingCellStyle BackColor="#E9E7E2" />
      <SortedAscendingHeaderStyle BackColor="#506C8C" />
      <SortedDescendingCellStyle BackColor="#FFFDF8" />
      <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
  </form>
  <asp:ObjectDataSource ID="odsProducts" runat="server" 
    TypeName="FormsOverDataSamples.ProductManager"
    SelectMethod="GetProducts" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
