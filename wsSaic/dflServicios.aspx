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
                        if (obj.Tipo == 1) html += "reparacion";
                        html += "'><h2 class='fa-gear'>Servicio 5</h2>";
                        html += "<hr/>";
                        html += "<h3>Datos: </h3>";
                        html += "<dl>";
                        html += "<dt>Cliente: </dt>";
                        html += "<dd> " + obj.Nombre + "</dd>";
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
                        html += "<a class='btn'  href='javascript:onclick=closeForm()'>Ver Máquina</a>";
                        html += "<a class='btn'  href='javascript:onclick=openForm("+obj.Id+")'>Completado</a>";
                        html += "</div>";
                        html += "</div>";
                        Response.Write(html);
                    }


                %>

                <div class="fondo-banner" id="com1">
                    <div class="completar">
                        <a class="btn" href='javascript:onclick=closeForm(1)'>Cerrar1</a>
                    </div>
                </div>

                <div class="fondo-banner" id="com2">
                    <div class="completar">
                        <a class="btn" href='javascript:onclick=closeForm(2)'>Cerrar2</a>
                    </div>
                </div>

                <div class="fondo-banner" id="com3">
                    <div class="completar">
                        <a class="btn" href='javascript:onclick=closeForm(3)'>Cerrar3</a>
                    </div>
                </div>

                <div class="fondo-banner" id="com4">
                    <div class="completar">
                        <a class="btn" href='javascript:onclick=closeForm(4)'>Cerrar4</a>
                    </div>
                </div>


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
                        <asp:Button ID="Button1" runat="server" Text="Completado" CssClass="btn" />
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
        function openForm(id) {
            document.getElementById("com"+id).style.display = "block";
        }

        function closeForm(id) {
            document.getElementById("com"+id).style.display = "none";
        }

    </script>

</asp:Content>

