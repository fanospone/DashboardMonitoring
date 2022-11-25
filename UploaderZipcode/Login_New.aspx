<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" runat="server" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_New.aspx.cs" Inherits="UploaderZipcode.Login_New" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Dashboard Monitoring</title>
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

    <script>
        function Hidepopup() {
            $find("popup").hide();
            return false;
        }
    </script>
    <script>
        function dialog(title, message, type, url) {
            swal({
                title: title,
                text: message,
                type: type,
                showCancelButton: false,
                closeOnConfirm: false
            },
                function () {
                    window.location.replace(url);
                });
        }
    </script>

</head>
<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="text-align:center">
                    <img src="Styles/img/logo.png" style="margin-top: 2%;" />
                </div>
                
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <a href="javascript:void(0);">Dashboard Monitoring</a>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" method="POST" runat="server">
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnLogin" Width="100%">
                        <div class="msg">Sign in to start your session</div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <i class="material-icons">person</i>
                            </span>
                            <div class="form-line">
                                <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtUsername" runat="server" ErrorMessage="This Field is Required" SetFocusOnError="true" ControlToValidate="txtUsername"
                                    Display="Dynamic" ForeColor="Red" ValidationGroup="vgLogin"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatortxtUsername" runat="server" ErrorMessage="Incorrect Input" SetFocusOnError="true" ControlToValidate="txtUsername"
                                    ValidationExpression="[a-zA-Z0-9]*$" Display="Dynamic" ForeColor="Red" ValidationGroup="vgLogin"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="input-group validate-input">
                            <span class="input-group-addon">
                                <i class="material-icons">lock</i>
                            </span>
                            <div class="form-line">
                                <span class="btn-show-pass">
                                    <i class="fa fa-eye"></i>
                                </span>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtPassword" runat="server" ErrorMessage="This Field is Required" SetFocusOnError="true" ControlToValidate="txtPassword"
                                    Display="Dynamic" ForeColor="Red" ValidationGroup="vgLogin"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4">
                                <asp:LinkButton ID="btnLogin" runat="server" PostBackUrl="~/Login_New.aspx" class="btn btn-block bg-pink waves-effect" ValidationGroup="vgLogin" OnClick="btnLogin_Click">Sign In</asp:LinkButton>
                            </div>
                        </div>
                        <div class="row">
                            <asp:Label ID="errorLabel" runat="server" class="form-control" Style="padding: 0 0 0 0; color: red; border: 0; background-color: transparent; font-size: 11px"></asp:Label>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="form-group">
                            <div class="row">
                                <p style="margin-left: 15px" class="font-bold">Please Check your Email to Get OTP Authentication</p>
                            </div>
                            <br />
                            <label for="txtOtpNumber" id="lblOtpNumber">Input OTP Authentication</label>
                            <div class="row">
                                <div class="form-group" style="width:90%;margin-left:15px">
                                    <div class="form-line">
                                        <asp:TextBox runat="server" ID="txtOtpNumber" AutoComplete="off" CssClass="form-control" placeholder="OTP Number"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtOtpNumber"
                                    runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="VgRequire" />
                                </div>
                            </div>
                            <div class="row">
                                <div style="margin-left:15px">
                                    <asp:LinkButton runat="server" ID="btnSubmit" style="color:azure" CssClass="btn btn-success waves-effect" ValidationGroup="VgRequire" OnClick="btnSubmit_Click">Submit</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lnkBtnResend" style="color:azure" Text="Resend OTP" CssClass="btn btn-primary waves-effect" OnClick="lnkBtnResend_Click" ></asp:LinkButton>
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
    

    <!--===============================================================================================-->
	<script src="Content/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Content/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Content/vendor/bootstrap/js/popper.js"></script>
	<script src="Content/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Content/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Content/vendor/daterangepicker/moment.min.js"></script>
	<script src="Content/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Content/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	
</body>

</html>
