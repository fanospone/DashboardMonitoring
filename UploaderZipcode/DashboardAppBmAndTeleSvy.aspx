<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAppBmAndTeleSvy.aspx.cs" Inherits="UploaderZipcode.DashboardAppBmAndTeleSvy" %>

<link href="Styles/css/bootstrap.css" rel="stylesheet">

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>DASHBOARD TAF</title>


    <style>
        body {
            margin: 0;
            width: 100%;
            height: 100vh;

        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }



        #tb1 td, #tb1 th, #tb2 td, #tb2 th {
            border: 0px none #000000;
            border-collapse: collapse;
            text-align: center;
        }

        #tb3 td, #tb3 th, #tb4 td, #tb4 th {
            border: 0px none #000000;
            border-collapse: collapse;
            text-align: center;
        }

         #gvGrid1 th, #gvGrid2 th, #gvGrid3 th, #gvGrid4 th {
            text-align: center;
        }

        #gvGrid1 td, #gvGrid1 th, #gvGrid2 td, #gvGrid2 th {
            border: 1px solid #000000;
            border-collapse: collapse;
            /*text-align: center;*/
        }

        #gvGrid3 td, #gvGrid3 th, #gvGrid4 td, #gvGrid4 th {
            border: 1px solid #000000;
            border-collapse: collapse;
            /*text-align: center;*/
        }


        .hapusrow th:first-child {
            display: none;
        }

        .hapusrow td:first-child {
            display: none;
        }



        /*tr:nth-child(even) {
            background-color: #dddddd;
        }*/

        .green {
            background-color: #00ff00;
        }

        .blue {
            background-color: #218eee;
        }

        .orange {
            background-color: #ff9900;
        }

        .red {
            background-color: #f70415;
        }

        .yellow {
            background-color: #f6ff07;
        }

        .grey {
            background-color: #b0c4b4;
        }


        .color1 {
            background-color: #0F253F;
        }

        .color2 {
            background-color: #17375D;
        }

        .color3 {
            background-color: #182C43;
        }

        .color4 {
            background-color: #4F81BD;
        }

        .color5 {
            background-color: #17375D;
        }


        .fcwhite {
            color: #FFFFFF;
        }


        .font4 {
            font-size: 4vw;
        }

        .font3 {
            font-size: 3vw;
        }

        .font2 {
            font-size: 0.8vw;
        }

        .font1 {
            font-size: 0.4vw;
        }

        .size8 {
            width: 4%;
        }

        .size10 {
            width: 5%;
        }

        .size5 {
            width: 2%;
        }
        .auto-style1 {
            margin-right: 0px;
        }
    </style>


</head>


