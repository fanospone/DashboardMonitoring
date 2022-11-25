<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardFieldSurvey.aspx.cs" Inherits="UploaderZipcode.DashboardFieldSurvey" %>

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


        #tb2 td, #tb2 th {
            border: 1px solid #000000;
            border-collapse: collapse;
            text-align: center;
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
<body>
    <table id="tb1" style="height: 15vh" class="font1">
        <tbody>
            <tr class="grey">
                <th rowspan="2" colspan="1" class="size8" style="background-color: #BFBFBF">TAF</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">TOTAL TITIK IN INCITY</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL PRODUCTIVITY FIELD SURVEY</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #D8D8D8">TOTAL NOT FIELD SURVEY</th>
                <th rowspan="1" colspan="1" class="size8" style="background-color: #BFBFBF">TOTAL NOT SAMEDAY</th>
            </tr>
            <tr class="font2">
                <th rowspan="1" colspan="1" style="background-color: #F2F2F2">6611</th>
                <th rowspan="1" colspan="1" style="background-color: #F2F2F2">6542</th>
                <th rowspan="1" colspan="1" style="background-color: #F2F2F2">69</th>
                <th rowspan="1" colspan="1" style="background-color: #F2F2F2">2657</th>
            </tr>
        </tbody>

    </table>


    <table id="tb2" style="height: 8vh; width: 100%" class="font1">
        <tbody class="fcwhite color1">
            <tr style="height: 4vh">
                <th rowspan="3" colspan="1" style="width: 10%">DATE ASSIGN BM</th>
                <th rowspan="3" colspan="1" style="width: 5%">TITIK IN [INCITY]</th>
                <th rowspan="3" colspan="1" style="width: 5%">ASSIGN =14.00 PM </th>
                <th rowspan="3" colspan="1" style="width: 5%">ASSIGN >14.00 PM</th>
                <th rowspan="3" colspan="1" style="width: 5%">NOT FIELD SURVEY</th>
                <th rowspan="3" colspan="1" style="width: 7%">NOT SAME DAY =14.00 PM</th>
                <th rowspan="1" colspan="31" style="width: 63%">DATE SURVEY</th>

            </tr>

            <tr style="height: 4vh">
                <th rowspan="1" colspan="31">JUN - 19</th>
            </tr>

            <tr style="height: 4vh">
                <th rowspan="1" colspan="1">1</th>
                <th rowspan="1" colspan="1">2</th>
                <th rowspan="1" colspan="1">3</th>
                <th rowspan="1" colspan="1">4</th>
                <th rowspan="1" colspan="1">5</th>
                <th rowspan="1" colspan="1">6</th>
                <th rowspan="1" colspan="1">7</th>
                <th rowspan="1" colspan="1">8</th>
                <th rowspan="1" colspan="1">9</th>
                <th rowspan="1" colspan="1">10</th>


                <th rowspan="1" colspan="1">11</th>
                <th rowspan="1" colspan="1">12</th>
                <th rowspan="1" colspan="1">13</th>
                <th rowspan="1" colspan="1">14</th>
                <th rowspan="1" colspan="1">15</th>
                <th rowspan="1" colspan="1">16</th>
                <th rowspan="1" colspan="1">17</th>
                <th rowspan="1" colspan="1">18</th>
                <th rowspan="1" colspan="1">19</th>
                <th rowspan="1" colspan="1">20</th>


                <th rowspan="1" colspan="1">21</th>
                <th rowspan="1" colspan="1">22</th>
                <th rowspan="1" colspan="1">23</th>
                <th rowspan="1" colspan="1">24</th>
                <th rowspan="1" colspan="1">25</th>
                <th rowspan="1" colspan="1">26</th>
                <th rowspan="1" colspan="1">27</th>
                <th rowspan="1" colspan="1">28</th>
                <th rowspan="1" colspan="1">29</th>
                <th rowspan="1" colspan="1">30</th>

                <th rowspan="1" colspan="1">31</th>
            </tr>
        </tbody>

    </table>

    <form id="form1" runat="server" style="height: 70vh; width: 75%">
        <asp:GridView runat="server" ID="gvGrid" class="font1 fcwhite color2" ShowHeader="False" AutoGenerateColumns="false">
            <Columns>

                <asp:BoundField DataField="NAME"
                    ItemStyle-Width="15%" />
                <asp:BoundField DataField="BUCKET"
                    ItemStyle-Width="8%" />
                <asp:BoundField DataField="TIME_TO_BUCKET"
                    ItemStyle-Width="8%" />
                <asp:BoundField DataField="MONTHLY_PROD"
                    ItemStyle-Width="7%" />
                <asp:BoundField DataField="DAILY_PROD"
                    ItemStyle-Width="7%" />
                <asp:BoundField DataField="STATUS"
                    ItemStyle-Width="8%" />
                <asp:BoundField DataField="APP_NEW"
                    ItemStyle-Width="7%" />
                <asp:BoundField DataField="APP_REQ"
                    ItemStyle-Width="7%" />
                <asp:BoundField DataField="APP_BY_BRANCH"
                    ItemStyle-Width="8%" />

            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
