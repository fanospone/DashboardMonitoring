<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chart2.aspx.cs" Inherits="UploaderZipcode.Chart2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>


<body>
    <form id="form1" runat="server">
        <asp:Chart ID="Chart1" runat="server" Height="800px" Width="400px">
            <Titles>
                <asp:Title ShadowOffset="3" Name="Items" />
            </Titles>
            <Legends>
                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                    LegendStyle="Row" />
            </Legends>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
            </ChartAreas>
        </asp:Chart>
    </form>
</body>
</html>
