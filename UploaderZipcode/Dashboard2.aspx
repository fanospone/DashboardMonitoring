<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard2.aspx.cs" Inherits="UploaderZipcode.Dashboard2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DASHBOARD TAF</title>
    <link rel="stylesheet" href="Dashboard1.css"/>

    <style>
        body {
            margin: 0;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            height: 100vh;
        }

        td,
        th {
            border: 2px solid #000000;
            border-collapse: collapse;
            text-align: center;
        }


        .font5{
            font-size:5vw;
        }

        .font8{
            font-size:8vw;
        }

        .font3{
            font-size:3vw;
        }

        .font2{
            font-size:2vw;
        }

        .font1{
            font-size:1vw;
        }
      
      .size8{
        width: 8%;
      }
      
      .size10{
        width: 10%;
      }
      
      .size5{
        width: 5%;
      }

        .yellow {
            background-color:#f6ff07;
        }

        .green {
            background-color:#00ff00;
        }

        .blue {
            background-color:#218eee;
        }

        .red {
            background-color:#f70415;
        }

        .gray {
            background-color:#b0c4b4;
        }

        .orange {
            background-color:#ff9900;
        }

        /*tr:nth-child(even) {
            background-color: #dddddd;
        }*/
    </style>



</head>


<body>
    <form id="form1" runat="server">
    
    <table  id="full-screen-me" style="overflow:hidden;height:100%;width:100%"  >
        <tbody>
            <tr class="font2">
                <th rowspan="1" colspan="2" class="green">APP-IN</th>
                <th rowspan="1" colspan="4" class="blue">VALID</th>
                <th rowspan="2" colspan="2" class="orange">BACKLOG</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" class="green">LAST MONTH</th>
                <th rowspan="1" class="green">THIS MONTH</th>
                <th rowspan="3" colspan="4" class="font8">56</th>
            </tr>
           <tr class="font5">
                <th rowspan="1" >96</th>
                <th rowspan="1" >21</th>
                <th rowspan="1" colspan="2" >23</th>
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
                <th rowspan="3" >67</th>
                <th rowspan="3" >11</th>
                <th rowspan="1" colspan="2" >121</th>
                <th rowspan="1" colspan="2" >65</th>
                <th rowspan="3" >33</th>
                <th rowspan="3" >18</th>
            </tr>
          
          <tr class="font2">
                <th rowspan="1" colspan="4" class="gray">GROSS YIELD</th>
            </tr>
          
          <tr class="font3">
                <th rowspan="1" colspan="4" >34,12%</th>
            </tr>
          
          
          
          
          <tr class="font2">
                <th rowspan="1" colspan="2" class="orange">Toyota</th>
                <th rowspan="1" colspan="2" class="orange">Daihatsu</th>
                <th rowspan="1" colspan="2" class="orange">Siap Dana</th>
                <th rowspan="1" colspan="2" class="orange">Others</th>
            </tr>
          
          <tr class="font2">
            <th rowspan="1" colspan="1" class="gray">GY</th>
            <th rowspan="1" colspan="1">13.25%</th>
            <th rowspan="1" colspan="1" class="gray">GY</th>
            <th rowspan="1" colspan="1">12.48%</th>
            <th rowspan="1" colspan="1" class="gray">GY</th>
            <th rowspan="1" colspan="1">15.65%</th>
            <th rowspan="1" colspan="1" class="gray">GY</th>
            <th rowspan="1" colspan="1">17.22%</th>
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
            <th rowspan="1" colspan="8" class="gray">TAF MONITORING BOARD - BANDUNG BRANCH</th>
         </tr>
          
          
          
        </tbody>
       
    </table>



    </form>
</body>
</html>


 <script type="text/javascript">
     setTimeout("location.href = 'DashboardSalesProcess.aspx'", 5000); // milliseconds, so 10 seconds = 10000ms
    </script>


<script type="text/javascript">
        function autoResizeDiv()
        {
            document.getElementById('full-screen-me').style.height = window.innerHeight +'px';
        }
        window.onresize = autoResizeDiv;
        autoResizeDiv();
    </script>
    

<%--<iframe id="full-screen-me" src="URL" style="overflow:hidden;height:100%;width:100%" ></iframe>--%>
