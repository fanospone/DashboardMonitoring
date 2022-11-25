<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardCDE.aspx.cs" Inherits="UploaderZipcode.DashboardCDE" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard Data Entry</title>
    <link href="Styles/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/css/font.css" rel="stylesheet" type="text/css" />
    <link href="Styles/css/font2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 98%; margin-left: 10px; margin-top: 10px">
                <tr style="background-color: lightgray;">
                    <td colspan="13" style="border-start-start-radius: 8px; border-end-start-radius: 8px"><span style="font-weight: bold; font-size: 32px; margin-left: 5px">Dashboard Data Entry  </span>
                        <asp:DropDownList runat="server" ID="ddlCategory" Style="margin-left: 20px; background-color: antiquewhite; color: black; font-weight: bold" ClientIDMode="AutoID" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="National" Value="HO" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 1" Value="a001" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 2" Value="a002" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 3" Value="a003" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 4" Value="a004" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Area 5" Value="a005" style="color: black; font-weight: bold"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList runat="server" ID="dllTgl" Style="background-color: antiquewhite; color: black; font-weight: bold" ClientIDMode="AutoID" OnSelectedIndexChanged="dllTgl_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="MTD" Value="MTD" style="color: black; font-weight: bold"></asp:ListItem>
                            <asp:ListItem Text="Today" Value="TODAY" style="color: black; font-weight: bold"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: right; border-start-end-radius: 8px; border-end-end-radius: 8px">
                        <asp:Label runat="server" ID="txtTgl" Style="margin-right: 10px; font-size: 15px; font-weight: bold">dtm</asp:Label></td>
                </tr>
            </table>
            <table style="width: 100%; border-collapse: separate; border-spacing: 15px">
                <tr style="border-spacing: 3px; margin-top: 10px">
                    <td style="border-radius: 10px; background-color: lightgray; width: 12%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 10px;">Prospect</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-12" style="text-align: center">
                                <span>
                                    <asp:Label ID="prospectSubmit" runat="server" Style="font-size: 20px; font-weight: bold" Text="0"></asp:Label></span>
                            </div>
                            <div class="col-sm-12" style="text-align: center"><span>Submit</span></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="prospectWFD" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="prospectSIM" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label1" Text="WFD"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label2" Text="SIM"></asp:Label></span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: lightgray; width: 30%; vertical-align: top" colspan="3">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 5px">Matching</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="matchingSubCDE" Text="0" Style="font-size: 20px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="matchingSubSO" Text="0" Style="font-size: 20px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center"><span>Submit-CDE</span></div>
                            <div class="col-sm-6" style="text-align: center"><span>Submit-SO</span></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="matchingPenCDE" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="matchingNotClaim" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="matchingPenSO" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label7" Text="Pending CDE"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label8" Text="Not Claim"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label9" Text="Pending SO"></asp:Label></span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: lightgray; vertical-align: top; width: 58%" colspan="9">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 5px">Matching Performance</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span runat="server" style="color: lightgray; font-weight: bold; font-size: 18px"><15</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px"><15</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px"><30</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px"><60</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px"><90</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px"><120</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px"><150</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px"><180</span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span runat="server" style="color: black; font-weight: bold; font-size: 18px">Total</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: -12px">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span style="color: black; font-size: 18px">CDE</span>
                            </div>
                            <div runat="server" id="mpCde15Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: yellow">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCde15"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpCde30Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCde30" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpCde60Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCde60" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpCde90Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCde90" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpCde120Back" class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCde120" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpCde150Back" class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCde150" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpCde180Back" class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCde180" Text="0%"></asp:Label></span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpCdeTotal" Text="0"></asp:Label></span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: -12px">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span style="color: black; font-size: 18px">SO</span>
                            </div>
                            <div runat="server" id="mpSo15Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSo15" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpSo30Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSo30" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpSo60Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSo60" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpSo90Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSo90" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpSo120Back" class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSo120" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpSo150Back" class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSo150" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="mpSo180Back" class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSo180" Text="0%"></asp:Label></span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="mpSoTotal" Text="0"></asp:Label></span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <table style="width: 100%; border-collapse: separate; border-spacing: 15px">
                <tr style="border-spacing: 3px; margin-top: 10px">
                    <td style="border-radius: 10px; background-color: lightgray; width: 12%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 10px;">Login</span>
                            </div>
                        </div>
                        <div class="row"></div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label ID="loginCDE" runat="server" Style="font-size: 20px; font-weight: bold" Text="0"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label ID="loginSO" runat="server" Style="font-size: 20px; font-weight: bold" Text="0"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center"><span>CDE</span></div>
                            <div class="col-sm-6" style="text-align: center"><span>SO</span></div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: lightgray; width: 30%; vertical-align: top" colspan="3">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 5px">Completion</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="complSubCDE" Text="0" Style="font-size: 20px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="complSubSO" Text="0" Style="font-size: 20px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center"><span>Submit-CDE</span></div>
                            <div class="col-sm-6" style="text-align: center"><span>Submit-SO</span></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="complPenCDE" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="complNotClaim" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="complPenSO" Text="0" Style="font-size: 12px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label34" Text="Pending CDE"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label35" Text="Not Claim"></asp:Label></span>
                            </div>
                            <div class="col-sm-4" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="Label36" Text="Pending SO"></asp:Label></span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: lightgray; vertical-align: top; width: 58%" colspan="9">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 5px">Completion Performance</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span style="color: lightgray; font-weight: bold; font-size: 18px"><15</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><30</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><60</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><90</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><120</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><150</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><180</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><240</span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px">Total</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: -12px">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span style="color: black; font-size: 18px">CDE</span>
                            </div>
                            <div runat="server" id="cpCde30Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCde30" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpCde60Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCde60" Text="0%"></asp:Label></span>
                            </div>
                            <di runat="server" id="cpCde90Back" v class="col-sm-1 table-bordered" style="border-color: black; background-color: yellow">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCde90" Text="0%"></asp:Label></span>
                            </di>
                            <div runat="server" id="cpCde120Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: yellow">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCde120" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpCde150Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCde150" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpCde180Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCde180" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpCde240Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCde240" Text="0%"></asp:Label></span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpCdeTotal" Text="0"></asp:Label></span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: -12px">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span style="color: black; font-size: 18px">SO</span>
                            </div>
                            <div runat="server" id="cpSo30Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSo30" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpSo60Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSo60" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpSo90Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSo90" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpSo120Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSo120" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpSo150Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSo150" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpSo180Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSo180" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="cpSo240Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: green">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSo240" Text="0%"></asp:Label></span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="cpSoTotal" Text="0"></asp:Label></span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <table style="width: 100%; border-collapse: separate; border-spacing: 15px">
                <tr style="border-spacing: 3px; margin-top: 10px">
                    <td style="border-radius: 10px; background-color: lightgray; width: 24%; vertical-align: top" colspan="3">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 5px">Ach last month</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="achCDE15" Text="0%" Style="font-size: 20px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="achCDE90" Text="0%" Style="font-size: 20px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center"><span>CDE Matching <15</span></div>
                            <div class="col-sm-6" style="text-align: center"><span>CDE Completion <90</span></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="achNAP90" Text="0%" Style="font-size: 20px; font-weight: bold"></asp:Label></span>
                            </div>
                            <div class="col-sm-12" style="text-align: center">
                                <span>NAP Data Entry <90</span>
                            </div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: lightgray; width: 18%; vertical-align: top" colspan="2">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 10px;">NAP Data Entry</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="text-align: center">
                                <asp:Label runat="server" ID="napSubmit" Style="font-size: 20px; font-weight: bold" Text="0"></asp:Label>
                            </div>
                            <div class="col-sm-12" style="text-align: center">
                                <span>Submit</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px">
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="napPending" Style="font-size: 20px; font-weight: bold" Text="0"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center">
                                <span>
                                    <asp:Label runat="server" ID="napNotClaim" Style="font-size: 20px; font-weight: bold" Text="0"></asp:Label></span>
                            </div>
                            <div class="col-sm-6" style="text-align: center"><span>Pending</span></div>
                            <div class="col-sm-6" style="text-align: center"><span>Not Claim</span></div>
                        </div>
                    </td>
                    <td style="border-radius: 10px; background-color: lightgray; vertical-align: top; width: 58%" colspan="9">
                        <div class="row">
                            <div class="col-sm-12">
                                <span style="font-weight: bold; margin-left: 5px">NAP Data Entry Performance</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span style="color: lightgray; font-weight: bold; font-size: 18px"><15</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><30</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><60</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><90</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><120</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><150</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><180</span>
                            </div>
                            <div class="col-sm-1 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px"><240</span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span style="color: black; font-weight: bold; font-size: 18px">Total</span>
                            </div>
                        </div>
                        <div class="row" style="margin-top: -12px">
                            <div class="col-sm-1 table-bordered" style="margin-left: 22px; border-color: black">
                                <span style="color: black; font-size: 18px">SO</span>
                            </div>
                            <div runat="server" id="napSo30Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSo30" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="napSo60Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSo60" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="napSo90Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSo90" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="napSo120Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSo120" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="napSo150Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSo150" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="napSo180Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: lightcoral">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSo180" Text="0%"></asp:Label></span>
                            </div>
                            <div runat="server" id="napSo240Back" class="col-sm-1 table-bordered" style="border-color: black; background-color: yellow">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSo240" Text="0%"></asp:Label></span>
                            </div>
                            <div class="col-sm-2 table-bordered" style="border-color: black">
                                <span style="color: black; font-size: 18px">
                                    <asp:Label runat="server" ID="napSoTotal" Text="0"></asp:Label></span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>

          



        </div>
    </form>
</body>
</html>