<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="EmailCreate.aspx.cs" Inherits="UploaderZipcode.EmailCreate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="block-header">
        <h2>CREATE/EDIT EMAIL DASHBOARD
                </h2>
    </div>
    <!-- Basic Examples -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <form runat="server">
                <div class="card">
                    <div class="body">


                        <label class="form-label">Nama Dashboard <span style="color: red">*</span></label>
                        <div class="form-group">
                            <div class="form-line">
                                <asp:ListBox ID="ddlGroup" runat="server" CssClass="form-control show-tick" data-size="7" data-live-search="true" Style="width: 100%;" required></asp:ListBox>
                            </div>
                        </div>


                        <label for="txtEmailRecipient">EMail Recipient <span style="color: red">*</span></label>
                        <div class="form-group">
                            <div class="form-line">
                                <asp:TextBox ID="txtEmailRecipient" runat="server" class="form-control" placeholder="Enter Email Recipient" required></asp:TextBox>
                            </div>
                        </div>

                        <label for="txtEmailPIC">EMail PIC <span style="color: red">*</span></label>
                        <div class="form-group">
                            <div class="form-line">
                                <asp:TextBox ID="txtEmailPIC" runat="server" class="form-control" placeholder="Enter Email PIC" required></asp:TextBox>
                            </div>
                        </div>

                        <label class="form-label">Is Active <span style="color: red">*</span></label>
                        <div class="form-group">
                            <div class="form-line">
                                <asp:DropDownList ID="ddlStatus" runat="server" class="form-control show-tick" Style="width: 100%;" required>
                                    <asp:ListItem Text="YES" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="NO" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        

                        <p><small><span style="color: red">*</span> Required</small></p>
                        <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Cancel" class="btn btn-default  m-t-15 waves-effect" Style="margin-right: 10px;" OnClick="Cancel_Click">CANCEL</asp:LinkButton>
                        <input type="button" id="ssd" class="btn btn-success m-t-15 waves-effect" title="Save" value="SAVE" />
                        <asp:Button ID="btnSave" runat="server" OnClick="Save_Click" formnovalidate name="cancel" Style="display: none" />
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
            $("#ssd").on("click", function () {
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

            });
        });
    </script>
</asp:Content>
