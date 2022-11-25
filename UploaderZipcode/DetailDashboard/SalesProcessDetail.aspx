<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="SalesProcessDetail.aspx.cs" Inherits="UploaderZipcode.DetailDashboard.SalesProcessDetail" %>



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
                            <label class="form-label">Branch Office <span style="color: red">*</span></label>
                            <div class=" form-group">
                                <div class="form-line">
                                    <asp:ListBox ID="ddlOffice" runat="server" CssClass="form-control show-tick" data-size="7" data-live-search="true" Style="width: 100%;" required></asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Year <span style="color: red">*</span></label>
                            <div class=" form-group">
                                <div class="form-line">
                                    <asp:ListBox ID="ddlYear" runat="server" CssClass="form-control show-tick" data-size="7" data-live-search="true" Style="width: 100%;" required></asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div>
                            <label class="form-label">Month <span style="color: red">*</span></label>
                            <div class=" form-group">
                                <div class="form-line">
                                    <asp:ListBox ID="ddlMonth" runat="server" CssClass="form-control show-tick" data-size="7" data-live-search="true" Style="width: 100%;" required></asp:ListBox>
                                </div>
                            </div>
                        </div>


                        <asp:Button ID="btnSearch" CssClass="btn btn-success m-t-15 waves-effect" runat="server" OnClick="btnSearch_Click" Text="Search" />
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



        });
    </script>

    <script>
        $(function () {

            $('#datepicker1').datepicker({ format: 'yyyy/mm/dd', autoclose: true });
        });

    </script>
</asp:Content>

