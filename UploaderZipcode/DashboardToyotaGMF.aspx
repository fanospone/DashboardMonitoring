<%@ Import Namespace="UploaderZipcode" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardToyotaGMF.aspx.cs" Inherits="UploaderZipcode.DashboardToyotaGMF" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <%--<meta http-equiv="refresh" content="30" />--%>
    <title>Dashboard Gamification Toyota</title>

    <link href="Styles/css/CSS.css" rel="stylesheet" />
    <link href="Styles/css/bootstrap4.min.css" rel="stylesheet">
    <script src="Styles/js/bootstrap4.min.js"></script>
    <script src="Styles/js/jquery-1.12.4.min.js"></script>
    <script src="Styles/HighCharts/JavaScript.js"></script>
    <script type="text/javascript">
        var idInterval = setInterval("reloadPage()", 30000);

        function reloadPage() {
            location.reload();
        }
        function TurnPage() {
            var LinkUrl = window.location.href;
            var Res = LinkUrl.split("?");

            if (Res[1] == "Reg=1") {
                $(document).ready(function () {
                    $("#dNational").hide(0);
                    $("#dRegional1").show(0);
                    $("#dRegional2").hide(0);
                    $("#btnNation").show();
                    $("#btnRegion1").hide();
                    $("#btnRegion2").show();
                    $("#btnRegion3").hide();
                });
            }
            else if (Res[1] == "Reg=2") {
                $(document).ready(function () {
                    $("#dNational").hide(0);
                    $("#dRegional1").hide(0);
                    $("#dRegional2").show(0);
                    $("#btnNation").hide();
                    $("#btnRegion1").hide();
                    $("#btnRegion2").hide();
                    $("#btnRegion3").show();
                });
            }
            else if (Res[1] == "Reg=0"){
                $(document).ready(function () {
                    $("#dNational").show(0);
                    $("#dRegional1").hide(0);
                    $("#dRegional2").hide(0);
                    $("#btnNation").hide();
                    $("#btnRegion1").show();
                    $("#btnRegion2").hide();
                    $("#btnRegion3").hide();
                });
            }
        }
    </script>
    <style>
        .FontColour
        {
            color:white;
        }

        .btnHover:hover
        {
            color: antiquewhite;
            background-color: dodgerblue;
        }

        .btnHomeHover:hover
        {
            color: antiquewhite;
            background-color: limegreen;
        }
    </style>
