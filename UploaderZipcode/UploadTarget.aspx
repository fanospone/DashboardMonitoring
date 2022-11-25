<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UploadTarget.aspx.cs" Inherits="UploaderZipcode.UploadTarget" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="block-header">
        <h2>UPLOAD TARGET</h2>
    </div>

    <!-- Basic Examples -->

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <form runat="server">
                <div class="card">
                    <div class="body">


                        <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                        <asp:FileUpload ID="fileupload" runat="server" />
                        <a id="tmpDownload" href="TemplateExcel/Template.xlsx" target="_blank" class="btn bg-orange btn-lg waves-effect right">Download Template</a>
                        <div></div>

                        <input type="button" id="ssd" class="btn btn-success m-t-15 waves-effect" title="Save" value="Upload" />
                        <asp:LinkButton ID="lnkBtn" runat="server" ToolTip="Upload" Style="display: none" OnClick="Upload_Click"> Upload</asp:LinkButton>

                        <br />
                        <div>
                            <br />
                        </div>
                        <asp:Label> LOG UPLOAD </asp:Label>
                        <asp:GridView runat="server" ID="gvGrid" class="table table-bordered table-hover text-nowrap" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false">
                            <Columns>

                                <asp:BoundField DataField="OFFICE_NAME"
                                    HeaderText="Branch" />
                                <asp:BoundField DataField="TAHUN"
                                    HeaderText="Tahun" />
                                <asp:BoundField DataField="BULAN"
                                    HeaderText="Bulan" />
                                <asp:BoundField DataField="TARGET"
                                    HeaderText="Target" />
                                <asp:BoundField DataField="DTM_CRT"
                                    HeaderText="Tanggal Upload" />
                                <asp:BoundField DataField="STATUS"
                                    HeaderText="Status" />

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </form>
        </div>
    </div>






</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                "order": false,
                "columnDefs": [{ "targets": 0, "orderable": false, "width": "2%" },
                     {
                         "targets": 5, "render": function (data, type, row, meta) {
                             if (data.trim() == 'Update Data Berhasil') {
                                 return '<span class="label bg-blue" style="font-size:13px;margin-right:3px">' + data.trim() + '</span>';
                             }
                             else if (data.trim() == 'Insert Data Berhasil') {
                                 return '<span class="label bg-green" style="font-size:13px;margin-right:3px">' + data.trim() + '</span>';
                             }
                             else
                                 return '<span class="label bg-red" style="font-size:13px;margin-right:3px">' + data.trim() + '</span>';
                         }
                     }
                ]
            });
        });

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
            $("#ssd").on("click", function () {
                if ($('#aspnetForm').valid()) {
                    swal({
                        title: "Are you sure?",
                        text: "Data will be Uploaded.",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, save!",
                        cancelButtonText: "Cancel",
                        closeOnConfirm: false
                    }, function (isConfirm) {
                        if (isConfirm) document.getElementById('<%= lnkBtn.ClientID %>').click();
                    });
                }

            });
        });

    </script>
</asp:Content>