<body >
    <form runat="server">

        <div class="col-sm-6" style="height: 50vh;padding:1px">
            <table id="tb1" style="height: 8vh" class="font1">
                <tbody>
                    <tr class="grey">
                        <th rowspan="2" colspan="1" class="size5" style="background-color: #FFFFFF; " >
                            <div style="text-align: left" class="auto-style1">
                                <%--<img src="~/Styles/img/logo.png" runat="server" />--%>
                            </div>
                            <div style="text-align: right">BRANCH</div>
                            <div style="text-align: right; margin-bottom: 0px">0 Juni 0000</div>
                        </th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL APPL ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">TOTAL APPL ASSIGN UNCLAIM</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">NEW TELE SAME DAY</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #EEECE1">NEW TELE PENDING</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #92D050">TELE ONLINE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FF0000">TELE IDLE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FFFF00">TELE OFFLINE</th>
                    </tr>
                    <tr class="font2">
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">197</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">120</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">60</th>
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">181</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">164</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">130</th>
                        <th rowspan="1" colspan="1" style="background-color: #EEECE1">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #92D050">4</th>
                        <th rowspan="1" colspan="1" style="background-color: #FF0000">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #FFFF00">1</th>
                    </tr>
                </tbody>
            </table>

            <div id="form1" style="height: 45vh; position: relative">
                <asp:GridView runat="server" ID="gvGrid1" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField>

                            <HeaderTemplate>
                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="2" colspan="1" style="width: 25%">BM & TELE NAME</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">BUCKET</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">TIME TO BUCKET (AVERAGE)</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">MONTHLY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">DAILY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">STATUS</th>
                                    <th rowspan="1" colspan="2" style="width: 14%">APPLICATION CLAIMED</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">APPL BY BRANCH</th>
                                </tr>

                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="1" colspan="1" style="width: 7%">NEW</th>
                                    <th rowspan="1" colspan="1" style="width: 7%">REQ</th>
                                </tr>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <td style="height: 2.3vh" class="color2"><%# Eval("SURVEYOR_NAME") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("BUCKET") %></td>
                                <td style="text-align: center" class="color3"><%# Eval("AVERAGE_TIME_TO_BUCKET") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("MONTHYLY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("DAILY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("STATUS") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("NEW") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("RETURN_HANDLING") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("APPL_BY_BRANCH") %></td>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="col-sm-6" style="height: 50vh;padding:1px">
            <table id="tb2" style="height: 8vh" class="font1">
                <tbody>
                    <tr class="grey">
                        <th rowspan="2" colspan="1" class="size5" style="background-color: #FFFFFF">
                            <div style="text-align: left">
                                <%--<img src="~/Styles/img/logo.png" runat="server" />--%>
                            </div>
                            <div style="text-align: right">BRANCH</div>
                            <div style="text-align: right; margin-bottom: 0px">0 Juni 0000</div>
                        </th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL APPL ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">TOTAL APPL ASSIGN UNCLAIM</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">NEW TELE SAME DAY</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #EEECE1">NEW TELE PENDING</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #92D050">TELE ONLINE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FF0000">TELE IDLE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FFFF00">TELE OFFLINE</th>
                    </tr>
                    <tr class="font2">
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">197</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">120</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">60</th>
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">181</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">164</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">130</th>
                        <th rowspan="1" colspan="1" style="background-color: #EEECE1">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #92D050">4</th>
                        <th rowspan="1" colspan="1" style="background-color: #FF0000">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #FFFF00">1</th>
                    </tr>
                </tbody>
            </table>

            <div id="form2" style="height: 40vh; width: 100%; position: relative">
                <asp:GridView runat="server" ID="gvGrid2" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField>

                            <HeaderTemplate>
                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="2" colspan="1" style="width: 25%">BM & TELE NAME</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">BUCKET</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">TIME TO BUCKET (AVERAGE)</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">MONTHLY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">DAILY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">STATUS</th>
                                    <th rowspan="1" colspan="2" style="width: 14%">APPLICATION CLAIMED</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">APPL BY BRANCH</th>
                                </tr>

                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="1" colspan="1" style="width: 7%">NEW</th>
                                    <th rowspan="1" colspan="1" style="width: 7%">REQ</th>
                                </tr>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <td style="height: 2.3vh" class="color2"><%# Eval("SURVEYOR_NAME") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("BUCKET") %></td>
                                <td style="text-align: center" class="color3"><%# Eval("AVERAGE_TIME_TO_BUCKET") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("MONTHYLY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("DAILY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("STATUS") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("NEW") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("RETURN_HANDLING") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("APPL_BY_BRANCH") %></td>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="col-sm-6" style="height: 50vh;padding:1px">
            <table id="tb3" style="height: 8vh" class="font1">
                <tbody>
                    <tr class="grey">
                        <th rowspan="2" colspan="1" class="size5" style="background-color: #FFFFFF">
                            <div style="text-align: left">
                                <%--<img src="~/Styles/img/logo.png" runat="server" />--%>
                            </div>
                            <div style="text-align: right">BRANCH</div>
                            <div style="text-align: right; margin-bottom: 0px">0 Juni 0000</div>
                        </th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL APPL ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">TOTAL APPL ASSIGN UNCLAIM</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">NEW TELE SAME DAY</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #EEECE1">NEW TELE PENDING</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #92D050">TELE ONLINE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FF0000">TELE IDLE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FFFF00">TELE OFFLINE</th>
                    </tr>
                    <tr class="font2">
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">197</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">120</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">60</th>
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">181</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">164</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">130</th>
                        <th rowspan="1" colspan="1" style="background-color: #EEECE1">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #92D050">4</th>
                        <th rowspan="1" colspan="1" style="background-color: #FF0000">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #FFFF00">1</th>
                    </tr>
                </tbody>
            </table>

            <div id="form3" style="height: 40vh; width: 100%; position: relative">
                <asp:GridView runat="server" ID="gvGrid3" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField>

                            <HeaderTemplate>
                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="2" colspan="1" style="width: 25%">BM & TELE NAME</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">BUCKET</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">TIME TO BUCKET (AVERAGE)</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">MONTHLY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">DAILY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">STATUS</th>
                                    <th rowspan="1" colspan="2" style="width: 14%">APPLICATION CLAIMED</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">APPL BY BRANCH</th>
                                </tr>

                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="1" colspan="1" style="width: 7%">NEW</th>
                                    <th rowspan="1" colspan="1" style="width: 7%">REQ</th>
                                </tr>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <td style="height: 2.3vh" class="color2"><%# Eval("SURVEYOR_NAME") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("BUCKET") %></td>
                                <td style="text-align: center" class="color3"><%# Eval("AVERAGE_TIME_TO_BUCKET") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("MONTHYLY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("DAILY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("STATUS") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("NEW") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("RETURN_HANDLING") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("APPL_BY_BRANCH") %></td>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="col-sm-6" style="height: 50vh;padding:1px">
            <table id="tb4" style="height: 8vh" class="font1">
                <tbody>
                    <tr class="grey">
                        <th rowspan="2" colspan="1" class="size5" style="background-color: #FFFFFF">
                            <div style="text-align: left">
                                <%--<img src="~/Styles/img/logo.png" runat="server" />--%>
                            </div>
                            <div style="text-align: right">BRANCH</div>
                            <div style="text-align: right; margin-bottom: 0px">0 Juni 0000</div>
                        </th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL APPL ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY ASSIGN</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">TOTAL APPL ASSIGN UNCLAIM</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY TELE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">NEW TELE SAME DAY</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #EEECE1">NEW TELE PENDING</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #92D050">TELE ONLINE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FF0000">TELE IDLE</th>
                        <th rowspan="1" colspan="1" class="size8" style="background-color: #FFFF00">TELE OFFLINE</th>
                    </tr>
                    <tr class="font2">
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">197</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">120</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">60</th>
                        <th rowspan="1" colspan="1" style="background-color: #BFBFBF">181</th>
                        <th rowspan="1" colspan="1" style="background-color: #D8D8D8">164</th>
                        <th rowspan="1" colspan="1" style="background-color: #F2F2F2">130</th>
                        <th rowspan="1" colspan="1" style="background-color: #EEECE1">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #92D050">4</th>
                        <th rowspan="1" colspan="1" style="background-color: #FF0000">3</th>
                        <th rowspan="1" colspan="1" style="background-color: #FFFF00">1</th>
                    </tr>
                </tbody>
            </table>

            <div id="form4" style="height: 40vh; width: 100%; position: relative">
                <asp:GridView runat="server" ID="gvGrid4" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField>

                            <HeaderTemplate>
                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="2" colspan="1" style="width: 25%">BM & TELE NAME</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">BUCKET</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">TIME TO BUCKET (AVERAGE)</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">MONTHLY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 7%">DAILY PRODUCTIVITY</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">STATUS</th>
                                    <th rowspan="1" colspan="2" style="width: 14%">APPLICATION CLAIMED</th>
                                    <th rowspan="2" colspan="1" style="width: 8%">APPL BY BRANCH</th>
                                </tr>

                                <tr style="height: 3vh" class="color1">
                                    <th></th>
                                    <th rowspan="1" colspan="1" style="width: 7%">NEW</th>
                                    <th rowspan="1" colspan="1" style="width: 7%">REQ</th>
                                </tr>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <td style="height: 2.3vh" class="color2"><%# Eval("SURVEYOR_NAME") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("BUCKET") %></td>
                                <td style="text-align: center" class="color3"><%# Eval("AVERAGE_TIME_TO_BUCKET") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("MONTHYLY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("DAILY_PRODUCTIVITY") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("STATUS") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("NEW") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("RETURN_HANDLING") %></td>
                                <td style="text-align: center" class="color2"><%# Eval("APPL_BY_BRANCH") %></td>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>


        <%-- <form id="form2" style="position:relative;height:70vh"  class="col-sm-3">
        <asp:Chart ID="Chart1" runat="server" Height="750px">
            <Titles>
                <asp:Title ShadowOffset="3" Name="Items" />
            </Titles>
            <Legends>
                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="false" Name="Default"
                    LegendStyle="Row" />
            </Legends>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
            </ChartAreas>
        </asp:Chart>
    </form>--%>


        <%--    <table id="tb2" style="height: 4vh; width: 100%" class="font1">
        <tbody>
            <tr style="height: 4vh">
                <th rowspan="1" colspan="19" style="background-color: #BFBFBF">JAKARTA SOUTH - TOYOTA ASTRA FINANCE</th>
            </tr>
        </tbody>
    </table>--%>


        <label id="spanSeqNo" runat="server" style="display: none"></label>


    </form>
