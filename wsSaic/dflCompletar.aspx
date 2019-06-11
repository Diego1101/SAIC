<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dflCompletar.aspx.cs" Inherits="dflSolicitud" %>


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
<body style="padding: 0px;">
    <form id="form1" runat="server" onsubmit="return window.open('dflServicios.aspx','ventanaprincipal');">
        <div class="container" style="width: 80%">
            <div class="row" style="margin-top: 0px;">
                <br />
                <div class="col-lg-push-5" style="left: 41.66666667%;">
                    <h3><strong>Folio: </strong><%=Request.QueryString["folio"] %></h3>
                </div>
            </div>
            <div class="row">
                <div class="container">
                <div style="width:50%; float:left;">
                    <asp:TextBox ID="txtContador" runat="server" CssClass="txtBox" placeHolder="Contador" Style="width: 80%;" required="required" type="number"></asp:TextBox>
                
                </div>
                <div style="width:50%; float:right;">
                    <div style="text-align: left"><strong>Seleccionar archivo </strong></div>
                    <asp:Label ID="lblArchivo" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:FileUpload ID="fluArchivo" runat="server" style="margin-top:10px;" onchange="mostrar()" required="required"/>
                </div>
                </div>
                <br />
                <div style="text-align: left"><strong>Solucion: </strong></div>
                <asp:TextBox ID="txtSol" runat="server" CssClass="txtBox" placeHolder="Solucion" Style="width: 90%; height: 25%; resize: none;" TextMode="MultiLine" required="required"></asp:TextBox>
            </div>
            <div class="row">
                <asp:Button class="btn" ID="btnAceptar" runat="server" Text="Aceptar" Style="width: 40%" OnClick="btnAceptar_Click" />
            </div>
        </div>

    </form>


    <script>

        function mostrar() {
            
        }

    </script>
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
