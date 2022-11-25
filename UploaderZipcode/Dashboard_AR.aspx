<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_AR.aspx.cs" Inherits="UploaderZipcode.Dashboard_AR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AR DASHBOARD</title>
    <link href="Styles/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/css/font.css" rel="stylesheet" type="text/css" />
    <link href="Styles/css/font2.css" rel="stylesheet" type="text/css" />
    <script src="Styles/HighCharts/Jquery.min.js"></script>
    <script src="Styles/HighCharts/HighCharts.js"></script>
    <script src="Styles/HighCharts/ShowHighCharts.js"></script>

    <style>
        #mySidenav #btnHome {
            position: absolute;
            left: -80px;
            transition: 0.3s;
            padding: 15px;
            width: 100px;
            text-decoration: none;
            font-size: 20px;
            color: white;
            border-radius: 0 5px 5px 0;
        }

            #mySidenav #btnHome:hover {
                left: 0;
            }

        #btnHome {
            top: 80px;
            background-color: gray;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mySidenav" class="sidenav">
            <asp:Button runat="server" ID="btnHome" Text="Home" OnClick="btnHome_Click" />
        </div>
        <div class="col-sm-12" style="margin-top: 5px; background-color: gainsboro">
            <div class="col-sm-3">
                <img src="Styles/img/favicon.ico" width="60" />
                <span style="font-size: 24px; font-weight: bold; margin-left: 20px">AR Dashboard</span>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList runat="server" ID="ddlCategory" CssClass="form-control" Style="margin-top: 10px; margin-left: -30px; background-color: antiquewhite; color: black; font-weight: bold" ClientIDMode="AutoID" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="National" Value="National" style="color: black; font-weight: bold"></asp:ListItem>
                    <asp:ListItem Text="Area" Value="Area" style="color: black; font-weight: bold"></asp:ListItem>
                    <asp:ListItem Text="Handling" Value="Handling" style="color: black; font-weight: bold"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-sm-2">
                <asp:DropDownList runat="server" Visible="false" ID="ddlArea" CssClass="form-control" Style="margin-top: 10px; margin-left: -30px; background-color: antiquewhite; color: black; font-weight: bold" ClientIDMode="AutoID" AutoPostBack="true" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:DropDownList runat="server" Visible="false" ID="ddlHandling" CssClass="form-control" Style="margin-top: 10px; margin-left: -30px; background-color: antiquewhite; color: black; font-weight: bold" ClientIDMode="AutoID" AutoPostBack="true" OnSelectedIndexChanged="ddlHandling_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-sm-5">
                <asp:Label runat="server" ID="lblDate" Style="float: right; font-weight: bold; margin-top: 20px" Text="Last Status"></asp:Label>
            </div>
        </div>
        <div style="float: left; background-color: gainsboro; margin-top: 5px; width: 329px; height: 580px; border-radius: 10px">
            <div style="margin-top: 20px">
                <asp:Label runat="server" ID="Label1" Text="Repo" Style="font-weight: bold; font-size: 16px; margin-left: 70px;"></asp:Label>
                <asp:Label runat="server" ID="Label2" Text="Inventory Asset" Style="font-weight: bold; font-size: 16px; margin-left: 68px;"></asp:Label><br />
                <br />
                <div style="background-color: aliceblue; width: 100px; height: 100px; border-radius: 100px; text-align: center; float: left; margin-left: 40px; border: solid 5px; border-color: white">
                    <asp:Label runat="server" ID="lblCountRepo" Font-Bold="true" Style="float: right"></asp:Label>
                    <img src="Styles/img/Arrow-Up-Green.png" width="25" style="float: right" runat="server" id="ImgGreenRepo" />
                    <img src="Styles/img/Arrow-Down-Red.png" width="25" style="float: right" runat="server" id="ImgRedRepo" />
                    <img src="Styles/img/Yellow-Equals.png" width="20" style="float: right; margin-right: 2px; margin-top: 3px" runat="server" id="ImgYellowRepo" />
                    <div style="margin-top: 25px">
                        <asp:Label runat="server" ID="lblTotalRepo" Text="Total Repo" Style="font-weight: bold; color: darkblue; font-size: 16px"></asp:Label>
                        <span style="font-weight: bold">/ </span>
                        <br />
                        <asp:Label runat="server" ID="lblTargetRepo" Text="Target Repo" Style="font-weight: bold; color: darkblue; font-size: 16px"></asp:Label>
                    </div>
                </div>
                <div style="background-color: coral; width: 100px; height: 100px; border-radius: 100px; text-align: center; float: left; margin-left: 40px; border: solid 5px; border-color: white">
                    <asp:Label runat="server" ID="lblCountInv" Font-Bold="true" Style="float: right"></asp:Label>
                    <img src="Styles/img/Arrow-Up-Green.png" width="25" style="float: right" runat="server" id="ImgGreenInv" />
                    <img src="Styles/img/Arrow-Down-Red.png" width="25" style="float: right" runat="server" id="ImgRedInv" />
                    <img src="Styles/img/Yellow-Equals.png" width="20" style="float: right; margin-right: 2px; margin-top: 3px" runat="server" id="ImgYellowInv" />
                    <div style="margin-top: 38px">
                        <asp:Label runat="server" ID="lblInvAsset" Text="Total Inv" Style="font-weight: bold; color: white; font-size: 16px"></asp:Label>
                    </div>
                </div>
            </div>
            <div runat="server" id="dBalance7" style="border: solid 1px; border-color: darkblue; border-radius: 10px; margin-top: 120px; margin-left: 25px; width: 280px; height: 70px;">
                <div style="float: left; margin-left: 5px">
                    <asp:Label runat="server" ID="lblBalance7" Text="Bal > 7" Style="font-weight: bold; font-size: 12px"></asp:Label>
                </div>
                <div style="float: left; margin-left: 25px; margin-top: 5px">
                    <asp:Label runat="server" ID="lblBalance7Total" Text="0.00%" Style="font-weight: bold; font-size: 25px; color: goldenrod"></asp:Label><br />
                    <asp:Label runat="server" ID="lblOsar7" Text="0" Style="font-weight: bold; color: black"></asp:Label>
                </div>
                <div style="float: left; margin-left: 10px; margin-top: 5px">
                    <img runat="server" src="~/Styles/img/Yellow-Equals.png" width="10" id="ImgOsar7YellowEquals" />
                    <img runat="server" src="~/Styles/img/Red-Triangle.png" width="10" id="ImgOsar7RedTriangle" />
                    <img runat="server" src="~/Styles/img/Green-triangle.png" width="10" id="ImgOsar7GreenTriangle" />
                    <asp:Label runat="server" ID="lblBalance7Dif" Style="font-size: 12px"></asp:Label>
                    /
                    <br />
                    <asp:Label runat="server" ID="lblOsar7Dif" Style="font-size: 12px; margin-left: 15px"></asp:Label>
                </div>
            </div>
            <div runat="server" id="dBalance30" style="border: solid 1px; border-color: darkblue; border-radius: 10px; margin-top: 10px; margin-left: 25px; width: 280px; height: 70px; background-color: aliceblue">
                <div style="float: left; margin-left: 5px">
                    <asp:Label runat="server" ID="Label3" Text="Bal > 30" Style="font-weight: bold; font-size: 12px"></asp:Label>
                </div>
                <div style="float: left; margin-left: 20px; margin-top: 5px">
                    <asp:Label runat="server" ID="lblBalance30Total" Text="0.00%" Style="font-weight: bold; font-size: 25px; color: darkblue"></asp:Label><br />
                    <asp:Label runat="server" ID="lblOsar30" Text="0" Style="font-weight: bold; color: black"></asp:Label>
                </div>
                <div style="float: left; margin-left: 10px; margin-top: 5px">
                    <img runat="server" src="~/Styles/img/Yellow-Equals.png" width="10" id="ImgOsar30YellowEquals" />
                    <img runat="server" src="~/Styles/img/Red-Triangle.png" width="10" id="ImgOsar30RedTriangle" />
                    <img runat="server" src="~/Styles/img/Green-triangle.png" width="10" id="ImgOsar30GreenTriangle" />
                    <asp:Label runat="server" ID="lblBalance30Dif" Style="font-size: 12px"></asp:Label>
                    /
                    <br />
                    <asp:Label runat="server" ID="lblOsar30Dif" Style="font-size: 12px; margin-left: 15px"></asp:Label>
                </div>
            </div>
            <div runat="server" id="dBalance60" style="border: solid 1px; border-color: darkblue; border-radius: 10px; margin-top: 10px; margin-left: 25px; width: 280px; height: 70px; background-color: aliceblue">
                <div style="float: left; margin-left: 5px">
                    <asp:Label runat="server" ID="Label4" Text="Bal > 60" Style="font-weight: bold; font-size: 12px"></asp:Label>
                </div>
                <div style="float: left; margin-left: 20px; margin-top: 5px">
                    <asp:Label runat="server" ID="lblBalance60Total" Text="0.00%" Style="font-weight: bold; font-size: 25px; color: darkblue"></asp:Label><br />
                    <asp:Label runat="server" ID="lblOsar60" Text="0" Style="font-weight: bold; color: black"></asp:Label>
                </div>
                <div style="float: left; margin-left: 10px; margin-top: 5px">
                    <img runat="server" src="~/Styles/img/Yellow-Equals.png" width="10" id="ImgOsar60YellowEquals" />
                    <img runat="server" src="~/Styles/img/Red-Triangle.png" width="10" id="ImgOsar60RedTriangle" />
                    <img runat="server" src="~/Styles/img/Green-triangle.png" width="10" id="ImgOsar60GreenTriangle" />
                    <asp:Label runat="server" ID="lblBalance60Dif" Style="font-size: 12px"></asp:Label>
                    /
                    <br />
                    <asp:Label runat="server" ID="lblOsar60Dif" Style="font-size: 12px; margin-left: 15px"></asp:Label>
                </div>
            </div>
            <div runat="server" id="dBalance90" style="border: solid 1px; border-color: darkblue; border-radius: 10px; margin-top: 10px; margin-left: 25px; width: 280px; height: 70px; background-color: aliceblue">
                <div style="float: left; margin-left: 5px">
                    <asp:Label runat="server" ID="Label5" Text="Bal > 90" Style="font-weight: bold; font-size: 12px"></asp:Label>
                </div>
                <div style="float: left; margin-left: 20px; margin-top: 5px">
                    <asp:Label runat="server" ID="lblBalance90Total" Text="0.00%" Style="font-weight: bold; font-size: 25px; color: darkblue"></asp:Label><br />
                    <asp:Label runat="server" ID="lblOsar90" Text="0" Style="font-weight: bold; color: black"></asp:Label>
                </div>
                <div style="float: left; margin-left: 10px; margin-top: 5px">
                    <img runat="server" src="~/Styles/img/Yellow-Equals.png" width="10" id="ImgOsar90YellowEquals" />
                    <img runat="server" src="~/Styles/img/Red-Triangle.png" width="10" id="ImgOsar90RedTriangle" />
                    <img runat="server" src="~/Styles/img/Green-triangle.png" width="10" id="ImgOsar90GreenTriangle" />
                    <asp:Label runat="server" ID="lblBalance90Dif" Style="font-size: 12px"></asp:Label>
                    /
                    <br />
                    <asp:Label runat="server" ID="lblOsar90Dif" Style="font-size: 12px; margin-left: 15px"></asp:Label>
                </div>
            </div>
            <div runat="server" id="dBalance120" style="border: solid 1px; border-color: darkblue; border-radius: 10px; margin-top: 10px; margin-left: 25px; width: 280px; height: 70px; background-color: bisque">
                <div style="float: left; margin-left: 5px">
                    <asp:Label runat="server" ID="Label6" Text="Bal > 120" Style="font-weight: bold; font-size: 12px"></asp:Label>
                </div>
                <div style="float: left; margin-left: 15px; margin-top: 5px">
                    <asp:Label runat="server" ID="lblBalance120Total" Text="0.00%" Style="font-weight: bold; font-size: 25px; color: red"></asp:Label><br />
                    <asp:Label runat="server" ID="lblOsar120" Text="0" Style="font-weight: bold; color: black"></asp:Label>
                </div>
                <div style="float: left; margin-left: 10px; margin-top: 5px">
                    <img runat="server" src="~/Styles/img/Yellow-Equals.png" width="10" id="ImgOsar120YellowEquals" />
                    <img runat="server" src="~/Styles/img/Red-Triangle.png" width="10" id="ImgOsar120RedTriangle" />
                    <img runat="server" src="~/Styles/img/Green-triangle.png" width="10" id="ImgOsar120GreenTriangle" />
                    <asp:Label runat="server" ID="lblBalance120Dif" Style="font-size: 12px"></asp:Label>
                    /
                    <br />
                    <asp:Label runat="server" ID="lblOsar120Dif" Style="font-size: 12px; margin-left: 15px"></asp:Label>
                </div>
            </div>
        </div>
        <div style="float: right; margin-top: 5px; background-color: gainsboro; padding: 10px; border-radius: 10px">
            <asp:Label runat="server" ID="lblOsarTotal" Text="OSAR" Style="font-weight: bold; font-size: 18px"></asp:Label>
            <asp:RadioButtonList runat="server" ID="rblPeriod" RepeatDirection="Horizontal" Style="float: right" OnSelectedIndexChanged="rblPeriod_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text=" Monthly" Value="Monthly" Selected="True" style="margin-right: 5px"></asp:ListItem>
                <asp:ListItem Text=" Daily" Value="Daily"></asp:ListItem>
            </asp:RadioButtonList>
            <div id="container" style="width: 1000px; height: 530px; margin-top: 5px"></div>
            <script type="text/javascript">
                <%--function ShowHighCharts() {
                    var MonthYear = [];
                    var OsarValue = [];
                    var Balance7 = [];
                    var Balance30 = [];
                    var Balance60 = [];
                    var Balance90 = [];
                    var BalanceTarget7 = [];
                    var BalanceTarget30 = [];
                    var BalanceTarget60 = [];
                    var BalanceTarget90 = [];
                    
                    MonthYear = [<%=MonthYear %>];
                    OsarValue = [<%=OsarValue %>];
                    Balance7 = [<%=Balance7 %>];
                    Balance30 = [<%=Balance30 %>];
                    Balance60 = [<%=Balance60 %>];
                    Balance90 = [<%=Balance90 %>];
                    BalanceTarget7 = [<%=BalanceTarget7 %>];
                    BalanceTarget30 = [<%=BalanceTarget30 %>];
                    BalanceTarget60 = [<%=BalanceTarget60 %>];
                    BalanceTarget90 = [<%=BalanceTarget90 %>];

                    HighCharts(MonthYear, OsarValue, Balance7, Balance30, Balance60, Balance90, BalanceTarget7, BalanceTarget30, BalanceTarget60, BalanceTarget90)
                }--%>
                function HighCharts() {
                    var chart = {
                        zoomType: 'xy',
                        marginBottom: 80
                    };
                    var subtitle = {
                        text: ''
                    };
                    var title = {
                        text: ''
                    };
                    var credits = {
                        enabled: false
                    };
                    var xAxis = {
                        categories: [<%=MonthYear%>],
                        crosshair: true
                    };
                    var yAxis = [
                        { // Secondary yAxis
                            title: {
                                text: '',
                                style: {
                                    color: Highcharts.getOptions().colors[1]
                                }
                            },
                            labels: {
                                format: '{value} %',
                                style: {
                                    color: Highcharts.getOptions().colors[1]
                                }
                            },
                            opposite: true
                        },
                        { // Primary yAxis
                            labels: {
                                format: '',
                                style: {
                                    color: Highcharts.getOptions().colors[0],
                                    display: 'none'
                                }
                            },
                            title: {
                                text: '',
                                style: {
                                    color: Highcharts.getOptions().colors[0],
                                    display: 'none'
                                }
                            }
                        }
                    ];
                    var tooltip = {
                        shared: true
                    };
                    var lang = {
                        decimalPoint: '.',
                        thousandsSep: ','
                    };
                    var plotOptions = {
                        column: {
                            //stacking: 'normal',
                            dataLabels: {
                                enabled: true,
                                inside: true,
                                allowOverlap: true,
                                verticalAlign: 'bottom',
                                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor)
                                    || 'black',
                                style: {
                                    fontSize: '8.5px',
                                    fontWeight: 'none'
                                },
                                borderRadius: 5,
                                backgroundColor: 'rgba(252, 255, 197, 0.7)',
                                borderWidth: 1,
                                borderColor: '#AAA',
                            }
                        },
                        spline: {
                            //stacking: 'normal',
                            dataLabels: {
                                enabled: true,
                                crop: true,
                                overflow: 'none',
                                //inside: true,
                                //verticalAlign: 'bottom',
                                //allowOverlap:true,
                                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor)
                                    || 'black',
                                style: {
                                    fontSize: '10px',
                                    fontWeight: 'none'
                                },
                                borderRadius: 5,
                                backgroundColor: 'rgba(252, 255, 197, 0.7)',
                                borderWidth: 1,
                                borderColor: '#AAA',
                            }
                        }

                    };
                    var legend = {
                        align: 'center',
                        x: 0,
                        verticalAlign: 'bottom',
                        y: 0,
                        floating: true,

                        backgroundColor: (
                            Highcharts.theme && Highcharts.theme.background2) || 'white',
                        borderColor: '#CCC',
                        borderWidth: 1,
                        shadow: false
                    };
                    var series = [
                        {
                            dataLabels: {
                                enabled: true,
                                crop: true,
                                overflow: 'none'
                            },
                            name: 'OSAR (Mio)',
                            type: 'column',
                            color: '#ADD8E6',
                            yAxis: 1,
                            data: [<%=OsarValue%>],
                            tooltip: {
                                valueSuffix: ''
                            }
                        },
                        {
                            name: '%>7',
                            type: 'spline',
                            color: '#B22222',
                            data: [<%=Balance7%>],
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        },
                        {
                            name: '%>30',
                            type: 'spline',
                            color: '#ADFF2F',
                            data: [<%=Balance30%>],
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        }, {
                            name: '%>60',
                            type: 'spline',
                            color: '#663399',
                            data: [<%=Balance60%>],
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        },
                        {
                            name: '%>90',
                            type: 'spline',
                            color: '#00BFFF',
                            data: [<%=Balance90%>],
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        },
                        {
                            name: '>7',
                            type: 'spline',
                            color: 'red',
                            data: [<%=BalanceTarget7%>],
                            marker: {
                                enabled: false
                            },
                            dataLabels: {
                                enabled: false
                            },
                            //enabled = <%=ChartVisible%>,
                            dashStyle: 'shortdot',
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        },
                        {
                            name: '>30',
                            type: 'spline',
                            color: '#00FF00',
                            data: [<%=BalanceTarget30%>],
                            marker: {
                                enabled: false
                            },
                            dataLabels: {
                                enabled: false
                            },
                            //enabled = <%=ChartVisible%>,
                            dashStyle: 'shortdot',
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        },
                        {
                            name: '>60',
                            type: 'spline',
                            color: '#9932CC',
                            data: [<%=BalanceTarget60%>],
                            marker: {
                                enabled: false
                            },
                            dataLabels: {
                                enabled: false
                            },
                           // enabled = <%=ChartVisible%>,
                            dashStyle: 'shortdot',
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        },
                        {
                            name: '>90',
                            type: 'spline',
                            color: '#4169E1',
                            data: [<%=BalanceTarget90%>],
                            marker: {
                                enabled: false
                            },
                            dataLabels: {
                                enabled: false
                            },
                            //enabled = <%=ChartVisible%>,
                            dashStyle: 'shortdot',
                            tooltip: {
                                valueSuffix: ' %'
                            }
                        }
                    ];

                    var json = {};
                    json.chart = chart;
                    json.credits = credits;
                    json.title = title;
                    json.subtitle = subtitle;
                    json.xAxis = xAxis;
                    json.yAxis = yAxis;
                    json.lang = lang;
                    json.tooltip = tooltip;
                    json.plotOptions = plotOptions;
                    json.legend = legend;
                    json.series = series;
                    $('#container').highcharts(json);
                }
                $(document).ready(function () {
                    HighCharts();
                });
                        //var prm = Sys.WebForms.PageRequestManager.getInstance();
                        //prm.add_beginRequest(function () {
                        //    HighCharts();
                        //});
                        //prm.add_endRequest(function () {
                        //    HighCharts();
                        //});--%>
            </script>
        </div>
    </form>
</body>
</html>
