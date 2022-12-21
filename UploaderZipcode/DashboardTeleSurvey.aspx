<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DashboardTeleSurvey.aspx.cs" Inherits="UploaderZipcode.DashboardTeleSurvey"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <div class="block-header">
        <h2>PILIH DASHBOARD</h2>
    </div>
    <div id="countdown" hidden></div>
    <div class="row clearfix" >
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
            <form id="form1" runat="server">
                <div class="card">
                    <div class="body" id="form-body">
                        <figure class="highcharts-figure">
                            <div id="container" name="container"></div>
                            
                        </figure>
                        <div class="row clearfix">
                            <div class="col-md-10">
                                <asp:DropDownList id="ddlSearch" runat="server" CssClass="form-control">
                                    <asp:ListItem value="1">Area 1 </asp:ListItem> 
                                    <asp:ListItem value="2">Area 2 </asp:ListItem> 
                                    <asp:ListItem value="3">Area 3 </asp:ListItem> 
                                    <asp:ListItem value="4">All Area </asp:ListItem> 
                                </asp:DropDownList> 
                            </div>
                            <div class="col-md-2">
                                <%--<asp:Button runat="server" ID="btnSearch" class="btn btn-block bg-pink waves-effect btnsearch" Text="SEARCH" />--%>
                                <button type="button" id="btnSearch" class="btn bg-primary btn-lg waves-effect btnSearch">Search</button>
                            </div>
                        </div>
                        <div class ="row clearfix">
                            <div class="col-md-6" style="overflow-y: hidden;">
                                <p>
                                    <b>MTD</b>
                                </p>
                                <table class="table table-bordered table-hover tableMTD" style="font-size: xx-small;">
                                    <thead>
                                       <%-- <tr>
                                            <th rowspan="2" colspan="2">NAME</th>
                                            <th colspan="4">SLA TELE SURVEY</th>
                                            <th colspan="3">PRODUCTIVITY</th>
                                        </tr>--%>
                                        <tr>
                                            <th style="width: 90px;">SURVEYOR NAME</th>
                                            <th style="width: 20px;">SLA 60<=</th>
                                            <th style="width: 20px;">% SLA (60<=)</th>                                                    
                                            <th style="width: 20px;">SLA 180<=</th>
                                            <th style="width: 20px;">% SLA (180<=)</th>
                                            <th style="width: 20px;">SUBMIT</th>
                                            <th style="width: 20px;">PENDING</th>
                                            <th style="width: 20px;">TOTAL</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="col-md-6" style="overflow-y: hidden;">
                                <p>
                                    <b>DAILY</b>
                                </p>
                                <table class="table table-bordered table-hover tableDAILY" style="font-size: xx-small;">
                                    <thead>
                                        <%--<tr>
                                            <th rowspan="2" colspan="2">name</th>
                                            <th colspan="4">sla tele survey</th>
                                            <th colspan="3">productivity</th>
                                        </tr>--%>
                                        <tr>
                                            <th style="width: 90px;">SURVEYOR NAME</th>
                                            <th style="width: 20px;">SLA 60<=</th>
                                            <th style="width: 20px;">% SLA (60<=)</th>                                                    
                                            <th style="width: 20px;">SLA 180<=</th>
                                            <th style="width: 20px;">% SLA (180<=)</th>
                                            <th style="width: 20px;">SUBMIT</th>
                                            <th style="width: 20px;">PENDING</th>
                                            <th style="width: 20px;">TOTAL</th>
                                        </tr>
                                    </thead>
                                </table>
                                <%--<asp:GridView runat="server" ID="GridDaily"  class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <tr style="font-size: xx-small;">
                                                    <th rowspan="2" colspan="2" style="background-color: powderblue;text-align: center;width: 50%;">NAME</th>
                                                    <th colspan="4" style="background-color: powderblue;text-align: center;">SLA TELE SURVEY</th>
                                                    <th colspan="3" style="background-color: powderblue;text-align: center;">PRODUCTIVITY</th>
                                                </tr>
                                                <tr style="font-size: xx-small;">
                                                    <th style="background-color: powderblue;text-align: center;">60<=</th>
                                                    <th style="background-color: powderblue;text-align: center;">%</th>                                                    
                                                    <th style="background-color: powderblue;text-align: center;">180<=</th>
                                                    <th style="background-color: powderblue;text-align: center;">%</th>
                                                    <th style="background-color: powderblue;text-align: center;">SUBMIT</th>
                                                    <th style="background-color: powderblue;text-align: center;">PENDING</th>
                                                    <th style="background-color: powderblue;text-align: center;">TOTAL</th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("svyr") %></td>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("SixMnts") %></td>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("PrctgSix") %></td>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("OneEightM") %></td>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("PrctgOneEight") %></td>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("Submit") %></td>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("Pending") %></td>
                                                <td style="text-align: center;font-size: xx-small;" class="color2"><%# Eval("Total") %></td>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        var ProductivityToday;
        var ProductivityLastMonth;
        var MinStdSLA;
        var MinStdPrdctvty;
        var AchiveSLAThisMonth;
        var AchiveSLALastMonth;

        $(document).ready(function () {
            $("#form-body").loading("start");
            Form.Button();
            Load.DataMTD();
            Load.DataDaily();
            Load.DataSLAToday();
            //$("#form-body").loading("stop");
        });
        var Form = {
            Button: function () {
                $("#btnSearch").click(function () {
                    $("#form-body").loading("start");
                    Load.DataMTD();
                    Load.DataDaily();
                    Load.DataSLAToday();

                    //$("#form-body").loading("stop");
                });
            }
        }
        var Load = {
            DataMTD: function () {
                $.ajax({
                    type: "POST",
                    url: "DashboardTeleSurvey.aspx/GetDataMTD",
                    data: JSON.stringify({ Area: $('select[id$=ddlSearch]').val()}),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        //alert("success");
                        //console.log(data.d);
                        /*OnSuccess(data.d);*/
                        $(".tableMTD").DataTable(
                            {
                                paging: true,
                                searching: true,
                                bLengthChange: true,
                                lengthMenu: [[10, 25, -1], [10, 25, "All"]],
                                bFilter: true,
                                bSort: false,
                                bPaginate: true,
                                bDestroy: true,
                                scrollX: true,
                                data: data.d,
                                columns: [
                                    { "data": 'svyr' },
                                    { 'data': 'SixMnts' },
                                    { 'data': 'PrcntgSix' },
                                    { 'data': 'OneEightM' },
                                    { 'data': 'PrctgOneEight' },
                                    { 'data': 'Submit' },
                                    { 'data': 'Pending' },
                                    { 'data': 'Total' },
                                ]
                            });

                    },
                    error: function (err) {
                        alert(err.responseText);
                        console.log(err);
                    }
                });
            },
            DataDaily: function () {
                $.ajax({
                    type: "POST",
                    url: "DashboardTeleSurvey.aspx/GetDataDAILY",
                    data: JSON.stringify({ Area: $('select[id$=ddlSearch]').val() }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        //alert("success");
                        //console.log(data.d);
                        /*OnSuccess(data.d);*/
                        $(".tableDAILY").DataTable(
                            {
                                paging: true,
                                searching: true,
                                bLengthChange: true,
                                lengthMenu: [[10, 25, -1], [10, 25, "All"]],
                                bfilter: true,
                                bsort: false,
                                bpaginate: true,
                                bDestroy: true,
                                scrollX: true,
                                data: data.d,
                                columns: [
                                    { "data": 'svyr' },
                                    { 'data': 'SixMnts' },
                                    { 'data': 'PrcntgSix' },
                                    { 'data': 'OneEightM' },
                                    { 'data': 'PrctgOneEight' },
                                    { 'data': 'Submit' },
                                    { 'data': 'Pending' },
                                    { 'data': 'Total' },
                                ]
                            }
                        );
                    },
                    error: function (err) {
                        alert(err.responseText);
                        console.log(err);
                    }
                });
            },
            DataSLAToday: function () {
                $.ajax({
                    type: "POST",
                    url: "DashboardTeleSurvey.aspx/ChartList",
                    data: JSON.stringify({ Area: $('select[id$=ddlSearch]').val() }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        //console.log(data.d.SLAToday);
                        //data.d.SLAToday;
                        /*Load.DataSLALastM(ProductivityToday);*/
                        Highcharts.chart('container',
                            {
                                chart: {
                                    type: 'column',
                                    width: 900
                                },
                                title: {
                                    text: 'DASHBOARD TELE SURVEY'
                                },
                                xAxis: {
                                    title: {
                                        text: 'Date'
                                    },
                                    tickInterval: 1
                                },
                                yAxis: [{
                                    lineWidth: 1,
                                    title: {
                                        text: 'Total Productivity'
                                    },

                                }, {
                                    lineWidth: 1,
                                    labels: {
                                        format: '{value}%'
                                    },
                                    title: {
                                        text: 'SLA Achievement'
                                    },
                                    opposite: true,
                                    plotLines: [{
                                        color: '#1CFF78',
                                        dashStyle: 'ShortDash',
                                        width: 1,
                                        value: 75,
                                        zIndex: 0,
                                        label: {
                                            text: 'Std. Min. SLA'
                                        },
                                        column: {
                                            borderRadius: 4
                                        }
                                    }]
                                }],
                                plotOptions: {

                                    series: {
                                        pointWidth: 10,
                                        borderRadius: 5
                                    }
                                },
                                series: [{
                                    type: 'column',
                                    name: 'Productivity Today',
                                    data: JSON.parse(data.d.SLAToday),
                                    color: '#F8B600'
                                },
                                {
                                    type: 'column',
                                    name: 'Productivity Last Month',
                                    data: JSON.parse(data.d.SLABefore), //ProductivityLastMonth = data.d.SLABefore;
                                    color: '#009EE3'
                                },
                                {
                                    type: 'spline',
                                    name: 'Min. Std. SLA',
                                    dashStyle: 'longdash',
                                    data: JSON.parse(data.d.stdMinSLA), //MinStdSLA = data.d.stdMinSLA;
                                    
                                    tooltip: {
                                        valueSuffix: ' %'
                                    },
                                    yAxis: 1
                                    //visible: false
                                },
                                {
                                    type: 'spline',
                                    name: 'Min. Std. Prdctvty',
                                    dashStyle: 'longdash',
                                    data: JSON.parse(data.d.stdPrdctvty), //MinStdPrdctvty = data.d.stdPrdctvty;
                                    color: '#FFFF66'
                                },
                                {
                                    type: 'spline',
                                    name: 'Achive. SLA Last Month',
                                    data: JSON.parse(data.d.AchiveBEFORE),//AchiveSLALastMonth = data.d.AchiveBEFORE;

                                    yAxis: 1,
                                    tooltip: {
                                        valueSuffix: ' %'
                                    },
                                    color: '#FF2D2D'
                                },
                                {   
                                    type: 'spline',
                                    name: 'Achive. SLA This Month',
                                    data: JSON.parse(data.d.AchiveNOW),//AchiveSLAThisMonth = data.d.AchiveNOW;
                                    yAxis: 1,
                                    tooltip: {
                                        valueSuffix: ' %'
                                    },
                                    color: '#022261'
                                }
                                ],
                                responsive: {
                                    rules: [{
                                        chartOptions: {
                                            floating: false,
                                            layout: 'horizontal',
                                            align: 'center',
                                            verticalAlign: 'bottom',
                                            x: 0,
                                            y: 0
                                        },
                                        yAxis: [{
                                            labels: {
                                                align: 'right',
                                                x: 0,
                                                y: -6
                                            },
                                            showLastLabel: false
                                        },
                                        {
                                            labels: {
                                                align: 'left',
                                                x: 0,
                                                y: -6
                                            },
                                            showLastLabel: false
                                        }, {
                                            visible: false
                                        }]
                                    }]
                                }
                            }
                        );
                        //$("#form-body").loading("stop");
                    },
                    error: function (err) {
                        alert(err.responseText);
                        console.log(err);
                        $("#form-body").loading("stop");
                    }
                });
                $("#form-body").loading("stop");
            },         
        }
         
    </script>
    <script type="text/javascript">
       
        
        $(document).ready(function () {
           

            $('#GridMTD').DataTable({
                "scrollX": true
            });
            $('#GridDaily').DataTable({
                "scrollX": true
            });
            $('.dataTables_length').addClass('bs-select');

            /* Variable Defaults */
            var countDownTo = new Date().setSeconds(new Date().getSeconds() + 3600);
            /* Init Countdown Plugin */
            $('#countdown').countdown(countDownTo, function (event) {
                /* Output String */
                $(this).html(event.strftime('%D:%H:%M:%S'));
            }).on('finish.countdown', function () {
                /* Refresh Page on Load */
                //console.log('location.reload()');
                location.reload();
            });


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Styles/css/loading.css" rel="stylesheet" />
    <script src="Styles/js/jquery.loading.js"></script>
    <style type="text/css">
        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 310px;
            /*max-width: 800px;*/
            margin: 1em auto;
        }
        #container {
            height: 400px;
        }
        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #ebebeb;
            margin: 10px auto;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }
        .highcharts-data-table caption {
            padding: 1em 0;
            font-size: 1.2em;
            color: #555;
        }
        .highcharts-data-table th {
            font-weight: 600;
            padding: 0.5em;
        }
        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }
        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }
        .GridMTDWrapper {
          max-width: 600px;
          margin: 0 auto;
        }
        #GridMTD th, td {
          white-space: nowrap;
        }
        .GridDailyWrapper {
          max-width: 600px;
          margin: 0 auto;
        }
        #GridDaily th, td {
          white-space: nowrap;
        }

        table.dataTable thead .sorting:after,
        table.dataTable thead .sorting:before,
        table.dataTable thead .sorting_asc:after,
        table.dataTable thead .sorting_asc:before,
        table.dataTable thead .sorting_asc_disabled:after,
        table.dataTable thead .sorting_asc_disabled:before,
        table.dataTable thead .sorting_desc:after,
        table.dataTable thead .sorting_desc:before,
        table.dataTable thead .sorting_desc_disabled:after,
        table.dataTable thead .sorting_desc_disabled:before {
         bottom: .5em;
        }
    </style>

</asp:Content>
