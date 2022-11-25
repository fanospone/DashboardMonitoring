<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardFieldSurveyInCity_View.aspx.cs" Inherits="UploaderZipcode.DashboardFieldSurveyInCity_View" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DASHBOARD TAF</title>
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



        #tb1 td, #tb1 th {
            border: 1px solid #000000;
            border-collapse: collapse;
            text-align: center;
        }

        #gvGrid2 td, #gvGrid2 th {
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
            font-size: 2vw;
        }

        .font1 {
            font-size: 0.7vw;
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
<body class="color2">


    <div>
        <table id="tb1" style="height: 13.5vh;" class="font1">
            <tbody>
                <tr class="grey">
                    <th rowspan="2" colspan="1" class="size8" style="background-color: #FFFFFF">
                        <div style="text-align: left">
                            <img src="~/Styles/img/logo.png" runat="server" />
                        </div>
                        <div style="text-align: right"><span id="spanArea" runat="server" style="font-size:1.5vw"></span></div>
                        <div style="text-align: right; margin-bottom: 0px"><span id="spanUpd" runat="server"></span></div>
                    </th>
                    <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">TOTAL TITIK IN INCITY</th>
                    <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL PRODUCTIVITY FIELD SURVEY</th>
                    <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">TOTAL NOT FIELD SURVEY</th>
                    <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL NOT SAMEDAY</th>
                </tr>
                <tr class="font2">
                    <th rowspan="1" colspan="1" style="background-color: #F2F2F2"><span id="SumInIncty" runat="server"></span></th>
                    <th rowspan="1" colspan="1" style="background-color: #F2F2F2"><span id="SumProdField" runat="server"></span></th>
                    <th rowspan="1" colspan="1" style="background-color: #F2F2F2"><span id="SumNotField" runat="server"></span></th>
                    <th rowspan="1" colspan="1" style="background-color: #F2F2F2"><span id="SumNotSameDay" runat="server"></span></th>
                </tr>
            </tbody>
        </table>


        <form id="form1" runat="server" style="height: 86.5vh; width: 99.9%">
            <asp:GridView runat="server" ID="gvGrid2" class="font1 hapusrow color2 fcwhite" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>

                        <HeaderTemplate>
                            <tr style="height: 3vh" class="font1" runat="server">
                                <th></th>
                                <th rowspan="3" colspan="1" style="width: 6%">DATE ASSIGN BM</th>
                                <th rowspan="3" colspan="1" style="width: 5%">TITIK IN [INCITY]</th>
                                <th rowspan="3" colspan="1" style="width: 5%">ASSIGN <= 14.00 PM</th>
                                <th rowspan="3" colspan="1" style="width: 5%">ASSIGN > 14.00 PM</th>
                                <th rowspan="3" colspan="1" style="width: 5%">NOT FIELD SURVEY</th>
                                <th rowspan="3" colspan="1" style="width: 5%">NOT SAME DAY <= 14.00 PM</th>
                                <th rowspan="1" colspan="31" style="width: 62%">DATE SURVEY</th>
                            </tr>

                            <tr style="height: 3vh" class="font1">
                                <th></th>
                                <th rowspan="1" colspan="31">-- - --</th>
                            </tr>

                            <tr style="height: 3vh" class="font1">
                                <th></th>
                                <th rowspan="1" colspan="1" style="width: 2%">1</th>
                                <th rowspan="1" colspan="1" style="width: 2%">2</th>
                                <th rowspan="1" colspan="1" style="width: 2%">3</th>
                                <th rowspan="1" colspan="1" style="width: 2%">4</th>
                                <th rowspan="1" colspan="1" style="width: 2%">5</th>
                                <th rowspan="1" colspan="1" style="width: 2%">6</th>
                                <th rowspan="1" colspan="1" style="width: 2%">7</th>
                                <th rowspan="1" colspan="1" style="width: 2%">8</th>
                                <th rowspan="1" colspan="1" style="width: 2%">9</th>
                                <th rowspan="1" colspan="1" style="width: 2%">10</th>

                                <th rowspan="1" colspan="1" style="width: 2%">11</th>
                                <th rowspan="1" colspan="1" style="width: 2%">12</th>
                                <th rowspan="1" colspan="1" style="width: 2%">13</th>
                                <th rowspan="1" colspan="1" style="width: 2%">14</th>
                                <th rowspan="1" colspan="1" style="width: 2%">15</th>
                                <th rowspan="1" colspan="1" style="width: 2%">16</th>
                                <th rowspan="1" colspan="1" style="width: 2%">17</th>
                                <th rowspan="1" colspan="1" style="width: 2%">18</th>
                                <th rowspan="1" colspan="1" style="width: 2%">19</th>
                                <th rowspan="1" colspan="1" style="width: 2%">20</th>

                                <th rowspan="1" colspan="1" style="width: 2%">21</th>
                                <th rowspan="1" colspan="1" style="width: 2%">22</th>
                                <th rowspan="1" colspan="1" style="width: 2%">23</th>
                                <th rowspan="1" colspan="1" style="width: 2%">24</th>
                                <th rowspan="1" colspan="1" style="width: 2%">25</th>
                                <th rowspan="1" colspan="1" style="width: 2%">26</th>
                                <th rowspan="1" colspan="1" style="width: 2%">27</th>
                                <th rowspan="1" colspan="1" style="width: 2%">28</th>
                                <th rowspan="1" colspan="1" style="width: 2%">29</th>
                                <th rowspan="1" colspan="1" style="width: 2%">30</th>

                                <th rowspan="1" colspan="1" style="width: 2%">31</th>
                            </tr>

                        </HeaderTemplate>

                        <ItemTemplate>
                            <td style="text-align: center; height: 2.20vh" class="color2"><%# Eval("ASSIGN_DT") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("TITIK_IN") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("BEFORE14") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("AFTER14") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("NOT_FIELD_SURVEY") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("NOT_SAME_DAY") %></td>

                            <td style="text-align: center" class="color2"><%# Eval("DAY_1") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_2") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_3") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_4") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_5") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_6") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_7") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_8") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_9") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_10") %></td>

                            <td style="text-align: center" class="color2"><%# Eval("DAY_11") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_12") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_13") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_14") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_15") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_16") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_17") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_18") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_19") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_20") %></td>

                            <td style="text-align: center" class="color2"><%# Eval("DAY_21") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_22") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_23") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_24") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_25") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_26") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_27") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_28") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_29") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAY_30") %></td>

                            <td style="text-align: center" class="color2"><%# Eval("DAY_31") %></td>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
    </div>

</body>
</html>




<script>

    var allTableCells = document.getElementsByTagName("td");
    //var node = allTableCells[7];
    //var currentText = node.childNodes[0].nodeValue;

    for (var i = 0, max = allTableCells.length; i < max; i++) {
        var node = allTableCells[i];

        //get the text from the first child node - which should be a text node
        var currentText = node.childNodes[0].nodeValue;


        //if (currentText > 0 && i == 7) {
        //    node.style.backgroundColor = "#0F253F";
        //}

        var baris = Math.floor(i / 38);

        if ((i % 38) > (6 + baris)) {
            node.style.backgroundColor = "#0F253F";
        }

        if ((i % 38) == 3 || (i % 38) == 4) {
            node.style.backgroundColor = "#4F81BD";
        }

        if ((i % 38) == 5) {
            node.style.backgroundColor = "#376091";
        }


        if ((i % 38) == 1) {
            node.style.backgroundColor = "#0F253F";
        }

        if (currentText === "-") {
            node.childNodes[0].nodeValue = null;
        }

        //if ((i % 38) == (7 + baris)) {
        //    node.style.backgroundColor = "#0F253F";
        //}


    }

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