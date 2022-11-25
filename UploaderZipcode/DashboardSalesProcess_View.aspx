﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardSalesProcess_View.aspx.cs" Inherits="UploaderZipcode.DashboardSalesProcess_View" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DASHBOARD TAF</title>
    <link rel="stylesheet" href="Dashboard1.css" />

    <style>
        body {
            margin: 0;
        }

        #tb1 {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            height: 60vh;
        }

        #tb2 {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            height: 40vh;
        }

        td,
        th {
            border: 2px solid #000000;
            border-collapse: collapse;
            text-align: center;
        }

        .font5 {
            font-size: 5vw;
        }

        .font8 {
            font-size: 8vw;
        }

        .font3 {
            font-size: 3vw;
        }

        .font2 {
            font-size: 2vw;
        }

        .font1 {
            font-size: 1vw;
        }

        .size8 {
            width: 8%;
        }

        .size10 {
            width: 10%;
        }

        .size5 {
            width: 5%;
        }

        .yellow {
            background-color: #f6ff07;
        }

        .green {
            background-color: #00ff00;
        }

        .blue {
            background-color: #218eee;
        }

        .red {
            background-color: #f70415;
        }

        .gray {
            background-color: #b0c4b4;
        }

        .orange {
            background-color: #ff9900;
        }

        /*tr:nth-child(even) {
            background-color: #dddddd;
        }*/
    </style>



</head>


<body>
    <form id="form1" runat="server">


        <table id="tb1" style="overflow: hidden;">
            <tbody>
                <tr class="font2">
                    <th rowspan="1" colspan="2" class="green">APP-IN</th>
                    <th rowspan="1" colspan="4" class="blue">VALID</th>
                    <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" class="green">LAST MONTH</th>
                    <th rowspan="1" class="green">THIS MONTH</th>
                    <th rowspan="3" colspan="4" class="font5"><span id="dtValid" runat="server"></span></th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" class="font5"><span id="dtAPPinLM" runat="server"></span></th>
                    <th rowspan="1" class="font5"><span id="dtAPPinTM" runat="server"></span></th>
                    <th rowspan="1" colspan="2" class="font5"><span id="dtBACKLOG" runat="server"></span></th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" colspan="2" class="red">REJECT</th>
                    <th rowspan="1" colspan="2" class="yellow">CANCEL</th>
                </tr>





                <tr class="font2">
                    <th rowspan="1" class="red">LAST MONTH</th>
                    <th rowspan="1" class="red">THIS MONTH</th>
                    <th rowspan="1" colspan="2" class="blue">TARGET</th>
                    <th rowspan="1" colspan="2" class="blue">LAST MONTH</th>
                    <th rowspan="1" class="yellow">LAST MONTH</th>
                    <th rowspan="1" class="yellow">THIS MONTH</th>
                </tr>

                <tr class="font2">
                    <th rowspan="3" class="font5"><span id="dtREJECTLM" runat="server"></span></th>
                    <th rowspan="3" class="font5"><span id="dtREJECTTM" runat="server"></span></th>
                    <th rowspan="1" colspan="2"><span id="dtTARGETvalidTM" runat="server"></span></th>
                    <th rowspan="1" colspan="2"><span id="dtTARGETValidLM" runat="server"></span></th>
                    <th rowspan="3" class="font5"><span id="dtCANCELLM" runat="server"></span></th>
                    <th rowspan="3" class="font5"><span id="dtCANCELTM" runat="server"></span></th>
                </tr>

                <tr class="font2">
                    <th rowspan="1" colspan="4" class="gray">GROSS YIELD</th>
                </tr>

                <tr class="font2">
                    <th rowspan="1" colspan="4"><span id="dtGY" runat="server"></span>%</th>
                </tr>

