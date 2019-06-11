<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflServicios.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //<![CDATA[
        self.name = "ventanaprincipal";
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
                        html += "<a class='btn'  href='javascript:onclick=openMaquina(" + obj.IdMaquina + ")'>Ver Máquina</a>";
                        html += "<a class='btn btn-comp'  href='javascript:onclick=openCom(" + obj.Id + ")'>Completado</a>";
                        html += "</div>";
                        html += "</div>";

                        //maquina
                        html += "<div class='fondo-banner' id='mq" + obj.IdMaquina + "'>";
                        html += "<div class='maquina'>";
                        html += "<div class='col-md-1' style='float: right;'>";
                        html += "<h2><a href='javascript:onclick=closeMaquina(" + obj.IdMaquina + ")' style='color: red;'><i class='fa-close'></i></a></h2>";
                        html += "</div>";
                        html += "<div class='container' style='width: 90%'>";
                        html += "<div class='row' style='margin-top: 0px;'>";
                        html += "<br />";
                        html += "<table class='tabla1'>";
                        html += "<tr>";
                        html += "<td colspan='2' rowspan='2' style='width: 30%;'>";
                        html += "<img src='IMGMAQUINAS/" + obj.Maquina.Foto + "' />";
                        html += "</td>";
                        html += "<td style='width: 35%;'>";
                        html += "<h5><strong>Modelo: </strong>" + obj.Maquina.Modelo + "</h5>";
                        html += "</td>";
                        html += "<td style='width: 35%;'>";
                        html += "<h5><strong>No.Serie: </strong>" + obj.Maquina.NoSerie + "</h5>";
                        html += "</td>";
                        html += "</tr>";
                        html += "<tr>";
                        html += "<td>";
                        html += "<h6><strong>Contador: </strong>" + obj.Maquina.Contador + "</h6>";
                        html += "</td>";
                        html += "<td>";
                        html += "<h6><strong>Descripción: </strong></h6>";
                        html += "<p>" + obj.Maquina.Desc + "</p>";
                        html += "</td>";
                        html += "</tr>";
                        html += "</table>";
                        html += "</div>";
                        html += "</div>";
                        html += "</div>";
                        html += "</div>";


                        //solicitud
                        html += "<div class='fondo-banner' id='sv" + obj.Id + "'>";
                        html += "<div class='solicitud'>";
                        html += "<div class='col-md-1' style='float: right;'>";
                        html += "<h2><a href='javascript:onclick=closeSolicitud(" + obj.Id + ")' style='color: red;'><i class='fa-close'></i></a></h2>";
                        html += "</div>";
                        html += " <iframe class='panel' name='sol" + obj.Id + "' src='dflSolicitud.aspx?id=" + obj.Id + "&folio=" + obj.Folio + "'></iframe>";
                        html += "</div>";
                        html += "</div>";

                        //completar
                        html += "<div class='fondo-banner' id='com" + obj.Id + "'>";
                        html += "<div class='completar' style='overflow: hidden'>";
                        html += "<div class='col-md-1' style='float: right;'>";
                        html += "<h2><a href='javascript:onclick=closeCom(" + obj.Id + ")' style='color: red;'><i class='fa-close'></i></a></h2>";
                        html += "</div>";
                        html += "<iframe class='panel' name='com1' src='dflCompletar.aspx?id=" + obj.Id + "&folio=" + obj.Folio + "' style='background-color: white;'></iframe>";
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

