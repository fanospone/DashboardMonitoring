<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DashboardHome.aspx.cs" Inherits="UploaderZipcode.DashboardHome" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="block-header">
        <h2>TYPE DASHBOARD</h2>
    </div>

    <!-- Basic Examples -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <form runat="server">
                <div class="card">

                    <div class="col-sm-6 card">
                        <div class="header">
                            <asp:LinkButton ID="bntOne" Width="100%" runat="server" ToolTip="Create" class="btn bg-red btn-lg waves-effect" OnClick="bntOne_Click">HO - Credit 1</asp:LinkButton>
                        </div>
                        <div class="header">
                            <asp:LinkButton ID="btnTwo" Width="100%" runat="server" ToolTip="Create" class="btn bg-orange btn-lg waves-effect" OnClick="btnTwo_Click">HO - Credit 2</asp:LinkButton>
                        </div>
                        <div class="header">
                            <asp:LinkButton ID="btnThree" Width="100%" runat="server" ToolTip="Create" class="btn bg-yellow btn-lg waves-effect" OnClick="btnThree_Click">HO - Credit 3</asp:LinkButton>
                        </div>
                        <div class="header">
                            <asp:LinkButton ID="btnSeven" Width="100%" CommandName="5" runat="server" ToolTip="Create" class="btn bg-purple btn-lg waves-effect" OnClick="btnSeven_Click">BRANCH</asp:LinkButton>
                        </div>
                    </div>
                    <div class="col-sm-6 card">

                        <div class="header">
                            <asp:LinkButton ID="btnFour" Width="100%" runat="server" ToolTip="Create" class="btn bg-green btn-lg waves-effect" OnClick="btnFour_Click">HO - Credit 4</asp:LinkButton>
                        </div>
                        <div class="header">
                            <asp:LinkButton ID="btnFive" Width="100%" CommandName="5" runat="server" ToolTip="Create" class="btn bg-blue btn-lg waves-effect" OnClick="btnFive_Click">HO - Marketing 1</asp:LinkButton>
                        </div>
                        <div class="header">
                            <asp:LinkButton ID="btnSix" Width="100%" CommandName="5" runat="server" ToolTip="Create" class="btn bg-orange btn-lg waves-effect" OnClick="btnSix_Click">HO - Marketing 2</asp:LinkButton>
                        </div>
                         
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

</asp:Content>
