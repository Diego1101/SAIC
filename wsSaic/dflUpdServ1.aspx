<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dflUpdServ1.aspx.cs" Inherits="dflSolicitud" %>


<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #62bfe6">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" href="css/style.css" />

</head>
<body style="padding: 0px;">
    
    <form id="form1" runat="server" onsubmit="return window.open('dflSolicitudesTec.aspx','ventanaprincipal');" style="background-color:#62bfe6;">
     
       
        <%
            int p = int.Parse(Request.QueryString["p"]);
            if (p == 1) { 
             %>

        <asp:button Id="btnNegar" runat="server" text="Negar" CssClass="btn2" OnClick="btnNegar_Click" OnClientClick="motivo()"/>
        <asp:button Id="btnAceptar"  runat="server" text="Aceptar" CssClass="btn2" style="float:right;" OnClick="btnAceptar_Click"/> 
        
        <%
            }
            else { 

             %> 
        <asp:TextBox ID="txtMotivo" runat="server" ClientIDMode="Static" type="hidden"></asp:TextBox>
        <asp:button Id="btnBorrar"  runat="server" text="Borrar" CssClass="btn2" style="float:right;" OnClick="btnBorrar_Click" OnClientClick="confirmar()"/> 
         
        <%
            }
            
             %> 
    </form>

    <script>
        function motivo() {
            var mot = prompt("Motivo por el que se niega: ");
            document.getElementById("txtMotivo").value = mot;

        }

        function confirmar() {
            var mot = confirm("¿Esta seguro?\nEsta acción no se puede deshacer");
            document.getElementById("txtMotivo").value = mot;

        }

    </script>
</body>
</html>
