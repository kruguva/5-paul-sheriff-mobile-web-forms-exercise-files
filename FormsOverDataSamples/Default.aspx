<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FormsOverDataSamples.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Bootstrap Forms over Data Samples</title>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="../css/bootstrap.min.css" media="all" rel="stylesheet" type="text/css">

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../js/jquery-1.11.0.min.js"></script>

  <!-- Bootstrap plugins -->
  <script src="../js/bootstrap.min.js"></script>
  <style>
    .container {
      width: 95%;
    }

    .teaserArea {
      text-align: left;
      margin-left: 1em;
      margin-bottom: 1em;
      font-size: x-large;
    }
  </style>
</head>
<body>
  <nav class="nav navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <span class="navbar-brand">Forms over Data</span>
      </div>
    </div>
  </nav>
  <div id="main" role="main" class="mainArea">
    <div class="container">
      <div class="row">
        <div class="teaserArea">
          <p class="glyphicon glyphicon-th-list"></p>
          <a href="01-Samples-GridView/Home.aspx">Grid View Samples</a>
        </div>
        <div class="teaserArea">
          <p class="glyphicon glyphicon-align-center"></p>
          <a href="02-Samples-Repeater/Home.aspx">Repeater Samples</a>
        </div>
        <div class="teaserArea">
          <p class="glyphicon glyphicon-step-forward"></p>
          <a href="03-Samples-DualPurpose/DualPurpose.aspx">Dual Purpose</a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
