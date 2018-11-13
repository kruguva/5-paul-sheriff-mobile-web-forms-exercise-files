<%@ Page Title="GridView Samples" Language="C#" MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true"
  CodeBehind="Home.aspx.cs" Inherits="FormsOverDataSamples.Samples.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <style>
    .btn-primary:hover {
      color: black;
    }

    .btn-primary:active {
      color: black;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <h3>GridView Samples</h3>
  <ul class="nav nav-stacked nav-pills pull-left">
    <li><a href="GridViewSample01.aspx" class="btn btn-primary">Non-Responsive GridView</a>
    </li>
    <li><a href="GridViewSample02.aspx" class="btn btn-primary">Bootstrap 'table' GridView</a>
    </li>
    <li><a href="#" class="divider"></a></li>
    <li><a href="GridViewSample03.aspx" class="btn btn-primary">Grid View and Detail View</a></li>
    <li><a href="#" class="divider"></a></li>
    <li><a href="GridViewSample04.aspx" class="btn btn-primary">GridView with Edit</a>
    </li>
    <li><a href="GridViewSample05.aspx" class="btn btn-primary">GridView with Modal Edit</a>
    </li>
    <li><a href="#" class="divider"></a></li>
    <li><a href="GridViewSample06.aspx" class="btn btn-primary">Alternative GridView</a>
  </ul>
</asp:Content>
