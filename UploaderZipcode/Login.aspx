<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" runat="server" %>


<%@ Import Namespace="UploaderZipcode" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UploaderZipcode.Login" %>

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
    <link href="Styles/css/sweetalert.css" rel="stylesheet" />
    <link href="Styles/css/font2.css" rel="stylesheet" type="text/css">
    <link href="Styles/css/CSS.css" rel="stylesheet" />

    <!-- Bootstrap Core Css -->
    <link href="Styles/css/bootstrap.css" rel="stylesheet">
    <script src="Styles/js/sweetalert.min.js"></script>

    <!-- Waves Effect Css -->
    <link href="Styles/css/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="Styles/css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="Styles/css/style.css" rel="stylesheet">
    <script src="Styles/js/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="Styles/js/bootstrap-3.4.1.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="Styles/js/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="Styles/js/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="Styles/js/admin.js"></script>



</head>

<body class="login-page" style="background-color: cadetblue; width: auto; background-repeat: no-repeat; background-size: cover; background-color: deepskyblue">
    <div class="login-box" style="margin-top: 30%">

        <div class="logo">
            <div class="row clearfix">
                <div class="col-md-4">
                    <img src="Styles/img/logo.png" />
                </div>
                <div class="col-md-8">
                    <a href="javascript:void(0);" style="font-size: 34px !important">DASHBOARD MONITORING</a>
                </div>
            </div>
        </div>
        <div class="card" style="opacity: 0.95">
            <div class="body">
                <form id="sign_in" method="POST" runat="server" autocomplete="off">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:Panel ID="pnlLogon" runat="server" DefaultButton="btnLogin" Width="100%">

                        <div class="msg">Sign in to start your session</div>
                        <div class="input-group" style="margin-bottom: 15px">
                            <span class="input-group-addon">
                                <i class="material-icons">person</i>
                            </span>
                            <div class="form-line">
                                <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username" required=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="input-group" style="margin-bottom: 15px">
                            <span class="input-group-addon">
                                <i class="material-icons">lock</i>
                            </span>
                            <div class="form-line">
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control" placeholder="Password" required="" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4" style="margin-bottom: 10px">
                                <asp:LinkButton ID="btnLogin" runat="server" class="btn btn-block bg-pink waves-effect" OnClick="btnLogin_Click">SIGN IN</asp:LinkButton>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="body" BackColor="White" Style="display: none;">
                        <div class="form-group">


                            <div class="msg">Please Check your Email to Get OTP Authenticationn</div>

                            <br />
                            <label for="txtOtpNumber" id="lblOtpNumber">Input OTP Authentication</label>

                            <div class="form-line">
                                <asp:TextBox ID="txtOtpNumber" runat="server" class="form-control" placeholder="Username" required></asp:TextBox>
                            </div>

                            <br />
                            <div class="row">
                                <div class="col-xs-4" style="margin-bottom: 10px">
                                    <asp:LinkButton ID="btnSubmit" runat="server" class="btn btn-block bg-green waves-effect" ValidationGroup="VgRequire" OnClick="btnSubmit_Click">Submit</asp:LinkButton>
                                </div>

                                <div class="col-xs-4" style="margin-bottom: 10px">
                                    <asp:LinkButton ID="lnkBtnResend" runat="server" class="btn btn-block bg-blue waves-effect" OnClick="lnkBtnResend_Click">Resend OTP</asp:LinkButton>
                                </div>
                            </div>

                            <%--<div>
                                <asp:TextBox runat="server" ID="txtOtpNumber" AutoComplete="off"></asp:TextBox>
                                <asp:LinkButton runat="server" ID="btnSubmit" Style="color: azure" CssClass="btn btn-primary waves-effect" ValidationGroup="VgRequire" OnClick="btnSubmit_Click">Submit</asp:LinkButton>
                                <label class="font-underline" style="margin-left: 30px">
                                    <asp:LinkButton runat="server" ID="lnkBtnResend" Text="Resend OTP" Style="color: blue" OnClick="lnkBtnResend_Click"></asp:LinkButton></label>
                            </div>--%>
                            <div class="row">
                                <div style="margin-left: 15px">
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtOtpNumber"
                                        runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="VgRequire" />

                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                    <asp:ModalPopupExtender ID="popup" runat="server" DropShadow="false"
                        PopupControlID="pnlAddEdit" TargetControlID="lnkFake"
                        BackgroundCssClass="modalBackground">
                    </asp:ModalPopupExtender>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->


</body>

</html>
