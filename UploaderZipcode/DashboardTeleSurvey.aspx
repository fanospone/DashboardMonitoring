<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DashboardTeleSurvey.aspx.cs" Inherits="UploaderZipcode.DashboardTeleSurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <div class="block-header">
        <h2>PILIH DASHBOARD</h2>
    </div>
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <form id="form1" runat="server">
                <div class="card">
                    <div class="body">
                        <figure class="highcharts-figure">
                            <div id="container" name="container"></div>
                            
                        </figure>
                        <div class="row clearfix">
                            <div class="col-md-10">
                                <asp:DropDownList id="ddl1" runat="server" CssClass="form-control" Onchange="LoadSLAToday(this)">
                                    <asp:ListItem value="1">Area 1 </asp:ListItem> 
                                    <asp:ListItem value="2">Area 2 </asp:ListItem> 
                                    <asp:ListItem value="3">Area 3 </asp:ListItem> 
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                <button ID="btnSearch" class="btn btn-block bg-pink waves-effect" text="SEARCH"/>
                            </div>
                        </div>
                        <div class ="row clearfix">
                            <div class="col-md-6">
                                <p>
                                    <b>MTD</b>
                                </p>
                                <asp:GridView runat="server" ID="GridMTD" class="font1 fcwhite" cellspacing="0" width="100%" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <tr>
                                                    <th rowspan="2" colspan="2" style="background-color: powderblue;text-align: center;width: 50%;">NAME</th>
                                                    <th colspan="4" style="background-color: powderblue;text-align: center;">SLA TELE SURVEY</th>
                                                    <th colspan="3" style="background-color: powderblue;text-align: center;">PRODUCTIVITY</th>
                                                    <th rowspan="2" colspan="2" style="background-color: powderblue;text-align: center;width: 50%;">PERIODE</th>
                                                </tr>
                                                <tr>
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
                                                <td style="text-align: center" class="color2"><%# Eval("svyr") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("SixMnts") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("PrctgSix") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("OneEightM") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("PrctgOneEight") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("Submit") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("Pending") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("Total") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("AssignDate") %></td>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <b>DAILY</b>
                                </p>
                                <asp:GridView runat="server" ID="GridDaily" class="font1 fcwhite" AutoGenerateColumns="false" CellSpacing="0" width="100%">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <tr>
                                                    <th rowspan="2" colspan="2" style="background-color: powderblue;text-align: center;width: 50%;">NAME</th>
                                                    <th colspan="4" style="background-color: powderblue;text-align: center;">SLA TELE SURVEY</th>
                                                    <th colspan="3" style="background-color: powderblue;text-align: center;">PRODUCTIVITY</th>
                                                </tr>
                                                <tr>
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
                                                <td style="text-align: center" class="color2"><%# Eval("svyr") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("SixMnts") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("PrctgSix") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("OneEightM") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("PrctgOneEight") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("Submit") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("Pending") %></td>
                                                <td style="text-align: center" class="color2"><%# Eval("Total") %></td>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class ="row clearfix">
                            <div class="col-md-6">
                                <table id="dtHorizontalExample" class="table table-striped table-bordered table-sm" cellspacing="0"width="100%">
                                    <thead>
                                            <tr>
                                              <th>First name</th>
                                              <th>Last name</th>
                                              <th>Position</th>
                                              <th>Office</th>
                                              <th>Age</th>
                                              <th>Start date</th>
                                              <th>Salary</th>
                                              <th>Extn.</th>
                                              <th>E-mail</th>
                                            </tr>
                                          </thead>
                                    <tbody>
                                            <tr>
                                              <td>Tiger</td>
                                              <td>Nixon</td>
                                              <td>System Architect</td>
                                              <td>Edinburgh</td>
                                              <td>61</td>
                                              <td>2011/04/25</td>
                                              <td>$320,800</td>
                                              <td>5421</td>
                                              <td>t.nixon@datatables.net</td>
                                            </tr>
                                            <tr>
                                              <td>Garrett</td>
                                              <td>Winters</td>
                                              <td>Accountant</td>
                                              <td>Tokyo</td>
                                              <td>63</td>
                                              <td>2011/07/25</td>
                                              <td>$170,750</td>
                                              <td>8422</td>
                                              <td>g.winters@datatables.net</td>
                                            </tr>
                                            <tr>
                                              <td>Ashton</td>
                                              <td>Cox</td>
                                              <td>Junior Technical Author</td>
                                              <td>San Francisco</td>
                                              <td>66</td>
                                              <td>2009/01/12</td>
                                              <td>$86,000</td>
                                              <td>1562</td>
                                              <td>a.cox@datatables.net</td>
                                            </tr>
                                            <tr>
                                              <td>Cedric</td>
                                              <td>Kelly</td>
                                              <td>Senior Javascript Developer</td>
                                              <td>Edinburgh</td>
                                              <td>22</td>
                                              <td>2012/03/29</td>
                                              <td>$433,060</td>
                                              <td>6224</td>
                                              <td>c.kelly@datatables.net</td>
                                            </tr>
                                          </tbody>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <table id="dtHorizontalExample2" class="table table-striped table-bordered table-sm" cellspacing="0"width="100%">
                                    <thead>
        <tr>
          <th>First name</th>
          <th>Last name</th>
          <th>Position</th>
          <th>Office</th>
          <th>Age</th>
          <th>Start date</th>
          <th>Salary</th>
          <th>Extn.</th>
          <th>E-mail</th>
        </tr>
      </thead>
                                    <tbody>
        <tr>
          <td>Tiger</td>
          <td>Nixon</td>
          <td>System Architect</td>
          <td>Edinburgh</td>
          <td>61</td>
          <td>2011/04/25</td>
          <td>$320,800</td>
          <td>5421</td>
          <td>t.nixon@datatables.net</td>
        </tr>
        <tr>
          <td>Garrett</td>
          <td>Winters</td>
          <td>Accountant</td>
          <td>Tokyo</td>
          <td>63</td>
          <td>2011/07/25</td>
          <td>$170,750</td>
          <td>8422</td>
          <td>g.winters@datatables.net</td>
        </tr>
        <tr>
          <td>Ashton</td>
          <td>Cox</td>
          <td>Junior Technical Author</td>
          <td>San Francisco</td>
          <td>66</td>
          <td>2009/01/12</td>
          <td>$86,000</td>
          <td>1562</td>
          <td>a.cox@datatables.net</td>
        </tr>
        <tr>
          <td>Cedric</td>
          <td>Kelly</td>
          <td>Senior Javascript Developer</td>
          <td>Edinburgh</td>
          <td>22</td>
          <td>2012/03/29</td>
          <td>$433,060</td>
          <td>6224</td>
          <td>c.kelly@datatables.net</td>
        </tr>
      </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dtHorizontalExample').DataTable({
                "scrollX": true
            });
            $('.dataTables_length').addClass('bs-select');
        });

        Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'DASHBOARD TELE SURVEY'
            },
            //subtitle: {
            //    //text: 'Source: ' +
            //    //    '<a href="https://www.ssb.no/en/statbank/table/08940/" ' +
            //    //    'target="_blank">SSB</a>'
            //},
            xAxis: {
                title: {
                    text: 'Date'
                }
            },
            yAxis: [{
                lineWidth: 1,
                //labels: {
                //    format: '{value}%'
                //},
                title: {
                    //useHTML: true,
                    text: 'Total Productivity'/*'Million tonnes CO<sub>2</sub>-equivalents'*/
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
            //tooltip: {
            //    //headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            //    //pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            //    //    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            //    //footerFormat: '</table>',
            //    //shared: true,
            //    //useHTML: true
            //},
            //plotOptions: {
            //    column: {
            //        pointPadding: 0.2,
            //        borderWidth: 0
            //    }
            //},
            series: [{
                type: 'column',
                name: 'Productivity Today',
                data: <%=lineSLAToday%>,//[[1, 16], [ 2, 11],[4, 29],[5, 46],[6, 44],[7, 53],[8, 33],[9, 1],[11, 58],[12, 67],[13, 58],[14, 65],[15, 42],[16, 24],[17, 0],[18, 54],[19, 12],[20, 71],[21, 53],[27, 0]],
            },
                {
                    type: 'column',
                    name: 'Productivity Last Month',
                    data: <%=lineSLABefore%>,
                    //tooltip: {
                    //    valueSuffix: ' %'
                    //}
                },
                {
                    type: 'spline',
                    name: 'Min. Std. SLA',
                    dashStyle: 'longdash',
                    data: <%=linestdMinSLA%>,
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
                    data: <%=linestdActvty%>,
                    //tooltip: {
                    //    valueSuffix: ' %'
                    //}
                    //visible: false
                },
                {
                    type: 'spline',
                    name: 'Achive. SLA Last Month',
                    data: <%=lineAchiveBEFORE%>,
                    yAxis: 1,
                    tooltip: {
                        valueSuffix: ' %'
                    }
                },
                {
                    type: 'spline',
                    name: 'Achive. SLA This Month',
                    data: <%=lineAchiveNOW%>,
                    yAxis: 1,
                    tooltip: {
                        valueSuffix: ' %'
                    }
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
                    }, {
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
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <%-- <link href="Styles/css/bootstrap.css" rel="stylesheet">--%>
    <style type="text/css">
.highcharts-figure,
.highcharts-data-table table {
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
.dtHorizontalExampleWrapper {
  max-width: 600px;
  margin: 0 auto;
}
#dtHorizontalExample th, td {
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
