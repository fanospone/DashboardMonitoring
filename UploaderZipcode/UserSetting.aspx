<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UserSetting.aspx.cs" Inherits="UploaderZipcode.UserSetting" %>

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
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Edit" CommandName="NumClick" CommandArgument='<%# (string)Eval("USERNAME") %>' class="btn bg-grey btn-xs waves-effect" OnClick="Edit_Click">EDIT</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="USERNAME"
                                    HeaderText="Username" />
                                <asp:BoundField DataField="ROLE"
                                    HeaderText="Role" />
                                <asp:BoundField DataField="OFFICE_NAME"
                                    HeaderText="Branch Name" />
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
                "scrollX":true,
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
