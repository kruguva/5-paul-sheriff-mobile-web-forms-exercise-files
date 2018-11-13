<%@ Page Title="Repeater Samples" Language="C#" MasterPageFile="~/MasterPages/Bootstrap.Master"
  AutoEventWireup="true"
  CodeBehind="Home.aspx.cs" Inherits="FormsOverDataSamples.Samples_Repeater.Home" %>

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
  <h3>Repeater Samples</h3>
  <ul class="nav nav-stacked nav-pills pull-left">
    <li><a href="RepeaterSample01.aspx" class="btn btn-primary">Same as Alternate GridView</a>
    </li>
    <li><a href="#" class="divider"></a></li>
    <li><a href="RepeaterSample02.aspx" class="btn btn-primary">Carousel</a>
    </li>
  </ul>
</asp:Content>
