<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ReportDashboard.aspx.cs" Inherits="UploaderZipcode.ReportDashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="block-header">
        <h2>PILIH DASHBOARD</h2>
    </div>
    <!-- Basic Examples -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <form runat="server">
                <div class="card">
                    <div class="body">

                        <div>
                            <label class="form-label">Tipe Dashboard<span style="color: red">*</span></label>
                            <div class="form-group">
                                <div class="form-line">
                                    <asp:DropDownList ID="dllDashboard" runat="server" class="form-control show-tick" Style="width: 100%;" required OnSelectedIndexChanged="dllDashboard_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="SALES PROSES" Value="DashboardSalesProcess"></asp:ListItem>
                                        <asp:ListItem Text="DATA ENTRY to VALID" Value="DashboardAppDeToValid"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Branch Office <span style="color: red">*</span></label>
                            <div class=" form-group">
                                <div class="form-line">
                                    <asp:ListBox ID="ddlGroup" runat="server" CssClass="form-control show-tick" data-size="7" data-live-search="true" Style="width: 100%;" required></asp:ListBox>
                                </div>
                            </div>
                        </div>


                        <div id="dtPicker" class="col-md-6" style="margin-bottom: 0px" runat="server">
                            <label class="form-label">Period From</label>
                            <div class="form-group">
                                <div class="input-group date" data-provide="datepicker" id="datepicker1">
                                    <input type="text" class="form-control" id="dt1" runat="server" autocomplete="off" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>





<%--                        <p><small><span style="color: red">*</span> Required</small></p>
                        <asp:LinkButton ID="btnCancel" runat="server" ToolTip="Cancel" class="btn btn-default  m-t-15 waves-effect" Style="margin-right: 10px;" OnClick="btnCancel_Click">CANCEL</asp:LinkButton>--%>


                        <asp:Button ID="btnSearch" CssClass="btn btn-success  m-t-15 waves-effect" runat="server" OnClick="btnSearch_Click" Text="Search"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(function () {
            $('#aspnetForm').validate({
                highlight: function (input) {
                    $(input).parents('.form-line').addClass('error');
                },
                unhighlight: function (input) {
                    $(input).parents('.form-line').removeClass('error');
                },
                errorPlacement: function (error, element) {
                    $(element).parents('.form-group').append(error);
                }
            });


        <%--    $("#ssd").on("click", function () {
                if ($('#aspnetForm').valid()) {
                    swal({
                        title: "Are you sure?",
                        text: "Data will be saved.",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, save!",
                        cancelButtonText: "Cancel",
                        closeOnConfirm: false
                    }, function (isConfirm) {
                        if (isConfirm) document.getElementById('<%= btnSave.ClientID %>').click();
                    });
                }
            });--%>


        });
    </script>

    <script>
        $(function () {

            $('#datepicker1').datepicker({ format: 'yyyy/mm/dd', autoclose: true });
        });

    </script>
</asp:Content>


