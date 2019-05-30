<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflServicios.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <script type="text/javascript">
    //<![CDATA[
    self.name ="ventanaprincipal";
    //]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="well1">
        <div class="container">
            <div class="row">
                <%
                    clsEmpleado emp = new clsEmpleado();
                    List<clsServicio> res = emp.serviciosEmp(int.Parse(Session["ID"].ToString()), 3, Application["cnn"].ToString());
                    foreach (clsServicio obj in res)
                    {
                        string html;
                        html = "<div class='grid_4'>";
                        html += "<div class='info-box   ";
                        if (obj.Tipo == 1) html += "reparacion'><h2 class='fa-gear'>Reparación</h2>";
                        else html += "'><h2 class='fa-gear'>Mantenimiento</h2>";
                        html += "<hr/>";
                        html += "<h3>" + obj.Nombre + "</h3>"; ;
                        html += "<dl>";
                        html += "<dt>Folio: </dt>";
                        html += "<dd>" + obj.Folio + "</dd>";
                        html += "</dl>";
                        html += "<dl>";
                        html += "<dt>Modelo: </dt>";
                        html += "<dd>" + obj.Modelo + "</dd>";
                        html += "</dl>";
                        html += "<dl>";
                        html += "<dt>Detalles: </dt>";
                        html += "<dd>" + obj.Desc + "</dd>";
                        html += "</dl>";
                        html += "<hr/>";
                        html += "<h3>Dirección: </h3>";
                        html += "<dl>";
                        html += "<dt>" + obj.Calle + " No." + obj.Numero + " " + obj.Ciudad + ", " + obj.DEstado + ". " + obj.Cp + "</dt>";
                        html += "</dl>";
                        html += "<a class='btn'  href='javascript:onclick=openSolicitud(" + obj.Id + ")'>Solicitud</a>";
                        html += "<a class='btn'  href='javascript:onclick=openMaquina(" + obj.Maquina + ")'>Ver Máquina</a>";
                        html += "<a class='btn btn-comp'  href='javascript:onclick=openCom(" + obj.Id + ")'>Completado</a>";
                        html += "</div>";
                        html += "</div>";


                        html += "<div class='fondo-banner' id='com" + obj.Id + "'>";
                        html += "<div class='completar'>";
                        html += "<a class='btn' href='javascript:onclick=closeCom(" + obj.Id + ")'>Completado" + obj.Id + "</a>";
                        html += "</div>";
                        html += "</div>";

                        html += "<div class='fondo-banner' id='mq" + obj.Maquina + "'>";
                        html += "<div class='completar'>";
                        html += "<a class='btn' href='javascript:onclick=closeMaquina(" + obj.Maquina + ")'>Maquina" + obj.Maquina + "</a>";
                        html += "</div>";
                        html += "</div>";

                        //servicio
                        html += "<div class='fondo-banner' id='sv" + obj.Id + "'>";
                        html += "<div class='solicitud'>";
                        html += " <iframe class='panel' name='sol" + obj.Id + "' src='dflSolicitud.aspx?id=" + obj.Id + "&folio=" + obj.Folio + "'></iframe>";
                        html += "</div>";
                        html += "</div>";

                        Response.Write(html);
                    }
                %>
            </div>
        </div>
    </section>

    <script>
        function openCom(id) {
            document.getElementById("com" + id).style.display = "block";
        }

        function closeCom(id) {
            document.getElementById("com" + id).style.display = "none";

        }

        function openMaquina(id) {
            document.getElementById("mq" + id).style.display = "block";
        }

        function closeMaquina(id) {
            document.getElementById("mq" + id).style.display = "none";
        }

        function openSolicitud(id) {
            document.getElementById("sv" + id).style.display = "block";
        }

        function closeSolicitud(id) {
            document.getElementById("sv" + id).style.display = "none";
        }

    </script>

</asp:Content>

