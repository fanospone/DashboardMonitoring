<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DetailMonitoringCreditAnalyst.aspx.cs" Inherits="UploaderZipcode.DetailMonitoringCreditAnalyst" %>



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
                            <label class="form-label">Area<span style="color: red">*</span></label>
                            <div class=" form-group">
                                <div class="form-line">
                                    <asp:DropDownList ID="ddlArea" runat="server" class="form-control show-tick" Style="width: 100%;" required>
                                        <asp:ListItem Text="1" Value="50"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="52"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="54"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                         <div class="col-md-6" style="margin-bottom: 0px">
                                <label class="form-label">Date</label>
                                <div class="form-group">
                                    <div class="input-group date" data-provide="datepicker" id="datepicker1">
                                        <input type="text" class="form-control" id="dt1" runat="server" autocomplete="off" />
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
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
            $('#datepicker2').datepicker({ format: 'yyyy/mm/dd', autoclose: true });

        });

    </script>
</asp:Content>