</head>
<body style="background-image:url('Pictures/Background.jpg');height: 550px;background-position:top;background-size: 100%;overflow-x:hidden;overflow-y:hidden">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ViewStateMode="Enabled">
            <ContentTemplate>
                <div id="dNational" style="margin-top:80px;margin-left:130px">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 style="padding-left: 20px">
                                <asp:Label runat="server" ID="lblHeader1" CssClass="FontColour" style="margin-left:-100px"></asp:Label></h1>
                            <table runat="server" style="width: 100%; height: 500px;">
                                <tr>
                                    <td rowspan="2" style="width: 50%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="ImgOne" Width="140px" Height="200px" ImageUrl="~/Pictures/Gold Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionOne" CssClass="font-weight-bold FontColour" style="Font-Size:20px;margin-left:12px">1st Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameOne" CssClass="FontColour font-weight-bold" style="Font-Size:20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerOne" CssClass="FontColour" style="Font-Size:20px"></asp:Label><br />
                                            </div>                                            
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <br />
                                                <asp:Image runat="server" ID="Image1" Width="80px" Height="100px" ImageUrl="~/Pictures/Bronze Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionThree" CssClass="font-weight-bold FontColour" style="Font-Size:20px;margin-left:-12px">3rd Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameThree" CssClass="FontColour font-weight-bold" style="Font-Size:20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerThree" CssClass="FontColour" style="Font-Size:20px"></asp:Label>
                                                
                                            </div>
                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <br />
                                                <asp:Image runat="server" ID="Image2" Width="80px" Height="100px" ImageUrl="~/Pictures/Bronze Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionFour" style="Font-Size:20px;margin-left:-12px" CssClass="font-weight-bold FontColour">4th Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameFour"  CssClass="FontColour font-weight-bold" style="Font-Size:20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerFour" CssClass="FontColour" style="Font-Size:20px"></asp:Label>                                                
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image8" Width="140px" Height="200px" ImageUrl="~/Pictures/Silver Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionTwo" style="Font-Size:20px;margin-left:12px" CssClass="font-weight-bold FontColour">2nd Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameTwo" CssClass="FontColour font-weight-bold" style="Font-Size:20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerTwo" CssClass="FontColour" style="Font-Size:20px"></asp:Label>                                           
                                            </div>
                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image3" Width="80px" Height="100px" ImageUrl="~/Pictures/Bronze Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionFive" CssClass="font-weight-bold FontColour" style="Font-Size:20px;margin-left:-12px">5th Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameFive" CssClass="FontColour font-weight-bold" style="Font-Size:20px"></asp:Label><br /> 
                                                <asp:Label runat="server" ID="lblDealerFive" CssClass="FontColour" style="Font-Size:20px"></asp:Label>
                                            </div>                                         
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="dRegional1" style="margin-top: 40px;margin-left:50px">
                    <div class="row" runat="server" id="dSumatera">
                        <div class="col-md-12">
                            <h2 style="margin-left:-20px">
                                <asp:Label runat="server" ID="lblHeader2" CssClass="FontColour"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%;">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image10" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" />
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblSumateraName1" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblSumateraDealer1" CssClass="FontColour" style="Font-Size:18px"></asp:Label>                                        
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label1" CssClass="font-weight-bold FontColour" style="Font-Size:18px">1st Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image12" Width="80px" ImageUrl="~/Pictures/Silver Trophy.png" />
                                                
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblSumateraName2" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblSumateraDealer2" CssClass="FontColour" style="Font-Size:18px"></asp:Label>                                             
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label5" CssClass="font-weight-bold FontColour" style="Font-Size:18px">2nd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image14" Width="80px" ImageUrl="~/Pictures/Bronze Trophy.png" />
                                                
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblSumateraName3" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblSumateraDealer3" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />                           
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label9" CssClass="font-weight-bold FontColour" style="Font-Size:18px">3rd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div class="row" runat="server" id="dJawa">
                        <div class="col-md-12">
                            <h2 style="margin-left: -20px">
                                <asp:Label runat="server" ID="lblHeader3" CssClass="FontColour"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image11" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" />
                                                
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblJawaName1" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblJawaDealer1" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />                                           
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label13" CssClass="font-weight-bold FontColour" style="Font-Size:18px">1st Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image13" Width="80px" ImageUrl="~/Pictures/Silver Trophy.png" />
                                                
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblJawaName2" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblJawaDealer2" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label17" CssClass="font-weight-bold FontColour" style="Font-Size:18px">2nd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image15" Width="80px" ImageUrl="~/Pictures/Bronze Trophy.png" />                                               
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblJawaName3" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblJawaDealer3" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />                                               
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label21" CssClass="font-weight-bold FontColour" style="Font-Size:18px">3rd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div class="row" runat="server" id="dBali">
                        <div class="col-md-12">
                            <h2 style="margin-left: -20px">
                                <asp:Label runat="server" ID="lblHeader4" CssClass="FontColour"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image16" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" />
                                                
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblBaliName1" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblBaliDealer1" CssClass="FontColour" style="Font-Size:18px"></asp:Label>                                               
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label25" CssClass="font-weight-bold FontColour" style="Font-Size:18px">1st Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image17" Width="80px" ImageUrl="~/Pictures/Silver Trophy.png" /> 
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblBaliName2" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblBaliDealer2" CssClass="FontColour" style="Font-Size:18px"></asp:Label>                                               
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label29" CssClass="font-weight-bold FontColour" style="Font-Size:18px">2nd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image18" Width="80px" ImageUrl="~/Pictures/Bronze Trophy.png" />                                              
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblBaliName3" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblBaliDealer3" CssClass="FontColour" style="Font-Size:18px"></asp:Label>                                           
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label33" CssClass="font-weight-bold FontColour" style="Font-Size:18px">3rd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="dRegional2" style="margin-top: 120px;margin-left:50px">
                    <div class="row" runat="server" id="dReg4">
                        <div class="col-md-12">
                            <h2 style="margin-left: -20px">
                                <asp:Label runat="server" ID="lblHeader5" CssClass="FontColour"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image19" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" /><br />
                                                
                                            </div>
                                            <div class="col-sm-8">
                                                <br />
                                                <asp:Label runat="server" ID="lblReg4Name1" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg4Dealer1" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />                                              
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label37" CssClass="font-weight-bold FontColour" style="Font-Size:18px">1st Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image20" Width="80px" ImageUrl="~/Pictures/Silver Trophy.png" />                                            
                                            </div>
                                            <div class="col-sm-8">
                                                <br />
                                                <asp:Label runat="server" ID="lblReg4Name2" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg4Dealer2" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />                       
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label41" CssClass="font-weight-bold FontColour" style="Font-Size:18px">2nd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Image runat="server" ID="Image21" Width="80px" ImageUrl="~/Pictures/Bronze Trophy.png" /><br />
                                                
                                            </div>
                                            <div class="col-sm-8">
                                                <br />
                                                <asp:Label runat="server" ID="lblReg4Name3" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg4Dealer3" CssClass="FontColour" style="Font-Size:18px"></asp:Label>                                               
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label45" CssClass="font-weight-bold FontColour" style="Font-Size:18px">3rd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <hr class="FontColour" />
                    <div class="row" runat="server" id="dReg5">
                        <div class="col-md-12">
                            <h2 style="margin-left: -20px">
                                <asp:Label runat="server" ID="lblHeader6" CssClass="FontColour"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Image runat="server" ID="Image22" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" /><br />
                                                
                                            </div>
                                            <div class="col-sm-8">
                                                <br />
                                                <asp:Label runat="server" ID="lblReg5Name1" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg5Dealer1" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />                                              
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label49" CssClass="font-weight-bold FontColour" style="Font-Size:18px">1st Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Image runat="server" ID="Image23" Width="80px" ImageUrl="~/Pictures/Silver Trophy.png" />
                                                
                                            </div>
                                            <div class="col-sm-8">
                                                <br />
                                                <asp:Label runat="server" ID="lblReg5Name2" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg5Dealer2" CssClass="FontColour" style="Font-Size:18px"></asp:Label>                                             
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label53" CssClass="font-weight-bold FontColour" style="Font-Size:18px">2nd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Image runat="server" ID="Image24" Width="80px" ImageUrl="~/Pictures/Bronze Trophy.png" />                                           
                                            </div>
                                            <div class="col-sm-8">
                                                <br />
                                                <asp:Label runat="server" ID="lblReg5Name3" CssClass="FontColour font-weight-bold" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg5Dealer3" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />                                        
                                            </div>
                                            <div class="row" style="margin-left:0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label57" CssClass="font-weight-bold FontColour" style="Font-Size:18px">3rd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <hr  class="FontColour"/>
                    <div class="row" runat="server" id="dReg6">
                        <div class="col-md-12">
                            <h2 style="margin-left: -20px">
                                <asp:Label runat="server" ID="lblHeader7" CssClass="FontColour"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Image runat="server" ID="Image25" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" /><br />
                                                <asp:Label runat="server" ID="Label61" CssClass="font-weight-bold FontColour" style="Font-Size:18px">1st Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                
                                                <asp:Label runat="server" ID="lblReg6Name1" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg6Dealer1" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />
                                                
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image26" Width="80px" ImageUrl="~/Pictures/Silver Trophy.png" /><br />
                                                <asp:Label runat="server" ID="Label65" CssClass="font-weight-bold FontColour" style="Font-Size:18px">2nd Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                
                                                <asp:Label runat="server" ID="lblReg6Name2" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg6Dealer2" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />
                                                
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <asp:Image runat="server" ID="Image27" Width="80px" ImageUrl="~/Pictures/Bronze Trophy.png" /><br />
                                                <asp:Label runat="server" ID="Label69" CssClass="font-weight-bold FontColour" style="Font-Size:18px">3rd Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-8">
                                                
                                                <asp:Label runat="server" ID="lblReg6Name3" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblReg6Dealer3" CssClass="FontColour" style="Font-Size:18px"></asp:Label><br />
                                                
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <%--<div style="position:fixed;width: 100px; top:10px">
                    <asp:Image runat="server" ID="Image4" Width="80px" ImageUrl="~/Pictures/Bronze Trophy.png" />
                </div>--%>
                <div style="position: fixed; width: 100%; bottom: 10px;">
                    <asp:LinkButton runat="server" ID="btnHome" CssClass="btn btnHomeHover" Text="Home" style="float:left;margin-left:50px;" OnClick="btnHome_Click" ></asp:LinkButton>
                    <a href="?Reg=1" class="btn btnHover" id="btnRegion1" style="float: right; margin-right: 50px;">></a>
                    <a href="?Reg=2" class="btn btnHover" id="btnRegion2" style="float: right; display: none; margin-right: 50px;">></a>
                    <a href="?Reg=1" class="btn btnHover" id="btnRegion3" style="float: right; display: none; margin-right: 50px;"><</a>
                    <a href="?Reg=0" class="btn btnHover" id="btnNation" style="float: right; display: none; margin-right: 10px;"><</a>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
