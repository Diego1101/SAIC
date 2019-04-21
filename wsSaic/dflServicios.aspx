<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflServicios.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                        html += "<a class='btn'  href='#'>Solicitud</a>";
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

                        Response.Write(html);
                    }


                %>
                <div class="grid_4">
                    <div class="info-box">
                        <h2 class="fa-gear">Servicio 1</h2>
                        <hr />
                        <h3>Datos: </h3>
                        <dl>
                            <dt>Cliente: </dt>
                            <dd>Firma de abogados</dd>
                        </dl>
                        <dl>
                            <dt>Modelo: </dt>
                            <dd>El no tan caro</dd>
                        </dl>
                        <dl>
                            <dt>Mas detalles:</dt>
                            <dd>Saca copias</dd>
                        </dl>
                        <hr />
                        <h3>Ubicación: </h3>
                        <dl>
                            <dt>No muy lejos</dt>
                        </dl>
                        <a class='btn'  href='#'>Solicitud</a>
                        <a class='btn'  href='javascript:onclick=openMaquina(9)'>Ver Máquina</a>
                        <a class='btn btn-comp'  href='javascript:onclick=openCom(9)'>Completado</a>
                    </div>
                </div>

                <div class='fondo-banner' id='com9'>
                 <div class='completar'>
                 <a class='btn' href='javascript:onclick=closeCom(9)'>Completado9</a>
                 </div>
                  </div>


                <div class="grid_4">
                    <div class="info-box">
                        <h2 class="fa-gear">Servicio 2</h2>
                        <hr />
                        <h3>Datos: </h3>
                        <dl>
                            <dt>Cliente: </dt>
                            <dd>Firma de abogados</dd>
                        </dl>
                        <dl>
                            <dt>Modelo: </dt>
                            <dd>El no tan caro</dd>
                        </dl>
                        <dl>
                            <dt>Mas detalles:</dt>
                            <dd>Saca copias</dd>
                        </dl>
                        <hr />
                        <h3>Ubicación: </h3>
                        <dl>
                            <dt>No muy lejos</dt>
                        </dl>
                        <asp:Button ID="btnC2" runat="server" Text="Completado" CssClass="btn" />
                    </div>
                </div>

                <div class="grid_4">
                    <div class="info-box">
                        <h2 class="fa-gear">Servicio 3</h2>
                        <hr />
                        <h3>Datos: </h3>
                        <dl>
                            <dt>Cliente: </dt>
                            <dd>Firma de abogados</dd>
                        </dl>
                        <dl>
                            <dt>Modelo: </dt>
                            <dd>El no tan caro</dd>
                        </dl>
                        <dl>
                            <dt>Mas detalles:</dt>
                            <dd>Saca copias</dd>
                        </dl>
                        <hr />
                        <h3>Ubicación: </h3>
                        <dl>
                            <dt>No muy lejos</dt>
                        </dl>
                        <asp:Button ID="btnC3" runat="server" Text="Completado" CssClass="btn" />
                    </div>
                </div>

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

    </script>

</asp:Content>

