<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardSalesProcess4.aspx.cs" Inherits="UploaderZipcode.DashboardSalesProcess4" %>


<!DOCTYPE html>
<link href="Styles/css/bootstrap.css" rel="stylesheet">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>DASHBOARD TAF</title>


    <style>
        body {
            margin: 0;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 50%;
            height: 48vh;
        }

         #tbDate {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            height: 4vh;
        }

        td,
        th {
            border: 2px solid #000000;
            border-collapse: collapse;
            text-align: center;
        }

        /*tr:nth-child(even) {
            background-color: #dddddd;
        }*/

        .font5 {
            font-size: 3vw;
        }

        .font8 {
            font-size: 4vw;
        }

        .font3 {
            font-size: 2vw;
        }

        .font2 {
            font-size: 10px;
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
    </style>


</head>


<body>


    <table class="col-sm-6" runat="server">
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8"><span id="dt1Valid" runat="server"></span></th>
            </tr>
            <tr class="font5">
                <th rowspan="1"><span id="dt1APPinLM" runat="server"></span></th>
                <th rowspan="1"><span id="dt1APPinTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt1BACKLOG" runat="server"></span></th>
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

            <tr class="font5">
                <th rowspan="3"><span id="dt1REJECTLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt1REJECTTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt1TARGETvalidTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt1TARGETValidLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt1CANCELLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt1CANCELTM" runat="server"></span></th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="2" style="background-color:#ffe194">IN PROCESS</th>
                <th rowspan="1" colspan="2" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="2"><span id="dt1IP" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt1GY" runat="server"></span>%</th>
            </tr>




            <tr class="font2">
                <th rowspan="1" colspan="2" class="orange">TOYOTA</th>
                    <th rowspan="1" colspan="2" class="orange">DAIHATSU</th>
                    <th rowspan="1" colspan="2" class="orange">SIAP DANA</th>
                    <th rowspan="1" colspan="2" class="orange">OTHERS</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt1GYTY" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt1GYDH" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt1GYSD" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt1GYOT" runat="server"></span>%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt1INTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt1INDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt1INSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt1INOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt1VALIDTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt1VALIDDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt1VALIDSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt1VALIDOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt1RJCTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt1RJCDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt1RJCSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt1RJCOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt1CANTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt1CANDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt1CANSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt1CANOT" runat="server"></span></th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - <span id="dt1Office" runat="server"></span></th>
            </tr>
        </tbody>
    </table>


    <table id="tb1" class="col-sm-6" runat="server">
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8"><span id="dt2Valid" runat="server"></span></th>
            </tr>
            <tr class="font5">
                <th rowspan="1"><span id="dt2APPinLM" runat="server"></span></th>
                <th rowspan="1"><span id="dt2APPinTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt2BACKLOG" runat="server"></span></th>
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

            <tr class="font5">
                <th rowspan="3"><span id="dt2REJECTLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt2REJECTTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt2TARGETvalidTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt2TARGETValidLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt2CANCELLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt2CANCELTM" runat="server"></span></th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="2" style="background-color:#ffe194">IN PROCESS</th>
                <th rowspan="1" colspan="2" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="2"><span id="dt2IP" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt2GY" runat="server"></span>%</th>
            </tr>




            <tr class="font2">
                 <th rowspan="1" colspan="2" class="orange">TOYOTA</th>
                    <th rowspan="1" colspan="2" class="orange">DAIHATSU</th>
                    <th rowspan="1" colspan="2" class="orange">SIAP DANA</th>
                    <th rowspan="1" colspan="2" class="orange">OTHERS</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt2GYTY" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt2GYDH" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt2GYSD" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt2GYOT" runat="server"></span>%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt2INTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt2INDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt2INSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt2INOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt2VALIDTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt2VALIDDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt2VALIDSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt2VALIDOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt2RJCTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt2RJCDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt2RJCSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt2RJCOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt2CANTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt2CANDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt2CANSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt2CANOT" runat="server"></span></th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - <span id="dt2Office" runat="server"></span></th>
            </tr>
        </tbody>
    </table>


    <table class="col-sm-6" runat="server">
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8"><span id="dt3Valid" runat="server"></span></th>
            </tr>
            <tr class="font5">
                <th rowspan="1"><span id="dt3APPinLM" runat="server"></span></th>
                <th rowspan="1"><span id="dt3APPinTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt3BACKLOG" runat="server"></span></th>
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

            <tr class="font5">
                <th rowspan="3"><span id="dt3REJECTLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt3REJECTTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt3TARGETvalidTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt3TARGETValidLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt3CANCELLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt3CANCELTM" runat="server"></span></th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="2" style="background-color:#ffe194">IN PROCESS</th>
                <th rowspan="1" colspan="2" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="2"><span id="dt3IP" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt3GY" runat="server"></span>%</th>
            </tr>




            <tr class="font2">
                 <th rowspan="1" colspan="2" class="orange">TOYOTA</th>
                    <th rowspan="1" colspan="2" class="orange">DAIHATSU</th>
                    <th rowspan="1" colspan="2" class="orange">SIAP DANA</th>
                    <th rowspan="1" colspan="2" class="orange">OTHERS</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt3GYTY" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt3GYDH" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt3GYSD" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt3GYOT" runat="server"></span>%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt3INTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt3INDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt3INSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt3INOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt3VALIDTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt3VALIDDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt3VALIDSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt3VALIDOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt3RJCTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt3RJCDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt3RJCSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt3RJCOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt3CANTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt3CANDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt3CANSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt3CANOT" runat="server"></span></th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - <span id="dt3Office" runat="server"></span></th>
            </tr>

        </tbody>
    </table>


    <table class="col-sm-6" runat="server">
        <tbody>

            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8"><span id="dt4Valid" runat="server"></span></th>
            </tr>
            <tr class="font5">
                <th rowspan="1"><span id="dt4APPinLM" runat="server"></span></th>
                <th rowspan="1"><span id="dt4APPinTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt4BACKLOG" runat="server"></span></th>
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

            <tr class="font5">
                <th rowspan="3"><span id="dt4REJECTLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt4REJECTTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt4TARGETvalidTM" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt4TARGETValidLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt4CANCELLM" runat="server"></span></th>
                <th rowspan="3"><span id="dt4CANCELTM" runat="server"></span></th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="2" style="background-color:#ffe194">IN PROCESS</th>
                <th rowspan="1" colspan="2" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="2"><span id="dt4IP" runat="server"></span></th>
                <th rowspan="1" colspan="2"><span id="dt4GY" runat="server"></span>%</th>
            </tr>




            <tr class="font2">
                 <th rowspan="1" colspan="2" class="orange">TOYOTA</th>
                    <th rowspan="1" colspan="2" class="orange">DAIHATSU</th>
                    <th rowspan="1" colspan="2" class="orange">SIAP DANA</th>
                    <th rowspan="1" colspan="2" class="orange">OTHERS</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt4GYTY" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt4GYDH" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt4GYSD" runat="server"></span>%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1"><span id="dt4GYOT" runat="server"></span>%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt4INTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt4INDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt4INSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1"><span id="dt4INOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt4VALIDTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt4VALIDDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt4VALIDSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1"><span id="dt4VALIDOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt4RJCTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt4RJCDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt4RJCSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1"><span id="dt4RJCOT" runat="server"></span></th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt4CANTY" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt4CANDH" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt4CANSD" runat="server"></span></th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1"><span id="dt4CANOT" runat="server"></span></th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - <span id="dt4Office" runat="server"></span></th>
            </tr>
        </tbody>
    </table>
    <table id="tbDate" runat="server">
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">
                    <div id="spanUpd" runat="server" class="font1" style="margin-right: 0px; margin-bottom: 0px"></div>
                </th>
            </tr>
        </tbody>
    </table>


    <label id="spanAspx" runat="server" style="display: none"></label>
    <label id="spanQueryString" runat="server" style="display: none"></label>

</body>

</html>



<script type="text/javascript">
    var Aspx = document.getElementById("spanAspx").textContent;
    var QueryString = document.getElementById("spanQueryString").textContent;

    setTimeout("location.href = '" + Aspx + ".aspx" + QueryString + "'", 5000); // milliseconds, so 10 seconds = 10000ms
</script>


<%--<script type="text/javascript">
    setTimeout("location.href = 'Dashboard2.aspx'", 5000); 
</script>--%>

<%--<script type="text/javascript">
        function autoResizeDiv()
        {
            document.getElementById('full-screen-me').style.height = window.innerHeight +'px';
        }
        window.onresize = autoResizeDiv;
        autoResizeDiv();
    </script>--%>