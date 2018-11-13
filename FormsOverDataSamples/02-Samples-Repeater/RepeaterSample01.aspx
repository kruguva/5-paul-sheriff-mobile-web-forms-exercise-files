<%@ Page Title="Alternate Repeater Format"
  Language="C#"
  EnableViewState="true"
  MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true"
  CodeBehind="RepeaterSample01.aspx.cs" Inherits="FormsOverDataSamples.RepeaterSample01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h3>Alternate Repeater Format</h3>
  <form id="form1" runat="server">
    <asp:Repeater ID="repProducts" runat="server" OnItemCommand="repProducts_ItemCommand">
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
                CommandArgument='<%# Eval("ProductId") %>' />
              <asp:Button ID="btnDelete" runat="server"
                CssClass="btn btn-primary"
                Text="Delete"
                CommandName="Delete"
                CommandArgument='<%# Eval("ProductId") %>'
                OnClientClick="javascript: confirm('Delete Product?');" />
            </div>
          </div>
        </div>
      </ItemTemplate>
    </asp:Repeater>
  </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
