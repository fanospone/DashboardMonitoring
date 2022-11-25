<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseMasterTele.aspx.cs" Inherits="UploaderZipcode.BaseMasterTele" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:GridView runat="server" ID="gvGrid" class="table table-bordered table-hover text-nowrap" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false">
                            <columns>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <%--<asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Edit" CommandName="NumClick" CommandArgument='<%# (string)Eval("USERNAME") %>' class="btn bg-grey btn-xs waves-effect" OnClick="Edit_Click">EDIT</asp:LinkButton>--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ID"
                                    HeaderText="ID" />
                                <asp:BoundField DataField="NAME"
                                    HeaderText="NAME" />
                                <asp:BoundField DataField="BUCKET"
                                    HeaderText="BUCKET" />
                                <asp:BoundField DataField="TIME_TO_BUCKET"
                                    HeaderText="TIME TO BUCKET" />
                                <asp:BoundField DataField="MONTHLY_PROD"
                                    HeaderText="MONTHLY PROD" />
                                <asp:BoundField DataField="DAILY_PROD"
                                    HeaderText="DAILY PROD" />
                                <asp:BoundField DataField="STATUS"
                                    HeaderText="STATUS" />
                                <asp:BoundField DataField="APP_NEW"
                                    HeaderText="APP NEW" />
                                 <asp:BoundField DataField="APP_REQ"
                                    HeaderText="APP REQ" />
                                 <asp:BoundField DataField="APP_BY_BRANCH"
                                    HeaderText="APP BY BRANCH" />

                            </columns>
                        </asp:GridView>
    </form>


   
</body>
</html>
