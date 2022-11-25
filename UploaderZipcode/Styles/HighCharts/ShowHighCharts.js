function HighCharts(MonthYear, OsarValue, Balance7, Balance30, Balance60, Balance90, BalanceTarget7, BalanceTarget30, BalanceTarget60, BalanceTarget90) {
    const MonthYearString = [];
    var OsarValueString = "";
    var Balance7String = "";
    var Balance30String = "";
    var Balance60String = "";
    var Balance90String = "";
    var BalanceTarget7String = "";
    var BalanceTarget30String = "";
    var BalanceTarget60String = "";
    var BalanceTarget90String = "";
    for (i = 0; i < MonthYear.length; i++)
    {
        MonthYearString.push([MonthYear[i]]);   
    }

    for (i = 0; i < OsarValue.length; i++) {
        OsarValueString += "'" + OsarValue[i] + "'";
        if (i + 1 < OsarValue.length) {
            OsarValueString += ",";
        }
    }

    for (i = 0; i < Balance7.length; i++) {
        Balance7String += Balance7[i];
        if (i + 1 < Balance7.length) {
            Balance7String += ",";
        }
    }

    for (i = 0; i < Balance30.length; i++) {
        Balance30String += Balance30[i];
        if (i + 1 < Balance30.length) {
            Balance30String += ",";
        }
    }

    for (i = 0; i < Balance60.length; i++) {
        Balance60String += Balance60[i];
        if (i + 1 < Balance60.length) {
            Balance60String += ",";
        }
    }

    for (i = 0; i < Balance90.length; i++) {
        Balance90String += Balance90[i];
        if (i + 1 < Balance90.length) {
            Balance90String += ",";
        }
    }

    for (i = 0; i < BalanceTarget7.length; i++) {
        BalanceTarget7String += BalanceTarget7[i];
        if (i + 1 < Balance7.length) {
            BalanceTarget7String += ",";
        }
    }

    for (i = 0; i < BalanceTarget30.length; i++) {
        BalanceTarget30String += BalanceTarget30[i];
        if (i + 1 < Balance30.length) {
            BalanceTarget30String += ",";
        }
    }

    for (i = 0; i < BalanceTarget60.length; i++) {
        BalanceTarget60String += BalanceTarget60[i];
        if (i + 1 < Balance60.length) {
            BalanceTarget60String += ",";
        }
    }

    for (i = 0; i < BalanceTarget90.length; i++) {
        BalanceTarget90String +=  BalanceTarget90[i];
        if (i + 1 < Balance90.length) {
            BalanceTarget90String += ",";
        }
    }

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
        categories: MonthYearString,
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
                formatter: function () {
                    if (this.y > 1000000) {
                        return Highcharts.numberFormat(this.y / 1000, 3);
                    } else if (this.y > 1000) {
                        return Highcharts.numberFormat(this.y / 1000, 3);
                    } else {
                        return this.y;
                    }
                },
                inside: true,
                verticalAlign: 'bottom',
                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor)
                    || 'black',
                style: {
                    fontSize: '9px',
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
            name: 'OSAR (Mio)',
            type: 'column',
            color: '#ADD8E6',
            yAxis: 1,
            data: [OsarValueString],
            tooltip: {
                valueSuffix: ''
            }
        },
        {
            name: '%>7',
            type: 'spline',
            color: '#B22222',
            data: [Balance7String],
            tooltip: {
                valueSuffix: ' %'
            }
        },
        {
            name: '%>30',
            type: 'spline',
            color: '#ADFF2F',
            data: [Balance30String],
            tooltip: {
                valueSuffix: ' %'
            }
        }, {
            name: '%>60',
            type: 'spline',
            color: '#663399',
            data: [Balance60String],
            tooltip: {
                valueSuffix: ' %'
            }
        },
        {
            name: '%>90',
            type: 'spline',
            color: '#00BFFF',
            data: [Balance90String],
            tooltip: {
                valueSuffix: ' %'
            }
        },
        {
            name: '>7',
            type: 'spline',
            color: 'red',
            data: [BalanceTarget7String],
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
            color: '#A9A9A9',
            data: [BalanceTarget30String],
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
            color: '#800000',
            data: [BalanceTarget60String],
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
            color: '#696969',
            data: [BalanceTarget90String],
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