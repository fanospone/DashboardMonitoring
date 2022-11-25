<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard1.aspx.cs" Inherits="UploaderZipcode.Dashboard1" %>

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
            height: 50vh;
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


    <table class="col-sm-6" >
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8">28</th>
            </tr>
            <tr class="font5">
                <th rowspan="1">97</th>
                <th rowspan="1">61</th>
                <th rowspan="1" colspan="2">34</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="red">REJECT</th>
                <th rowspan="1" colspan="2" class="yellow">CANCEL</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" class="red">LAST MONTH</th>
                <th rowspan="1" class="red">THIS MONTH</th>
                <th rowspan="1" colspan="2" class="blue">TARGET</th>
                <th rowspan="1" colspan="2" class="blue">THIS MONTH</th>
                <th rowspan="1" class="yellow">LAST MONTH</th>
                <th rowspan="1" class="yellow">THIS MONTH</th>
            </tr>

            <tr class="font5">
                <th rowspan="3">28</th>
                <th rowspan="3">5</th>
                <th rowspan="1" colspan="2">100</th>
                <th rowspan="1" colspan="2">71</th>
                <th rowspan="3">62</th>
                <th rowspan="3">20</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="4" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="4">17,23%</th>
            </tr>




            <tr class="font2">
                <th rowspan="1" colspan="2" class="orange">Toyota</th>
                <th rowspan="1" colspan="2" class="orange">Daihatsu</th>
                <th rowspan="1" colspan="2" class="orange">Siap Dana</th>
                <th rowspan="1" colspan="2" class="orange">Others</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.33%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.21%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.12%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.01%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">55</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">20</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">4</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">1</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">15</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">5</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - BOGOR BRANCH</th>
            </tr>



        </tbody>

    </table>




    <table id="full-screen-me" class="col-sm-6" >
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8">28</th>
            </tr>
            <tr class="font5">
                <th rowspan="1">97</th>
                <th rowspan="1">61</th>
                <th rowspan="1" colspan="2">34</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="red">REJECT</th>
                <th rowspan="1" colspan="2" class="yellow">CANCEL</th>
            </tr>


            <tr class="font2">
                <th rowspan="1" class="red">LAST MONTH</th>
                <th rowspan="1" class="red">THIS MONTH</th>
                <th rowspan="1" colspan="2" class="blue">TARGET</th>
                <th rowspan="1" colspan="2" class="blue">THIS MONTH</th>
                <th rowspan="1" class="yellow">LAST MONTH</th>
                <th rowspan="1" class="yellow">THIS MONTH</th>
            </tr>

            <tr class="font5">
                <th rowspan="3">28</th>
                <th rowspan="3">5</th>
                <th rowspan="1" colspan="2">100</th>
                <th rowspan="1" colspan="2">71</th>
                <th rowspan="3">62</th>
                <th rowspan="3">20</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="4" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="4">17,23%</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="2" class="orange">Toyota</th>
                <th rowspan="1" colspan="2" class="orange">Daihatsu</th>
                <th rowspan="1" colspan="2" class="orange">Siap Dana</th>
                <th rowspan="1" colspan="2" class="orange">Others</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.33%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.21%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.12%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.01%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">55</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">20</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">4</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">1</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">15</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">5</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - BOGOR BRANCH</th>
            </tr>

        </tbody>

    </table>


    <table class="col-sm-6" >
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8">28</th>
            </tr>
            <tr class="font5">
                <th rowspan="1">97</th>
                <th rowspan="1">61</th>
                <th rowspan="1" colspan="2">34</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="red">REJECT</th>
                <th rowspan="1" colspan="2" class="yellow">CANCEL</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" class="red">LAST MONTH</th>
                <th rowspan="1" class="red">THIS MONTH</th>
                <th rowspan="1" colspan="2" class="blue">TARGET</th>
                <th rowspan="1" colspan="2" class="blue">THIS MONTH</th>
                <th rowspan="1" class="yellow">LAST MONTH</th>
                <th rowspan="1" class="yellow">THIS MONTH</th>
            </tr>

            <tr class="font5">
                <th rowspan="3">28</th>
                <th rowspan="3">5</th>
                <th rowspan="1" colspan="2">100</th>
                <th rowspan="1" colspan="2">71</th>
                <th rowspan="3">62</th>
                <th rowspan="3">20</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="4" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="4">17,23%</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="2" class="orange">Toyota</th>
                <th rowspan="1" colspan="2" class="orange">Daihatsu</th>
                <th rowspan="1" colspan="2" class="orange">Siap Dana</th>
                <th rowspan="1" colspan="2" class="orange">Others</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.33%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.21%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.12%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.01%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">55</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">20</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">4</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">1</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">15</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">5</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - BOGOR BRANCH</th>
            </tr>



        </tbody>

    </table>


    <table class="col-sm-6" >
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8">28</th>
            </tr>
            <tr class="font5">
                <th rowspan="1">97</th>
                <th rowspan="1">61</th>
                <th rowspan="1" colspan="2">34</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="red">REJECT</th>
                <th rowspan="1" colspan="2" class="yellow">CANCEL</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" class="red">LAST MONTH</th>
                <th rowspan="1" class="red">THIS MONTH</th>
                <th rowspan="1" colspan="2" class="blue">TARGET</th>
                <th rowspan="1" colspan="2" class="blue">THIS MONTH</th>
                <th rowspan="1" class="yellow">LAST MONTH</th>
                <th rowspan="1" class="yellow">THIS MONTH</th>
            </tr>

            <tr class="font5">
                <th rowspan="3">28</th>
                <th rowspan="3">5</th>
                <th rowspan="1" colspan="2">100</th>
                <th rowspan="1" colspan="2">71</th>
                <th rowspan="3">62</th>
                <th rowspan="3">20</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="4" class="gray">GROSS YIELD</th>
            </tr>

            <tr class="font3">
                <th rowspan="1" colspan="4">17,23%</th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="2" class="orange">Toyota</th>
                <th rowspan="1" colspan="2" class="orange">Daihatsu</th>
                <th rowspan="1" colspan="2" class="orange">Siap Dana</th>
                <th rowspan="1" colspan="2" class="orange">Others</th>
            </tr>

            <tr class="font2">
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.33%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.21%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">16.12%</th>
                <th rowspan="1" colspan="1" class="gray">GY</th>
                <th rowspan="1" colspan="1">17.01%</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">55</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="green">IN</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">20</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1" class="blue">Valid</th>
                <th rowspan="1" colspan="1">1</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">4</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">1</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="red">RJC</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">15</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">5</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
                <th rowspan="1" colspan="1" class="yellow">CAN</th>
                <th rowspan="1" colspan="1">0</th>
            </tr>


            <tr class="font2">
                <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - BOGOR BRANCH</th>
            </tr>

        </tbody>

    </table>



</body>

</html>


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