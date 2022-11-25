<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardCA.aspx.cs" Inherits="UploaderZipcode.DashboardCA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Performance CA</title>
    <link href="styles/css/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/css/font.css" rel="stylesheet" type="text/css" />
    <link href="styles/css/font2.css" rel="stylesheet" type="text/css" />
    <link href="styles/css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <%--<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>--%>
    <%--<script src="styles/js/dataTables.bootstrap.js"></script>--%>
  
    <script src="styles/js/jquery.min.js"></script>
      <script src="styles/js/jquery.dataTables.min.js"></script>
    <%--<script src="ChartJS.js"></script>--%>
    <script src="styles/js/Chart.bundle.js"></script>
        <%--<script src="styles/HighCharts/Jquery.min.js"></script>--%>
    <script src="styles/HighCharts/HighCharts.js"></script>
    <script src="styles/HighCharts/ShowHighCharts.js"></script>
     <%--<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            var selectedtValue = "";
            window.onload = function () {
                selectedtValue = "A001";
                getData(selectedtValue);
                getTotal(selectedtValue);
                getDone(selectedtValue);
                getDE(selectedtValue);
                getCR(selectedtValue);
                getPending(selectedtValue);
                getAch(selectedtValue);
                getdrawChart(selectedtValue);
                getDate(selectedtValue);
                getTotalAchievement(selectedtValue);
                getSumChart(selectedtValue);
                //s.selectedtValue = s.defaultOptions
            }

            let TotalAchievement = "";

            $('#ddlCategory').on('change', function () {
                selectedtValue = this.value;

                getData(selectedtValue);
                getTotal(selectedtValue);
                getDone(selectedtValue);
                getDE(selectedtValue);
                getCR(selectedtValue);
                getPending(selectedtValue);
                getAch(selectedtValue);
                getdrawChart(selectedtValue);
                getDate(selectedtValue);
                getTotalAchievement(selectedtValue);
                getSumChart(selectedtValue);

            });

            function getTotalAchievement(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetTotalAchievement",
                    success: function (data) {
                        TotalAchievement = data.d[0].Total;
                    },
                    error: function (data) {

                    }
                });
            }

            function getData(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),
                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetCAMonitoring",
                    success: function (data, id) {
                        $('#TableId').DataTable({
                            responsive: true,
                            destroy: true,
                            "paging": false,
                            "ordering": false,
                            "info": false,
                            "searching": false,
                            //data: myData,
                            //data: d.foreach((item, idx) => { item.id = idx }),
                            //Var tempData = data.d.forEach((item, idx) => { item.id = idx }),
                            //data: data.d.forEach((item, idx) => { item.id = idx }),
                            //Var tempData = data.d.forEach((item, idx) => { item.id = idx }),
                            data: data.d,
                            columns: [
                                { 'data': 'UserCA' },
                                { 'data': 'MTDNew' },
                                { 'data': 'MTDReturn' },
                                { 'data': 'MTDCopy' },
                                //{
                                //    'data': 'feesPaid', 'render': function (feesPaid) {
                                //        return '$ ' + feesPaid;
                                //    }
                                //},
                                { 'data': 'DailyNew' },
                                { 'data': 'DailyReturn' },
                                { 'data': 'DailyCopy' },
                                { 'data': 'DENew' },
                                { 'data': 'DEReturn' },
                                { 'data': 'DECopy' },
                                { 'data': 'ClaimedNew' },
                                { 'data': 'ClaimedReturn' },
                                { 'data': 'ClaimedCopy' },
                                { 'data': 'RtnSo' },
                                { 'data': 'RtnSvy' },
                                //{ 'data': 'Ach' }
                                {
                                    'data': 'Ach', "id": 'ach', 'render': function (Ach, AchDec) {
                                        //console.log(ach, 'achS')
                                        //console.log(Ach,"sfg")
                                        if (Ach == null) {
                                            return AchDec + '%';
                                        }
                                        else {
                                            return Ach + '%';
                                        }
                                    }
                                }
                                //{
                                //    'data': 'dateOfBirth', 'render': function (date) {
                                //        var date = new Date(parseInt(date.substr(6)));
                                //        var month = date.getMonth() + 1;
                                //        return date.getDate() + "/" + month + "/" + date.getFullYear();
                                //    }
                                //}
                            ],
                            "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull, id) {
                                //console.log(nRow, "test");
                                //console.log(aData.Ach, "data");
                                //console.log(iDisplayIndex, "index");
                                //console.log(iDisplayIndexFull, "full");
                                //console.log(id, "id");
                                if (aData.Ach <= 60 || aData.AchDec <= 60) {
                                    $('td', nRow).css('background-color', '#f8cbad');
                                    //$(nRow).find('td:eq(#ach)').css('background-color', '#f8cbad');
                                    //$("#ach").attr('style', 'background-color', '#fBcbad');
                                }
                                else if (aData.Ach <= 80 || aData.AchDec <= 80 ) {
                                    $('td', nRow).css('background-color', '#ffe699');
                                    //$(nRow).find('td:eq(16)').css('background-color', '#ffe699');
                                }
                                else if (aData.Ach <= 100 || aData.AchDec <= 80 ) {
                                    $('td', nRow).css('background-color', '#a9d18e');
                                }
                            },
                            "footerCallback": function (row, data, start, end, display) {
                                var api = this.api(), data;

                                // Remove the formatting to get integer data for summation
                                var intVal = function (i) {
                                    return typeof i === 'string' ?
                                        i.replace(/[\$,]/g, '') * 1 :
                                        typeof i === 'number' ?
                                            i : 0;
                                };
                                // Total over all pages
                                total = api
                                    .column(1)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);

                                // Total over all pages
                                totalMTDReturn = api
                                    .column(2)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);

                                totalMTDCopy = api
                                    .column(3)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalDailyNew = api
                                    .column(4)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalDailyReturn = api
                                    .column(5)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalDailyCopy = api
                                    .column(6)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalDENew = api
                                    .column(7)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalDEReturn = api
                                    .column(8)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalDECopy = api
                                    .column(9)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalCRnew = api
                                    .column(10)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalCRReturn = api
                                    .column(11)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalCRCopy = api
                                    .column(12)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalRtnSO = api
                                    .column(13)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalRtnSvy = api
                                    .column(14)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);
                                totalAch = api
                                    .column(15)
                                    .data()
                                    .reduce(function (a, b) {
                                        return intVal(a) + intVal(b);
                                    }, 0);

                                // Update footer
                                $(api.column(1).footer()).html(
                                    total
                                );
                                // Update footer
                                $(api.column(2).footer()).html(
                                    totalMTDReturn
                                );
                                // Update footer
                                $(api.column(3).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalMTDCopy
                                );
                                // Update footer
                                $(api.column(4).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalDailyNew
                                );
                                $(api.column(5).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalDailyReturn
                                );

                                $(api.column(6).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalDailyCopy
                                );
                                $(api.column(7).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalDENew
                                );
                                $(api.column(8).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalDEReturn
                                );
                                $(api.column(9).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalDECopy
                                );
                                $(api.column(10).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalCRnew
                                );
                                $(api.column(11).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalCRReturn
                                );
                                $(api.column(12).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalCRCopy
                                );
                                $(api.column(13).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalRtnSO
                                );
                                $(api.column(14).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    totalRtnSvy
                                );
                                $(api.column(15).footer()).html(
                                    //'$' + pageTotal + ' ( $' + total + ' total)'
                                    TotalAchievement + '%'
                                );

                            }
                        });
                    }
                });

            }

            function getDate(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetDate",
                    success: function (data) {
                        $('#lblDate').html(data.d[0].LastDate);
                    },
                    error: function (data) {

                    }
                });
            }

            function getTotal(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetTotal",
                    success: function (data) {
                        $('#lblTotal').html(data.d[0].HeaderTotal1);
                        $('#LMTotal').html(data.d[0].HeaderTotal2);
                    },
                    error: function (data) {

                    }
                });
            }

            function getDone(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetDone",
                    success: function (data) {
                        $('#lblDone').html(data.d[0].HeaderTotal1);
                        $('#LMDone').html(data.d[0].HeaderTotal2);
                    },
                    error: function (data) {

                    }
                });
            }

            function getDE(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetDE",
                    success: function (data) {
                        $('#lblDE').html(data.d[0].HeaderTotal1);
                        $('#LMDE').html(data.d[0].HeaderTotal2);
                    },
                    error: function (data) {

                    }
                });
            }

            function getCR(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetCR",
                    success: function (data) {
                        $('#lblCR').html(data.d[0].HeaderTotal1);
                        $('#LMCR').html(data.d[0].HeaderTotal2);
                    },
                    error: function (data) {

                    }
                });
            }

            function getPending(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetPending",
                    success: function (data) {
                        $('#lblPending').html(data.d[0].HeaderTotal1);
                        $('#LMPending').html(data.d[0].HeaderTotal2);
                    },
                    error: function (data) {

                    }
                });
            }

            function getAch(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/GetAch",
                    success: function (data) {
                        $('#lblAchieve').html(data.d[0].HeaderTotal1) + '%';
                        $('#LMAchieve').html(data.d[0].HeaderTotal2);
                    },
                    error: function (data) {

                    }
                });
            }

            function getSumChart(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/getSumChart",
                    success: function (data) {
                        $('#btnNew').html(data.d[0].SumRangeNew);
                        $('#btnReturn').html(data.d[0].SumRangeReturn);
                        $('#btnCancel').html(data.d[0].SumRangeCopy);
                    },
                    error: function (data) {

                    }
                });
            }

            function getdrawChart(category) {
                $.ajax({
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "type": category
                    }),

                    type: "POST",
                    dataType: "json",
                    url: "CAMonitoringService.asmx/getdrawChart",
                    success: function (Result) {
                        //console.log(Result, "re");
                        Result = Result.d;
                        var series = [];

                        var categories = [];
                        var chartNew = [];
                        var chartReturn = [];
                        var chartCopy = [];

                        for (var i in Result) {
                            categories.push(Result[i].Area);

                            chartNew.push(Result[i].RangeNew);

                            chartReturn.push(Result[i].RangeReturn);

                            chartCopy.push(Result[i].RangeCopy);
                        }
                        //console.log(chartCopy, "copy")
                        series.push({
                            name: 'New',
                            color: '#70ad47',
                            data: Result[i].RangeNew
                        }, {
                            name: 'Return',
                            color: '#5b9bd5',
                            data: Result[i].RangeReturn
                        }, {
                            name: 'Copy Cancel',
                            color: '#ffc000',
                            data: Result[i].RangeCopy
                        }

                        );
                        BindChart(categories, chartNew, chartCopy, chartReturn);

                    },
                    error: function (xhr) {
                        //console.log(xhr,"test")
                        //alert('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);

                    }
                });

            }
            function BindChart(categories, newValue, copyValue, returnValue) {
                //console.log(categories, "cat");
                //console.log(newValue, "new");
                //console.log(copyValue, "copy");
                //console.log(returnValue, "return");
                //console.log(series, "tes");
                $('#container').highcharts({
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: 'CREDIT REVIEW (UNCLAIM)'
                    },
                    xAxis: {
                        categories: categories

                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: ''
                        }
                    },
                    legend: {
                        reversed: true
                    },
                    plotOptions: {
                        series: {
                            stacking: 'normal'
                        }
                    },
                    series: [{
                        name: 'Copy Cancel',
                        color: '#ffc000',
                        data: copyValue

                    }, {
                        name: 'Return',
                        color: '#5b9bd5',
                        data: returnValue
                    }, {

                        name: 'New',
                        color: '#70ad47',
                        data: newValue

                    }]

                    //series: [{
                    //    name: 'New',
                    //    data: newValue

                    //}, {
                    //    name: 'Copy',
                    //    data: copyValue
                    //}, {
                    //    name: 'Return',
                    //    data: returnValue
                    //}]
                });


                //$('#container').highcharts({

                //    chart: {

                //        type: 'bar'

                //    },

                //    title: {

                //        text: 'CREDIT REVIEW (UNCLAIM)'

                //    },

                //    xAxis: {

                //        categories: categories,

                //        labels: {

                //            style: {

                //                color: 'black',

                //                fontWeight: 'bold',

                //                fontSize: '14px'

                //            },

                //        }

                //    },

                //    legend: {

                //        itemstyle: {

                //            fontSize: '15px',

                //            font: '15pt Trebuchet MS, Verdana, sans-serif',

                //            color: '#0000FF'

                //        }

                //    },

                //    yAxis: {

                //        min: 0,

                //        title: {

                //            text: ''

                //        },

                //        labels: {

                //            style: {

                //                color: 'black',

                //                fontWeight: 'bold',

                //                fontSize: '12px'

                //            }

                //        },

                //        stackLabels: {

                //            enabled: true,

                //            style: {

                //                fontWeight: 'bold',

                //                fontSize: '15px',

                //                color: 'black'

                //            }

                //        }

                //    },

                //    tooltip: {

                //        formatter: function () {

                //            return '<b>' + this.x + '</b><br/>' +

                //                this.series.name + ': ' + this.y + '<br/>' +

                //                'Total: ' + this.point.stackTotal;

                //        }

                //    },

                //    plotOptions: {

                //        column: {

                //            stacking: 'normal',

                //            dataLabels: {

                //                enabled: true,

                //                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',

                //                style: {

                //                    textShadow: '0 0 3px black'

                //                }

                //            }

                //        }

                //    },

                //    series: series

                //});

            }
            //function getdrawChart(category) {
            //    var chartLabel = [];
            //    var chartNew = [];
            //    var chartReturn = [];
            //    var chartCopy = [];

            //    $.ajax({
            //        contentType: "application/json; charset=utf-8",
            //        data: JSON.stringify({
            //            "type": category
            //        }),

            //        type: "POST",
            //        dataType: "json",
            //        url: "CAMonitoringService.asmx/getdrawChart",
            //        success: function (data) {
            //            console.log(data, "data");
            //            $(data).each(function (index, item) {
            //                console.log(item, "item");
            //                chartLabel.push(item.Area);
            //                chartNew.push(item.RangeNew);
            //                chartReturn.push(item.RangeReturn);
            //                chartCopy.push(item.RangeCopy);
            //            });

            //        },
            //        error: function (err) {
            //            //alert(err);
            //        }
            //    });
            //    var config = {
            //        type: 'bar',
            //        data: {
            //            datasets: [{
            //                data: chartNew,
            //                backgroundColor: [
            //                    "#70ad47"
            //                ],
            //                label: 'Labels'
            //            }],
            //            labels: chartLabel
            //        },
            //        options: {
            //            responsive: true
            //        }
            //    };

            //    window.onload = function () {
            //        var ctx = document.getElementById('container').getContext('2d');
            //        window.Chart = new Chart(ctx, config);
            //    };

            //}


        })
    </script>
