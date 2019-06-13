<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipalSecretaria.master" AutoEventWireup="true" CodeFile="dflPagos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        //<![CDATA[
        self.name = "ventanaprincipal";
        //]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="well1 ins2 mobile-center">
        <div class="container">
            <h2>Solicitudes</h2>
            <div class="row" style="display:flex; flex-wrap: wrap;">

                <%
                    clsSolicitud aux = new clsSolicitud();


                    //List<clsMaquina> mq=cliente.listarSolicitudes(Application["cnn"].ToString());
                    List<clsSolicitud> sol = aux.listarPendientes(Application["cnn"].ToString());
                    foreach (clsSolicitud obj in sol)
                    {

                %>


                <div class="solicitudServ">
                    <h4 style="color:white;"><strong>Folio: </strong><% =obj.folio%></h4>
                    <p><strong>Nombre: </strong><% =obj.nombre%></p>
                    <p><strong>Descripción: </strong><% =obj.descripcion%></p>
                    
           
                    
                    <div style="margin-left: 0px; margin-right: 0px; width: 100%; margin-top:5px;">
                        <iframe class='panel' name='com1' src='dflUpdServ.aspx?p=1&id=<% =obj.slid%>' style='background-color: inherit; height: 76px;'></iframe>
                    </div>

                </div>

                <%
                    }
                %>



            </div>
        </div>

    </section>
    <script>

        function openRep(id) {
            document.getElementById("rep" + id).style.display = "block";
        }

        function closeRep(id) {
            document.getElementById("rep" + id).style.display = "none";
        }

    </script>

</asp:Content>

