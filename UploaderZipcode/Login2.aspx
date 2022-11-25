<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="UploaderZipcode.Login2" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>DASHBOARD MONITORING</title>
    <!-- Favicon-->
    <link rel="icon" href="Styles/img/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="Styles/css/font.css" rel="stylesheet" type="text/css">
    <link href="Styles/css/font2.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="Styles/css/bootstrap.css" rel="stylesheet">
    <script src="Styles/js/sweetalert.min.js"></script>

    <!-- Waves Effect Css -->
    <link href="Styles/css/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="Styles/css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="Styles/css/style.css" rel="stylesheet">

    <link href="Styles/css/bootstrap-select.css" rel="stylesheet" />



    <%--cek--%>


    <!-- Bootstrap Core Css -->
    <link href="Styles/css/bootstrap.min.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="Styles/css/waves.css" rel="stylesheet" />
    <link href="Styles/css/sweetalert.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="Styles/css/animate.css" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <%--<link href="Styles/css/morris.css" rel="stylesheet" />--%>

    <link href="Styles/css/datepicker3.css" rel="stylesheet" />
    <link href="Styles/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/css/fixedColumns.bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/css/bootstrap-select.css" rel="stylesheet" />
    <link href="Styles/css/tipped.css" rel="stylesheet" />

    <link rel="stylesheet" href="Styles/css/bootstrap-toggle.min.css">


    <!-- Custom Css -->
    <link href="Styles/css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="Styles/css/all-themes.css" rel="stylesheet" />


    <!-- Jquery Core Js -->
    <script src="Styles/js/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="Styles/js/bootstrap-3.4.1.js"></script>

    <!-- Select Plugin Js -->
    <script src="Styles/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="Styles/js/jquery.slimscroll.js"></script>
    <script src="Styles/js/jquery.validate.js"></script>

    <script src="Styles/js/waves.js"></script>
    <script src="Styles/js/moment.js"></script>
    <script src="Styles/js/bootstrap-datepicker.js"></script>
    <script src="Styles/js/admin.js"></script>
    <script src="Styles/js/tipped.js"></script>

    <script src="Styles/js/jquery.dataTables.min.js"></script>
    <script src="Styles/js/dataTables.bootstrap.js"></script>
    <script src="Styles/js/dataTables.fixedColumns.min.js"></script>
    <script src="Styles/js/sweetalert.min.js"></script>
    <script src="Styles/js/jquery.steps.js"></script>
    <script src="Styles/js/jquery.countTo.js"></script>
    <script src="Styles/js/Chart.bundle.js"></script>
    <script src="Styles/js/utils.js"></script>
    <script src="Styles/js/bootstrap-toggle.min.js"></script>
    <link rel="icon" type="image/png" href="Styles/img/favicon.ico">


</head>

<body class="login-page">
    <div class="login-box" style="margin-top: 30%">
        <div class="logo">
            <div class="row clearfix">
                <div class="col-md-4">
                    <img src="Styles/img/logo.png" />
                </div>
                <div class="col-md-8">
                    <a href="javascript:void(0);" style="font-size:34px !important">DASHBOARD MONITORING</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" method="POST" runat="server">
                    <asp:Panel ID="pnlLogon" runat="server" DefaultButton="btnLogin" Width="100%">
                        <div class="msg">Sign in to start your session</div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="material-icons">person</i>
                            </span>
                            <div class="form-line">
                                <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username" required>OS0639</asp:TextBox>
                            </div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="material-icons">lock</i>
                            </span>
                            <div class="form-line">
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control" placeholder="Password" required></asp:TextBox>
                            </div>
                        </div>
                        <asp:Panel runat="server" Visible="false" ID="panelDivBranch">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">view_headline</i>
                                </span>
                                <div class="form-line">
                                    <asp:ListBox ID="ddlDivBranch" runat="server" CssClass="form-control show-tick" Style="width: 100%;"></asp:ListBox>
                                </div>
                            </div>
                        </asp:Panel>
                       
                          <div class="row">
                            <div class="col-xs-4">
                                <asp:LinkButton ID="btnLogin" runat="server" class="btn btn-block bg-pink waves-effect" OnClick="btnLogin_Click">SIGN IN</asp:LinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="Styles/js/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="Styles/js/bootstrap-3.4.1.js"></script>
    <script src="Styles/js/bootstrap-select.js"></script>


    <!-- Waves Effect Plugin Js -->
    <script src="Styles/js/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="Styles/js/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="Styles/js/admin.js"></script>
</body>

</html>
