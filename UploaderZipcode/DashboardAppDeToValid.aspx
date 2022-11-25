<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAppDeToValid.aspx.cs" Inherits="UploaderZipcode.DashboardAppDeToValid" %>

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



        #tb1 td, #tb1 th {
            border: 1px solid #000000;
            border-collapse: collapse;
            text-align: center;
        }

        #gvGrid2 th {
            border: 1px solid #FFFFFF;
            border-collapse: collapse;
            text-align: center;
        }

        #gvGrid2 td {
            border: 1px solid #FFFFFF;
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
            background-color: #0B1B2F;
        }

        .color2 {
            background-color: #376091;
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


<body>
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
                <th rowspan="1" colspan="1" class="size8" style="background-color: #808080">TOTAL APPL IN</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #A5A5A5">TOTAL APPL VALID</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL APPL ON PROCESS</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL RETURN HANDLING</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">TOTAL SURVEY PROCESS</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL CREDIT APPROVAL</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #A5A5A5">TOTAL OVERRIDE PROCESS</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #808080">TOTAL DEVIATION</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #595959">TOTAL RATE DECISION</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1"><span id="spanAppIn" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanAppValid" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanAppOnPc" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanRtHandling" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanSrvyPc" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanCA" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanOverride" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanDev" runat="server"></span></th>
                <th rowspan="1" colspan="1"><span id="spanRate" runat="server"></span></th>
            </tr>
        </tbody>
    </table>




    <form id="form1" runat="server" style="min-height: 80vh; max-height: 80vh; width: 99.9%;" class="color5">
        <asp:GridView runat="server" ID="gvGrid2" class="font1 fcwhite hapusrow" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>

                    <HeaderTemplate>

                        <tr style="height: 5vh" class="fcwhite">
                            <th></th>
                            <th rowspan="3" colspan="1" class="size10 color1">SO NAME</th>
                            <th rowspan="3" colspan="1" class="size5 color2">APPL IN</th>
                            <th rowspan="3" colspan="1" class="size5 color1">APPL VALID</th>
                            <th rowspan="3" colspan="1" class="size5 color3">APPL ON PROCESS</th>
                            <th rowspan="3" colspan="1" class="size5 color3">RETURN HANDLIN</th>

                            <th rowspan="1" colspan="8" class="color1">CAPACITY DECISION PROCESS</th>
                            <th rowspan="1" colspan="3" class="color1">RATE DECISION PROCESS</th>
                        </tr>

                        <tr style="height: 5vh" class="fcwhite">
                            <th></th>
                            <th rowspan="2" colspan="1" class="size5 color4">CDE</th>
                            <th rowspan="1" colspan="2" class="color1">SURVEY PROCESS</th>
                            <th rowspan="1" colspan="2" class="color1">CREDIT APPROVAL</th>
                            <th rowspan="2" colspan="1" class="color1">OVERRIDE PROCESS</th>
                            <th rowspan="1" colspan="2" class="color1">DEVIATION</th>
                            <th rowspan="2" colspan="1" class="size5 color4">BM</th>
                            <th rowspan="2" colspan="1" class="size5 color4">SAH</th>
                            <th rowspan="2" colspan="1" class="size5 color4">SDH</th>
                        </tr>

                        <tr style="height: 16vh" class="fcwhite">
                            <th></th>
                            <th rowspan="1" colspan="1" class="size5 color1">ASSIGN SURVEY</th>
                            <th rowspan="1" colspan="1" class="size5 color1">RESULT SURVEY</th>
                            <th rowspan="1" colspan="1" class="size10 color5">CREDIT ANALYST</th>
                            <th rowspan="1" colspan="1" class="size8 color5">BUCKET REJECT</th>
                            <%--    <th rowspan="1" colspan="1" class="size5 color2">SH</th>
                            <th rowspan="1" colspan="1" class="size5 color2">BH</th>
                            <th rowspan="1" colspan="1" class="size5 color2">SAH</th>--%>

                            <th rowspan="1" colspan="1" class="size5 color5">CAH</th>
                            <th rowspan="1" colspan="1" class="size5 color5">CDH</th>
                        </tr>
                    </HeaderTemplate>


                    <ItemTemplate>
                        <td class="color1" style="height: 4.1vh"><%# Eval("SO_NAME") %></td>
                        <td style="text-align: center;" class="color2"><%# Eval("APP_IN") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("APP_VALID") %></td>
                        <td style="text-align: center;" class="color3"><%# Eval("APP_ONPC") %></td>
                        <td style="text-align: center;" class="color3"><%# Eval("RETURN_HANDLING") %></td>
                        <td style="text-align: center;" class="color4"><%# Eval("CDE") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("ASSIGN_SURVEY") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("RESULT_SURVEY") %></td>
                        <td style="text-align: center;" class="color5"><%# Eval("CA_APV") %></td>
                        <td style="text-align: center;" class="color5"><%# Eval("CA_RJC") %></td>
                        <td style="text-align: center;" class="color1"><%# Eval("OVERRIDE_BUCKET") %></td>
                        <td style="text-align: center;" class="color5"><%# Eval("DEV_CHA") %></td>
                        <td style="text-align: center;" class="color5"><%# Eval("DEV_CDH") %></td>
                        <td style="text-align: center;" class="color2"><%# Eval("RATE_BH") %></td>
                        <td style="text-align: center;" class="color2"><%# Eval("RATE_SAH") %></td>
                        <td style="text-align: center;" class="color2"><%# Eval("RATE_SDH") %></td>
                    </ItemTemplate>

                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>


   <%-- <table id="tb2" style="height: 4vh; width: 100%" class="font1">
        <tbody>
            <tr style="height: 4vh">
                <th rowspan="1" colspan="19" style="background-color: #BFBFBF">TOYOTA ASTRA FINANCE</th>
            </tr>
        </tbody>
    </table>--%>

    <label id="spanSeqNo" runat="server" style="display: none"></label>
    <label id="spanAspx" runat="server" style="display: none"></label>
    <label id="spanQueryString" runat="server" style="display: none"></label>


</body>

</html>

<script type="text/javascript">

    var seqNo = document.getElementById("spanSeqNo").textContent;
    var Aspx = document.getElementById("spanAspx").textContent;
    var QueryString = document.getElementById("spanQueryString").textContent;

    setTimeout("location.href = '" + Aspx + ".aspx" + QueryString + "'", 60000); // milliseconds, so 10 seconds = 10000ms
</script>



<%--<script>






    var allTableCells = document.getElementsByTagName("td");

    for (var i = 0, max = allTableCells.length; i < max; i++) {
        var node = allTableCells[i];

        var currentText = node.childNodes[0].nodeValue;


        if (currentText === "0") {
            node.childNodes[0].nodeValue = null;
        }
    }

</script>--%>




<script>

    var allTableCells = document.getElementsByTagName("td");
    //var node = allTableCells[7];
    //var currentText = node.childNodes[0].nodeValue;

    for (var i = 0, max = allTableCells.length; i < max; i++) {
        var node = allTableCells[i];

        //get the text from the first child node - which should be a text node
        var currentText = node.childNodes[0].nodeValue;


        if (currentText === "0") {
            node.childNodes[0].nodeValue = null;
        }



    }

</script>
