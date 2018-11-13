<%@ Page Title="Repeater using Carousel" 
  Language="C#"
  EnableViewState="true"   
  MasterPageFile="~/MasterPages/Bootstrap.Master" AutoEventWireup="true"
  CodeBehind="RepeaterSample02.aspx.cs" 
  Inherits="FormsOverDataSamples.RepeaterSample02" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <style>
    .productCarousel {
      height: 20em;
      background-color: lightgray;
    }

    .productBlock {
      border: none;
      margin-left: 18em;
      margin-right: 18em;
      padding: 0.5em 0.5em 0.5em 0.5em;
    }

    @media only screen and (max-width: 768px) {
      .productBlock {
        margin-left: 4.5em;
        margin-right: 2.4em;
      }

      .productNameTitle {
        font-size: large;
      }
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h3>Repeater using a Carousel</h3>
  <form id="form1" runat="server">
    <div id="carousel-products" 
         class="carousel slide productCarousel" 
         data-ride="carousel">
      <!-- Use one repeater for just the carousel indicators -->
      <asp:Repeater ID="repProductsHeaders" runat="server">
        <HeaderTemplate>
          <ol class="carousel-indicators">
        </HeaderTemplate>
        <ItemTemplate>
          <li data-target="#carousel-products" 
              title="<%# Eval("ProductName") %>" 
              data-slide-to="<%# Container.ItemIndex %>">
          </li>
        </ItemTemplate>
        <FooterTemplate>
          </ol>
        </FooterTemplate>
      </asp:Repeater>
      <div class="carousel-inner">
        <asp:Repeater ID="repProducts" runat="server" 
                      OnItemCommand="repProducts_ItemCommand">
          <ItemTemplate>
            <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
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
                  <asp:Button ID="btnEdit" CssClass="btn btn-primary" 
                    Text="Edit" 
                    CommandName="Edit"
                    CommandArgument='<%# Eval("ProductId")%>'
                    runat="server" />
                  <asp:Button ID="btnDelete" CssClass="btn btn-primary" 
                    Text="Delete" 
                    CommandName="Delete"
                    CommandArgument='<%# Eval("ProductId")%>'
                    runat="server" 
                    OnClientClick="javascript: confirm('Delete Product?');" />
                </div>
              </div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
      </div>
      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-products" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-products" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
  </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EndOfPageContent" runat="server">
</asp:Content>
