<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dflGenServ.aspx.cs" Inherits="dflSolicitud" %>


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
    <form id="form1" runat="server">
        <div class="container" style="width: 80%">

            <div class="row">
                <div style="text-align: left"><strong>Problema: </strong></div>
                <asp:TextBox ID="txtSol" runat="server" CssClass="txtBox" placeHolder="Descripción del problema" Style="width: 100%; height: 40%; resize: none;" TextMode="MultiLine" required="required"></asp:TextBox>
                <span style="font-size: 10px;">Por favor describa el problema que presenta</span>
                <asp:Label ID="lblRes" runat="server" Text="Esperando" style="float:right;"></asp:Label>
            </div>
            <div class="row">
                
                <asp:Button class="btn" ID="btnAceptar" runat="server" Text="Reportar" OnClick="btnAceptar_Click" />
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
