<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dflSolicitud.aspx.cs" Inherits="dflSolicitud" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="format-detection" content="telephone=no" />
    <link rel="icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/grid.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/google-map.css" />
    <link rel="stylesheet" href="css/mailform.css" />
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script src="js/device.min.js"></script>
</head>
<body style="padding:0px;">
    <form id="form1" runat="server" onsubmit="return window.open('dflServicios.aspx','ventanaprincipal');">
        <div class="container" style="width:80%">
                <div class="row" style="margin-top:0px;">
                    <br />
                    <div class="col-lg-push-5" style="left: 41.66666667%;">
                        <h3><strong>Folio: </strong><%=Request.QueryString["folio"] %></h3>
                    </div>
                </div>
                <div class="row">
                    <asp:TextBox ID="txtRefaccion" runat="server" CssClass="txtBox" placeHolder="Refacción" Style="width: 90%;"></asp:TextBox>
                    <br />
                    <div style="text-align: left"><strong>Notas: </strong></div>
                    <asp:TextBox ID="txtNotas" runat="server" CssClass="txtBox" placeHolder="Notas" Style="width: 90%; height: 25%; resize: none;" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="row" style="margin-top: 0px;">
                <asp:Button class="btn" ID="btnCancelar" runat="server" Text="Cancelar" Style="width: 40%" />
                <asp:Button class="btn" ID="btnAceptar" runat="server" Text="Aceptar" Style="width: 40%" OnClick="btnAceptar_Click" />
            </div>
            </div>
            
    </form>

    <script src="js/script.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/tmstickup.js"></script>
        <script src="js/jquery.ui.totop.js"></script>
        <script src="js/jquery.mousewheel.min.js"></script>
        <script src="js/jquery.simplr.smoothscroll.min.js"></script>
        <script src="js/superfish.js"></script>
        <script src="js/jquery.rd-navbar.js"></script>
        <script src="js/wow.js"></script>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0" />
        <script src="js/mailform/jquery.form.min.js"></script>
        <script src="js/mailform/jquery.rd-mailform.min.c.js"></script>
</body>
</html>
