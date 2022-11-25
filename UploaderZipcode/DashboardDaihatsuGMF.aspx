<%@ Import Namespace="UploaderZipcode" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardDaihatsuGMF.aspx.cs" Inherits="UploaderZipcode.DashboardDaihatsuGMF" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <%--<meta http-equiv="refresh" content="30" />--%>
    <title>Dashboard Gamification Daihatsu</title>

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

            if (Res[1] === "Reg=1") {
                $(document).ready(function () {
                    $("#dNational").hide(500);
                    $("#dRegional1").show(500);
                    $("#btnNation").show();
                    $("#btnRegion1").hide();
                });
            }
            else if (Res[1] === "Reg=0") {
                $(document).ready(function () {
                    $("#dRegional1").hide(500);
                    $("#dNational").show(500);
                    $("#btnNation").hide();
                    $("#btnRegion1").show();
                });
            }
        }
    </script>
    <style>
        .FontColour {
            color: white;
        }

        .btnHover:hover {
            color: antiquewhite;
            background-color: dodgerblue;
        }

        .btnHomeHover:hover {
            color: antiquewhite;
            background-color: limegreen;
        }
    </style>
</head>
<body style="background-image: url('Pictures/Background.jpg'); height: 550px; background-position: top; background-size: 100%; overflow-x: hidden; overflow-y: hidden">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Always" ViewStateMode="Enabled">
            <ContentTemplate>
                <div id="dNational" style="margin-top: 80px; margin-left: 130px">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 style="padding-left: 20px">
                                <asp:Label runat="server" ID="lblHeader1" CssClass="FontColour" Style="margin-left: -100px"></asp:Label></h1>
                            <table runat="server" style="width: 100%; height: 500px;">
                                <tr>
                                    <td rowspan="2" style="width: 50%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="ImgOne" Width="140px" Height="200px" ImageUrl="~/Pictures/Gold Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionOne" CssClass="font-weight-bold FontColour" Style="font-size: 20px; margin-left: 12px">1st Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameOne" CssClass="FontColour font-weight-bold" Style="font-size: 20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerOne" CssClass="FontColour" Style="font-size: 20px"></asp:Label><br />
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <br />
                                                <asp:Image runat="server" ID="Image1" Width="80px" Height="100px" ImageUrl="~/Pictures/Bronze Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionThree" CssClass="font-weight-bold FontColour" Style="font-size: 20px; margin-left: -12px">3rd Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameThree" CssClass="FontColour font-weight-bold" Style="font-size: 20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerThree" CssClass="FontColour" Style="font-size: 20px"></asp:Label>

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
                                                <asp:Label runat="server" ID="lblPositionFour" Style="font-size: 20px; margin-left: -12px" CssClass="font-weight-bold FontColour">4th Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameFour" CssClass="FontColour font-weight-bold" Style="font-size: 20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerFour" CssClass="FontColour" Style="font-size: 20px"></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image8" Width="140px" Height="200px" ImageUrl="~/Pictures/Silver Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionTwo" Style="font-size: 20px; margin-left: 12px" CssClass="font-weight-bold FontColour">2nd Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameTwo" CssClass="FontColour font-weight-bold" Style="font-size: 20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerTwo" CssClass="FontColour" Style="font-size: 20px"></asp:Label>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image3" Width="80px" Height="100px" ImageUrl="~/Pictures/Bronze Trophy.png" /><br />
                                                <asp:Label runat="server" ID="lblPositionFive" CssClass="font-weight-bold FontColour" Style="font-size: 20px; margin-left: -12px">5th Winner</asp:Label>
                                            </div>
                                            <div class="col-sm-6">
                                                <br />
                                                <asp:Label runat="server" ID="lblSalesmanNameFive" CssClass="FontColour font-weight-bold" Style="font-size: 20px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblDealerFive" CssClass="FontColour" Style="font-size: 20px"></asp:Label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="collapse" id="dRegional1" style="margin-top: 120px; margin-left: 80px">
                    <div class="row" runat="server" id="dReg1">
                        <div class="col-md-12">
                            <h2 style="margin-left: -20px">
                                <asp:Label runat="server" CssClass="FontColour" ID="lblHeader2"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%;">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image10" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" />
                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblSumateraName1" CssClass="FontColour font-weight-bold" Style="font-size: 18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblSumateraDealer1" CssClass="FontColour" Style="font-size: 18px"></asp:Label>
                                            </div>
                                            <div class="row" style="margin-left: 0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label1" CssClass="font-weight-bold FontColour" Style="font-size: 18px;">1st Winner</asp:Label>
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
                                                <asp:Label runat="server" ID="lblSumateraName2" CssClass="FontColour font-weight-bold" Style="font-size: 18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblSumateraDealer2" CssClass="FontColour" Style="font-size: 18px"></asp:Label>
                                            </div>
                                            <div class="row" style="margin-left: 0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label5" CssClass="font-weight-bold FontColour" Style="font-size: 18px">2nd Winner</asp:Label>
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
                                                <asp:Label runat="server" ID="lblSumateraName3" CssClass="FontColour font-weight-bold" Style="font-size: 18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblSumateraDealer3" CssClass="FontColour" Style="font-size: 18px"></asp:Label><br />
                                            </div>
                                            <div class="row" style="margin-left: 0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label9" CssClass="font-weight-bold FontColour" Style="font-size: 18px">3rd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <hr />
                    <div class="row" runat="server" id="dReg2">
                        <div class="col-md-12">
                            <h2 style="margin-left: -20px">
                                <asp:Label runat="server" CssClass="FontColour" ID="lblHeader3"></asp:Label></h2>
                            <table runat="server" style="width: 100%; height: 130px">
                                <tr>
                                    <td style="width: 33%">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <asp:Image runat="server" ID="Image11" Width="80px" ImageUrl="~/Pictures/Gold Trophy.png" />

                                            </div>
                                            <div class="col-sm-7">
                                                <br />
                                                <asp:Label runat="server" ID="lblJawaName1" CssClass="FontColour font-weight-bold" Style="font-size: 18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblJawaDealer1" CssClass="FontColour" Style="font-size: 18px"></asp:Label><br />
                                            </div>
                                            <div class="row" style="margin-left: 0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label13" CssClass="font-weight-bold FontColour" Style="font-size: 18px">1st Winner</asp:Label>
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
                                                <asp:Label runat="server" ID="lblJawaName2" CssClass="FontColour font-weight-bold" Style="font-size: 18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblJawaDealer2" CssClass="FontColour" Style="font-size: 18px"></asp:Label><br />
                                            </div>
                                            <div class="row" style="margin-left: 0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label17" CssClass="font-weight-bold FontColour" Style="font-size: 18px">2nd Winner</asp:Label>
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
                                                <asp:Label runat="server" ID="lblJawaName3" CssClass="FontColour font-weight-bold" Style="font-size: 18px"></asp:Label><br />
                                                <asp:Label runat="server" ID="lblJawaDealer3" CssClass="FontColour" Style="font-size: 18px"></asp:Label><br />
                                            </div>
                                            <div class="row" style="margin-left: 0.1%">
                                                <div class="col-sm-12">
                                                    <asp:Label runat="server" ID="Label21" CssClass="font-weight-bold FontColour" Style="font-size: 18px">3rd Winner</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div style="position: fixed; width: 100%; bottom: 10px">
                    <asp:LinkButton runat="server" ID="btnHome" CssClass="btn btnHomeHover" Text="Home" Style="float: left; margin-left: 50px; color: white" OnClick="btnHome_Click"></asp:LinkButton>
                    <a href="?Reg=1" class="btn btnHover" id="btnRegion1" style="float: right; margin-right: 50px; color: white">></a>
                    <a href="?Reg=0" class="btn btnHover" id="btnNation" style="float: right; display: none; margin-right: 50px; color: white"><</a>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