<%--    <script type="text/javascript">  
        $(document).ready(function () {

            $.ajax({

                type: "POST",

                contentType: "application/json; charset=utf-8",

                url: "Services/ChartWebService.asmx/GetRevenueDetails",

                data: "{}",

                dataType: "json",

                success: function (Result) {


                    Result = Result.d;


                    var series = [];

                    var categories = [];
                    var quarter1 = [];

                    var quarter2 = [];

                    var quarter3 = [];

                    var quarter4 = [];


                    for (var i in Result) {

                        categories.push(Result[i].year);

                        quarter1.push(Result[i].quarter1);

                        quarter2.push(Result[i].quarter2);

                        quarter3.push(Result[i].quarter3);

                        quarter4.push(Result[i].quarter4);

                    }

                    series.push({

                        name: 'Quarter 1',

                        data: quarter1

                    },

                        {

                            name: 'Quarter 2',

                            data: quarter2

                        },

                        {

                            name: 'Quarter 3',

                            data: quarter3

                        },

                        {

                            name: 'Quarter 4',

                            data: quarter4

                        }

                    );

                    BindChart(categories, series);

                },

                error: function (xhr) {

                    alert('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);

                }

            });

        });

        function BindChart(categories, series) {

            $('#container').highcharts({

                chart: {

                    type: 'column'

                },

                title: {

                    text: 'Stack Column Chart Demo'

                },

                xAxis: {

                    categories: categories,

                    labels: {

                        style: {

                            color: 'black',

                            fontWeight: 'bold',

                            fontSize: '14px'

                        },

                    }

                },

                legend: {

                    itemstyle: {

                        fontSize: '15px',

                        font: '15pt Trebuchet MS, Verdana, sans-serif',

                        color: '#0000FF'

                    }

                },

                yAxis: {

                    min: 0,

                    title: {

                        text: 'Amount in (Rs.)'

                    },

                    labels: {

                        style: {

                            color: 'black',

                            fontWeight: 'bold',

                            fontSize: '12px'

                        }

                    },

                    stackLabels: {

                        enabled: true,

                        style: {

                            fontWeight: 'bold',

                            fontSize: '15px',

                            color: 'black'

                        }

                    }

                },

                tooltip: {

                    formatter: function () {

                        return '<b>' + this.x + '</b><br/>' +

                            this.series.name + ': ' + this.y + '<br/>' +

                            'Total: ' + this.point.stackTotal;

                    }

                },

                plotOptions: {

                    column: {

                        stacking: 'normal',

                        dataLabels: {

                            enabled: true,

                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',

                            style: {

                                textShadow: '0 0 3px black'

                            }

                        }

                    }

                },

                series: series

            });

        }
     </script>--%>
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

        .showHide {
            cursor: pointer;
        }

        .highcharts-figure, .highcharts-data-table table {
            min-width: 310px;
            max-width: 800px;
            margin: 1em auto;
        }

        #container {
            height: 400px;
        }

        .highcharts-data-table table {
            font-family: Verdana, sans-serif;
            border-collapse: collapse;
            border: 1px solid #EBEBEB;
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

        .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
        }

        .row-lm {
            margin-right: auto;
            margin-left: inherit;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%-- <div id="mySidenav" class="sidenav">
            <asp:Button runat="server" ID="btnHome" Text="Home" OnClick="btnHome_Click" />
        </div>--%>
        <div>
            <table style="width: 98%; margin-left: 10px; margin-top: 10px">
                <tr style="background-color: lightgray;">
                    <td colspan="21" style="border-start-start-radius: 12px; border-end-start-radius: 12px"><span style="font-weight: bold; font-size: 32px; margin-left: 5px">Performance CA  </span>
                     <%--   <asp:DropDownList runat="server" ID="ddlCategory" style="margin-left: 20px; background-color: antiquewhite; color: black; font-weight: bold" ClientIDMode="AutoID" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="National" Value="HO" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 1" Value="a001" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 2" Value="a002" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 3" Value="a003" style="color: black; font-weight: bold"></asp:ListItem>
                        </asp:DropDownList>--%>
                        <select style="margin-left: 20px; background-color: antiquewhite; color: black; font-weight: bold" name="ddlCategory" id="ddlCategory">
                          <%--<option value="HO">National</option>--%>
                          <option value="A001">AREA 1</option>
                          <option value="A002">AREA 2</option>
                          <option value="A003">AREA 3</option>
                        </select>
                 <%--       <asp:DropDownList runat="server" ID="dllTgl" style="background-color: antiquewhite; color: black; font-weight: bold" ClientIDMode="AutoID" OnSelectedIndexChanged="dllTgl_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="MTD" Value="MTD" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Today" Value="TODAY" style="color: black; font-weight: bold"></asp:ListItem>
                        </asp:DropDownList>--%>
                    </td>
                    <td style="text-align: right; border-start-end-radius: 8px; border-end-end-radius: 8px">
                        <asp:Label runat="server" ID="lblDate" style="float: right; font-weight: bold; margin-top: 20px" Text="Last Status">Last Status :</asp:Label>

                    </td>
                </tr>
            </table>
            <table style="width: 98%; margin-left: 10px; border-collapse: separate; border-spacing: 15px">
                <tr style="border-spacing: 3px; margin-top: 10px">
                    <td style="border-radius: 10px; background-color: #001878; width: 16%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; color: antiquewhite; margin-left: 10px;">Total</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-12" style="text-align: center">
                                <span>
                                    <label id="lblTotal" class="FontColour" style="font-size: 20px; font-weight: bold">0</label>
                                </span>
                            </div>
                        </div>
                        <div class="row" style="margin-right:auto">
                            <div class="col-sm-12" style="text-align: right">
                                <span>
                                    <asp:Label CssClass="FontColour" runat="server" ID="Label3" Text="LM :"></asp:Label></span>
                                <span>
                                     <label id="LMTotal" class="FontColour" style="font-size: 12px; font-weight: bold">0</label>
                                    <%--<asp:Label runat="server" ID="LMTotal" Text="0" style="font-size: 12px; font-weight: bold" CssClass="FontColour"></asp:Label>--%>
                                </span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: #305878; width: 16%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; color: antiquewhite; margin-left: 10px;">Done</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-12" style="text-align: center">
                                <span>
                                     <label id="lblDone" class="FontColour" style="font-size: 20px; font-weight: bold">0</label>
                                    <%--<asp:Label ID="lblDone" runat="server" style="font-size: 20px; font-weight: bold" Text="0" CssClass="FontColour"></asp:Label>--%></span>
                            </div>
                        </div>
                       <div class="row" style="margin-right:auto">
                            <div class="col-sm-12" style="text-align: right">
                                <span>
                                    <asp:Label CssClass="FontColour" runat="server" ID="Label2" Text="LM :"></asp:Label></span>
                                <span>
                                    <label id="LMDone" class="FontColour" style="font-size: 12px; font-weight: bold">0</label>
                                    <%--<asp:Label runat="server" ID="LMDOne" Text="0" style="font-size: 12px; font-weight: bold" CssClass="FontColour"></asp:Label>--%>
                                </span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: #e6cba2; width: 16%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; color: antiquewhite; margin-left: 10px;">New DE</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-12" style="text-align: center">
                                <span>
                                     <label id="lblDE" class="FontColour" style="font-size: 20px; font-weight: bold">0</label>
                                 </span>
                            </div>
                        </div>
                       <div class="row" style="margin-right:auto">
                            <div class="col-sm-12" style="text-align: right">
                                <span>
                                    <asp:Label CssClass="FontColour" runat="server" ID="Label4" Text="LM :"></asp:Label></span>
                                <span>
                                     <label id="LMDE" class="FontColour" style="font-size: 12px; font-weight: bold">0</label>

                                </span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: #d87860; width: 16%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; color: antiquewhite; margin-left: 10px;">New CR</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-12" style="text-align: center">
                                <span>
                                     <label id="lblCR" class="FontColour" style="font-size: 20px; font-weight: bold">0</label>
                                </span>
                            </div>
                        </div>
                        <div class="row" style="margin-right:auto">
                            <div class="col-sm-12" style="text-align: right">
                                <span>
                                    <asp:Label CssClass="FontColour" runat="server" ID="Label7" Text="LM :"></asp:Label></span>
                                <span>
                                     <label id="LMCR" class="FontColour" style="font-size: 12px; font-weight: bold">0</label>
                                </span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: #a5a5a5; width: 16%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; color: antiquewhite; margin-left: 10px;">Pending</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-12" style="text-align: center">
                                <span>
                                    <label id="lblPending" class="FontColour" style="font-size: 20px; font-weight: bold">0</label>

                                </span>
                            </div>
                        </div>
                        <div class="row" style="margin-right:auto">
                            <div class="col-sm-12" style="text-align: right">
                                <span>
                                    <asp:Label CssClass="FontColour" runat="server" ID="Label10" Text="LM :"></asp:Label></span>
                                <span>
                                    <label id="LMPending" class="FontColour" style="font-size: 12px; font-weight: bold">0</label>
                                </span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: #d1ffed; width: 30%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 10px;">Achievement</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-12" style="text-align: center">
                                <span>

                                    <asp:Label ID="lblAchieve" runat="server" style="font-size: 20px; font-weight: bold" Text="0%"></asp:Label></span>
                            </div>
                        </div>
                        <div class="row" style="margin-right:auto">
                            <div class="col-sm-12" style="text-align: right">
                                <span>
                                    <asp:Label runat="server" ID="Label13" Text="LM :"></asp:Label></span>
                                <span>
                                    <asp:Label runat="server" ID="LMAchieve" Text="0%" style="font-size: 12px; font-weight: bold"></asp:Label>

                                </span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
           <table style="width: 98%; margin-left: 10px; margin-top: 10px">
              <tr style="border-spacing: 3px; margin-top: 10px">
                  <td style="border-radius: 10px; width: 70%; vertical-align: top">
                       <div class="row">
                           <div class="col-md-9">
                               <table class="table table-striped table-bordered table-hover"
                                        id="TableId"
                                        cellspacing="0"
                                        align="center">
                                    <thead>
                                        <tr>
                                            <th rowspan="2" style="font-size: 12px; vertical-align: middle"; valign= "center">User CA</th>
                                            <th colspan="3" class="text-center" style="font-size: 12px;">Done MTD</th>
                                            <th colspan="3" class="text-center" style="font-size: 12px;">Done Daily</th>
                                            <th colspan="3" class="text-center" style="font-size: 12px;">Decision Engine</th>
                                            <th colspan="3" class="text-center" style="font-size: 12px;">Credit Review(Claimed)</th>
                                            <th rowspan="2" style="vertical-align: middle"; valign="center;font-size: 12px;">Rtn SO</th>
                                            <th rowspan="2" style="vertical-align: middle"; valign="center;font-size: 12px;">Rtn Svy</th>
                                            <th rowspan="2" style="vertical-align: middle"; valign="center;font-size: 12px;">Ach</th>
                                        </tr>
                                        <tr>
                                            <th class="text-center" style="font-size: 12px;">New</th>
                                            <th class="text-center" style="font-size: 12px;">Return</th>
                                            <th class="text-center" style="font-size: 12px;">Copy</th>

                                            <th class="text-center" style="font-size: 12px;">New</th>
                                            <th class="text-center" style="font-size: 12px;">Return</th>
                                            <th class="text-center" style="font-size: 12px;">Copy</th>

                                            <th class="text-center" style="font-size: 12px;">New</th>
                                            <th class="text-center" style="font-size: 12px;">Return</th>
                                            <th class="text-center" style="font-size: 12px;">Copy</th>

                                            <th class="text-center" style="font-size: 12px;">New</th>
                                            <th class="text-center" style="font-size: 12px;">Return</th>
                                            <th class="text-center" style="font-size: 12px;">Copy</th>

                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th class="text-right" font-weight: bold">Total</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th id="ACH"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                           </div>
                          <div class="col-lg-3 text-center" style="margin-left:auto" >
                              <%--<div id="container" class="text-left"></div>--%>
                              <%--<canvas id="densityChart" width="600"></canvas>--%>
                              <%--<div id="chartContainer" style="height: 300px; width: 600px;"></div>--%>
                              <%--<div id = "Barchart" ></div>--%>
                               <%--<canvas id="Chart1"></canvas>--%>
                                <div id="container" class="text-left" style="width: 350px; height:1000px">
                                    <script>
                                  <%-- Highcharts.chart('container', {
                                            chart: {
                                                type: 'bar'
                                            },
                                            title: {
                                                text: 'CREDIT REVIEW (UNCLAIM)'
                                            },
                                            xAxis: {
                                                categories: [<%=Area%>]
                                            },
                                            yAxis: {
                                                min: 0,
                                                title: {
                                                    text: ''
                                                }
                                            },
                                            legend: {
                                                reversed: true,
                                                responsive: true
                                            },
                                            plotOptions: {
                                                series: {
                                                    stacking: 'normal'
                                                }
                                            },
                                            series: [ {
                                                    name: 'Copy Cancel',
                                                    color: '#ffc000',
                                                    data: [<%=RangeCopy%>]
                                            }, {
                                                    name: 'Return',
                                                    color: '#5b9bd5',
                                                    data: [<%=RangeReturn%>]
                                                },  {

                                                    name: 'New',
                                                    color: '#70ad47',
                                                    data: [<%=RangeNew%>]
                                                }]
                                        });--%>
                                    </script>
                                </div>
                               <div>
                                     <button class="btn btn-success" disabled="disabled" id="btnNew" >80</button>
                                      <button class="btn btn-info" disabled ="disabled" id="btnReturn">75</button>
                                      <button class="btn btn-warning" disabled="disabled" id="btnCancel">58</button>
                                      <img src="~/styles/img/logo.png" runat="server" />
                                 </div>
                           </div>
                      </div>
                  </td>
               </tr>
            </table>
        </div>

    </form>
</body>

</html>

