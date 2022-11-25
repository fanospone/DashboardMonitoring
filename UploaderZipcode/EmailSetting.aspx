<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="EmailSetting.aspx.cs" Inherits="UploaderZipcode.EmailSetting" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="block-header">
        <h2>LIST OF USERS </h2>
    </div>
    <!-- Basic Examples -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <form runat="server">
                <div class="card">
                    <div class="header">
                        <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Create" class="btn bg-orange btn-lg waves-effect" OnClick="Create_Click">CREATE</asp:LinkButton>
                    </div>
                    <div class="body">
                        <asp:GridView runat="server" ID="gvGrid" class="table table-bordered table-hover text-nowrap" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false">
                            <columns>
                                <asp:BoundField DataField="EMAIL_SETTING_ID"
                                    HeaderText="EMAIL ID" />
                                <asp:BoundField DataField="EMAIL_MASTER_NAME"
                                    HeaderText="NAMA DASHBOARD" />
                                <asp:BoundField DataField="EMAIL_RECIPIENT"
                                    HeaderText="EMAIL RECIPIENT" />
                                <asp:BoundField DataField="EMAIL_PIC"
                                    HeaderText="EMAIL PIC" />
                                <asp:BoundField DataField="IS_ACTIVE"
                                    HeaderText="Is Active" />
                                <asp:BoundField DataField="DTM_CRT"
                                    HeaderText="Create Date" />
                                <asp:BoundField DataField="USR_CRT"
                                    HeaderText="User Create" />
                                <asp:BoundField DataField="DTM_UPD"
                                    HeaderText="Update Date" />
                                <asp:BoundField DataField="USR_UPD"
                                    HeaderText="User Update" />
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnEdit" runat="server" ToolTip="Edit" CommandName="NumClick" CommandArgument='<%# (Int64)Eval("EMAIL_SETTING_ID") %>' class="btn bg-grey btn-xs waves-effect" OnClick="btnEdit_Click">EDIT</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" runat="server" ToolTip="Delete" CommandName="NumClick" CommandArgument='<%# (Int64)Eval("EMAIL_SETTING_ID") %>' class="btn bg-grey btn-xs waves-effect" OnClick="btnDelete_Click">DELETE</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                            </columns>
                        </asp:GridView>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(function () {
            var table = $('.table');
            table.dataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "info": true,
                "autoWidth": false,
                "scrollX": true,
                "order": [[4, "desc"]],
                "columnDefs": [{ "targets": 0, "orderable": false, "width": "2%" },
                { "type": "date-id", "targets": 4, "width": "15%" },
                { "type": "date-id", "targets": 5, "width": "15%" }]
            });
        });
    </script>

   <%-- <script type="text/javascript">
        setTimeout("location.href = 'UserSetting2.aspx'", 5000); // milliseconds, so 10 seconds = 10000ms
    </script>--%>
</asp:Content>
