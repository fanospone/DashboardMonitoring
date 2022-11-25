<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardMonitoringCreditAnalyst.aspx.cs" Inherits="UploaderZipcode.DashboardMonitoringCreditAnalyst" %>

<link href="Styles/css/bootstrap.css" rel="stylesheet">


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DASHBOARD TAF</title>
    <script src="Styles/js/bootstrap-3.4.1.js"></script>
    <link rel="stylesheet" href="Dashboard1.css" />

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

        th {
            text-align: center;
        }

        #tb1 td, #tb1 th {
            border: 1px solid #000000;
            border-collapse: collapse;
            text-align: center;
        }

        #form1 td, #form1 th {
            border: 1px solid #000000;
            border-collapse: collapse;
            text-align: center;
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
            background-color: #1F497D;
        }

        .color3 {
            background-color: #376091;
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
    </style>
</head>

<body class="color5">
    <table id="tb1" style="height: 15vh" class="font1">
        <tbody>
            <tr class="grey">
                <th rowspan="4" colspan="1" class="size10" style="background-color: #FFFFFF">
                    <div style="text-align: left">
                        <img src="~/Styles/img/logo.png" runat="server" />
                    </div>
                    <div style="text-align: right"><span id="spanArea" runat="server"></span></div>
                    <div style="text-align: right; margin-bottom: 0px"><span id="spanUpd" runat="server"></span></div>
                </th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">ACHIEVEMENT MEET SLA</th>
               <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">APPL IN TOTAL</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY TOTAL</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">NEW - FLOW 2019 TOTAL</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">NEW - FLOW 2018 TOTAL (CLAIMED)</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">NEW - FLOW 2018 TOTAL (UNCLAIMED)</th>
            </tr>
            <tr class="font2">
                <th rowspan="3" colspan="1" style="background-color: #F2F2F2"><span id="Span1" runat="server">0 %</span></th>
                <th rowspan="3" colspan="1" style="background-color: #F2F2F2"><span id="sumIn" runat="server"></span></th>
                <th rowspan="3" colspan="1" style="background-color: #F2F2F2"><span id="sumProd" runat="server"></span></th>
                <th rowspan="3" colspan="1" style="background-color: #F2F2F2"><span id="sumNewDE" runat="server"></span></th>
                <th rowspan="3" colspan="1" style="background-color: #F2F2F2"><span id="sumCLAIMED" runat="server"></span></th>
                <th rowspan="3" colspan="1" style="background-color: #F2F2F2"><span id="sumUNCLAIM" runat="server"></span></th>
            </tr>
        </tbody>
    </table>

    <form runat="server">
        <div id="form1" style="min-height: 85vh; padding: 0px"  class="col-sm-9">
        <asp:GridView runat="server" ID="gvGrid2" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>

                    <HeaderTemplate>

                        <tr style="height: 4vh" class="fcwhite">
                            <th></th>
                            <th class="color1" rowspan="2" colspan="1" style="width: 15%">CA NAME</th>
                            <th class="color1" rowspan="2" colspan="1" style="width: 8%">ROLE DE</th>
                            <th class="color1" rowspan="2" colspan="1" style="width: 8%">APPL GOLIVE APPROVE</th>
                            <th class="color1" rowspan="2" colspan="1" style="width: 7%">MONTHLY PRODUCTIVITY</th>
                            <th class="color1" rowspan="2" colspan="1" style="width: 7%">DAILY PRODUCTIVITY</th>
                            <th class="color1" rowspan="1" colspan="3" style="width: 8%">FLOW 2019</th>
                            <th class="color1" rowspan="1" colspan="3" style="width: 8%">FLOW 2018 CLAIMED</th>
                        </tr>

                        <tr style="height: 4vh" class="fcwhite">
                            <th></th>
                            <th class="color5" rowspan="1" colspan="1" style="width: 7%">NEW</th>
                            <th class="color5" rowspan="1" colspan="1" style="width: 7%">REQ</th>
                            <th class="color5" rowspan="1" colspan="1" style="width: 7%">CPY</th>
                            <th class="color4" rowspan="1" colspan="1" style="width: 7%">NEW</th>
                            <th class="color4" rowspan="1" colspan="1" style="width: 7%">REQ</th>
                            <th class="color4" rowspan="1" colspan="1" style="width: 7%">CPY</th>
                        </tr>

                    </HeaderTemplate>


                    <ItemTemplate>
                        <td class="color1" style="height: 4.1vh"><%# Eval("CA_NAME") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("ROLE_DE") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("APPL_GLV_APPROVE") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("MONTHLY_PROD") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("DAILY_PROD") %></td>
                        <td style="text-align: center;" class="color5"><%# Eval("DE_NEW") %></td>
                        <td style="text-align: center;" class="color5"><%# Eval("DE_REQ") %></td>
                        <td style="text-align: center;" class="color5"><%# Eval("DE_CPY") %></td>
                        <td style="text-align: center;" class="color4"><%# Eval("REVIEW_NEW") %></td>
                        <td style="text-align: center;" class="color4"><%# Eval("REVIEW_REQ") %></td>
                        <td style="text-align: center;" class="color4"><%# Eval("REVIEW_CPY") %></td>
                    </ItemTemplate>


                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

     <div id="form2" style="height: 84vh; padding: 1px" class="col-sm-3">
            <asp:GridView runat="server" ID="gvGrid1" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>

                        <HeaderTemplate>
                            <tr style="height: 7vh" class="color1">
                                <th></th>
                                <th rowspan="1" colspan="4" style="width: 7%">FLOW 2018 UNCLAIMED</th>
                            </tr>
                            <tr style="height: 7vh" class="color1">
                                <th></th>
                                <th rowspan="1" colspan="1" style="width: 25%">OFFICE NAME</th>
                                <th rowspan="1" colspan="1" style="width: 8%">NEW</th>
                                <th rowspan="1" colspan="1" style="width: 8%">REQ</th>
                                <th rowspan="1" colspan="1" style="width: 8%">CPY</th>
                            </tr>


                        </HeaderTemplate>

                        <ItemTemplate>
                            <td style="height: 4.43vh" class="color2"><%# Eval("OFFICE_NAME") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("UNCLAIMED_NEW") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("UNCLAIMED_RETURN") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("UNCLAIMED_CC") %></td>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>


    </form>
   
    

     
    
     <label id="spanAspx" runat="server" style="display:none"></label>
     <label id="spanQueryString" runat="server" style="display:none"></label>
</body>
    
</html>



<script type="text/javascript">
    var Aspx = document.getElementById("spanAspx").textContent;
    var QueryString = document.getElementById("spanQueryString").textContent;

    setTimeout("location.href = '" + Aspx + ".aspx" + QueryString + "'", 60000); // milliseconds, so 10 seconds = 10000ms
</script>


<script>
    var allTableCells = document.getElementsByTagName("td");
    for (var i = 0, max = allTableCells.length; i < max; i++) {
        var node = allTableCells[i];

        var currentText = node.childNodes[0].nodeValue;

        if (currentText === "0") {
            node.childNodes[0].nodeValue = null;
        }
    }
</script>