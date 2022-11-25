<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAppBmAndTeleSvy_View.aspx.cs" Inherits="UploaderZipcode.DashboardAppBmAndTeleSvy_View" %>

<link href="Styles/css/bootstrap.css" rel="stylesheet">


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>DASHBOARD TAF</title>


    <style>
        body {
            margin: 0;
            width: 100%;
            /*height: 100vh;*/
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        th  {
            text-align: center;

        }

        #tb1 td, #tb1 th {
            border: 0px none #000000;
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
    <table id="tb1" style="height: 16vh" class="font1">
        <tbody>
            <tr class="grey">
                <th rowspan="2" colspan="1" class="size10" style="background-color: #FFFFFF">
                    <div style="text-align: left">
                        <img src="~/Styles/img/logo.png" runat="server" />
                    </div>
                    <div style="text-align: right"><span id="spanArea" runat="server"></span></div>
                    <div style="text-align: right; margin-bottom: 0px"><span id="spanUpd" runat="server"></span></div>
                </th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL APPL ASSIGN</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY ASSIGN</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">TOTAL APPL ASSIGN UNCLAIM</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL TELE</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">PRODUCTIVITY TELE</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #F2F2F2">NEW TELE SAME DAY</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #EEECE1">NEW TELE PENDING</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" style="background-color: #BFBFBF"><span id="sumAsgn" runat="server"></span></th>
                <th rowspan="1" colspan="1" style="background-color: #D8D8D8"><span id="sumProd" runat="server"></span></th>
                <th rowspan="1" colspan="1" style="background-color: #F2F2F2"><span id="sumAsgnUnc" runat="server"></span></th>
                <th rowspan="1" colspan="1" style="background-color: #BFBFBF"><span id="sumTotTele" runat="server"></span></th>
                <th rowspan="1" colspan="1" style="background-color: #D8D8D8"><span id="sumProdTele" runat="server"></span></th>
                <th rowspan="1" colspan="1" style="background-color: #F2F2F2"><span id="sumTeleSame" runat="server"></span></th>
                <th rowspan="1" colspan="1" style="background-color: #EEECE1"><span id="sumTelePend" runat="server"></span></th>
            </tr>



        </tbody>

    </table>

    <form runat="server">
        <div id="form1" style="height: 84vh;padding:0px" class="col-sm-9">
            <asp:GridView runat="server" ID="gvGrid2" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>

                        <HeaderTemplate>
                            <tr style="height: 7vh" class="color1">
                                <th></th>
                                <th rowspan="2" colspan="1" style="width: 25%">BM & TELE NAME</th>
                                <th rowspan="2" colspan="1" style="width: 8%">BUCKET</th>
                                <th rowspan="2" colspan="1" style="width: 8%">TIME TO BUCKET (AVERAGE)</th>
                                <th rowspan="2" colspan="1" style="width: 7%">MONTHLY PRODUCTIVITY</th>
                                <th rowspan="2" colspan="1" style="width: 7%">DAILY PRODUCTIVITY</th>
                                <th rowspan="1" colspan="2" style="width: 14%">APPLICATION CLAIMED</th>
                            </tr>

                            <tr style="height: 7vh" class="color1">
                                <th></th>
                                <th rowspan="1" colspan="1" style="width: 7%">NEW</th>
                                <th rowspan="1" colspan="1" style="width: 7%">REQ</th>
                            </tr>


                        </HeaderTemplate>

                        <ItemTemplate>
                            <td style="height: 4.43vh" class="color2"><%# Eval("SURVEYOR_NAME") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("BUCKET") %></td>
                            <td style="text-align: center" class="color3"><%# Eval("AVERAGE_TIME_TO_BUCKET") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("MONTHYLY_PRODUCTIVITY") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("DAILY_PRODUCTIVITY") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("NEW") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("RETURN_HANDLING") %></td>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>



        <div id="form2" style="height: 84vh;padding:1px" class="col-sm-3">
            <asp:GridView runat="server" ID="gvGrid1" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>

                        <HeaderTemplate>
                            <tr style="height: 7vh" class="color1">
                                <th></th>
                                <th rowspan="1" colspan="3" style="width: 7%">APPLICATION ASSIGN UNCLAIMED</th>
                            </tr>
                            <tr style="height: 7vh" class="color1">
                                <th></th>
                                <th rowspan="1" colspan="1" style="width: 25%">OFFICE NAME</th>
                                <th rowspan="1" colspan="1" style="width: 8%">NEW</th>
                                <th rowspan="1" colspan="1" style="width: 8%">REQ</th>
                            </tr>


                        </HeaderTemplate>

                        <ItemTemplate>
                            <td style="height: 4.43vh" class="color2"><%# Eval("OFFICE_NAME") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("NEW_APP") %></td>
                            <td style="text-align: center" class="color2"><%# Eval("RETURN_HANDLING") %></td>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>



    <label id="spanSeqNo" runat="server" style="display: none"></label>

</body>
</html>




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