<%--                <tr class="font2">
                    <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - <span id="office" runat="server"></span></th>
                </tr>--%>



            </tbody>

        </table>


         <table id="tb2" style="overflow: hidden;">
            <tbody>

                <tr class="font2">
                    <th rowspan="1" colspan="2" class="orange">TOYOTA</th>
                    <th rowspan="1" colspan="2" class="orange">DAIHATSU</th>
                    <th rowspan="1" colspan="2" class="orange">SIAP DANA</th>
                    <th rowspan="1" colspan="2" class="orange">OTHERS</th>
                </tr>

                <tr class="font2">
                    <th rowspan="1" colspan="1" class="gray">GY</th>
                    <th rowspan="1" colspan="1"><span id="dtGYTY" runat="server"></span>%</th>
                    <th rowspan="1" colspan="1" class="gray">GY</th>
                    <th rowspan="1" colspan="1"><span id="dtGYDH" runat="server"></span>%</th>
                    <th rowspan="1" colspan="1" class="gray">GY</th>
                    <th rowspan="1" colspan="1"><span id="dtGYSD" runat="server"></span>%</th>
                    <th rowspan="1" colspan="1" class="gray">GY</th>
                    <th rowspan="1" colspan="1"><span id="dtGYOT" runat="server"></span>%</th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" colspan="1" class="green">IN</th>
                    <th rowspan="1" colspan="1"><span id="dtINTY" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="green">IN</th>
                    <th rowspan="1" colspan="1"><span id="dtINDH" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="green">IN</th>
                    <th rowspan="1" colspan="1"><span id="dtINSD" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="green">IN</th>
                    <th rowspan="1" colspan="1"><span id="dtINOT" runat="server"></span></th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" colspan="1" class="blue">Valid</th>
                    <th rowspan="1" colspan="1"><span id="dtVALIDTY" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="blue">Valid</th>
                    <th rowspan="1" colspan="1"><span id="dtVALIDDH" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="blue">Valid</th>
                    <th rowspan="1" colspan="1"><span id="dtVALIDSD" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="blue">Valid</th>
                    <th rowspan="1" colspan="1"><span id="dtVALIDOT" runat="server"></span></th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" colspan="1" class="red">RJC</th>
                    <th rowspan="1" colspan="1"><span id="dtRJCTY" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="red">RJC</th>
                    <th rowspan="1" colspan="1"><span id="dtRJCDH" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="red">RJC</th>
                    <th rowspan="1" colspan="1"><span id="dtRJCSD" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="red">RJC</th>
                    <th rowspan="1" colspan="1"><span id="dtRJCOT" runat="server"></span></th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" colspan="1" class="yellow">CAN</th>
                    <th rowspan="1" colspan="1"><span id="dtCANTY" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="yellow">CAN</th>
                    <th rowspan="1" colspan="1"><span id="dtCANDH" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="yellow">CAN</th>
                    <th rowspan="1" colspan="1"><span id="dtCANSD" runat="server"></span></th>
                    <th rowspan="1" colspan="1" class="yellow">CAN</th>
                    <th rowspan="1" colspan="1"><span id="dtCANOT" runat="server"></span></th>
                </tr>


                <tr class="font2">
                    <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - <span id="office" runat="server"></span> <div id="spanUpd" runat="server" class="font1" style="margin-right:0px;margin-bottom:0px"></div></th>
                </tr>

            </tbody>

        </table>

        <label id="lblO" runat="server" style="display: none"></label>
        <label id="lblY" runat="server" style="display: none"></label>
        <label id="lblM" runat="server" style="display: none"></label>



    </form>
</body>
</html>


<%--<script type="text/javascript">

    var lblO = document.getElementById("lblO").textContent;
    var lblY = document.getElementById("lblY").textContent;
    var lblM = document.getElementById("lblM").textContent;

    setTimeout("location.href = 'DashboardSalesProcess.aspx?o=" + lblO + "&y=" + lblY + "&m=" + lblM + "'", 5000); 
</script>--%>



<%--<script type="text/javascript">
    setTimeout("location.href = 'DashboardSalesProcess.aspx'", 5000); // milliseconds, so 10 seconds = 10000ms
</script>--%>




<%--<iframe id="full-screen-me" src="URL" style="overflow:hidden;height:100%;width:100%" height="100%" width="100%" frameborder="0" wmode="transparent"></iframe>--%>

<script type="text/javascript">
    function autoResizeDiv() {
        document.getElementById('full-screen-me').style.height = window.innerHeight + 'px';
    }
    window.onresize = autoResizeDiv;
    autoResizeDiv();
</script>