</body>

</html>



<script type="text/javascript">
    $(window).resize(function () {
        resize();
    });
    function resize() {
        var w = $(window).width();
        var h = $(window).height();
        document.getElementById('Chart1').style.width = w + 'px';
        document.getElementById('Chart1').style.height = h + 'px';
        //$("#button").click();           
    }
</script>



<script>

    var allTableCells = document.getElementsByTagName("td");
    var node = allTableCells[3];
    var currentText = node.childNodes[0].nodeValue;

    //if (currentText > 0) {
    //    node.style.color = "green";
    //}
    /*
    for (var i = 0, max = allTableCells.length; i < max; i++) {
        var node = allTableCells[i];

        //get the text from the first child node - which should be a text node
        var currentText = node.childNodes[0].nodeValue;

        //check for 'one' and assign this table cell's background color accordingly 
        if (currentText === "0") {
            node.style.color = "red";
        }

        if (currentText > 0) {
            node.style.color = "green";
        }

        //if (currentText === "ASSIGN") {
        //    node.style.color = "blue";
        //}

        //if (currentText === "TELE") {
        //    node.style.color = "yellow";
        //}

        //if (currentText === "NEW") {
        //    node.style.backgroundColor = "red";
        //    node.style.color = "red";
        //}
        
    }
    */
</script>
