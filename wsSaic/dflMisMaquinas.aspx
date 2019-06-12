<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflMisMaquinas.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        //<![CDATA[
        self.name = "ventanaprincipal";
        //]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="well1 ins2 mobile-center">
        <div class="container">
            <h2>Máquinas contratadas</h2>
            <div class="row off2">

                <%
                    clsCliente cliente = new clsCliente();
                    cliente.Id = int.Parse(Session["ID"].ToString());

                    List<clsMaquina> mq=cliente.listarMaquinas(Application["cnn"].ToString());
                    foreach (clsMaquina obj in mq)
                    {


                %>
                <div class="grid_4" style="margin-top: 10px; margin-bottom: 75px;">
                    <div align="center">
                        <img src="IMGMAQUINAS/<% =obj.Foto%>" alt="Error al cargar la imagen" />
                    </div>
                    <h4><strong>No. Serie: </strong><% =obj.NoSerie%></h4>
                    <p><strong>Modelo: </strong><% =obj.Modelo%></p>
                    <p><strong>Descripción: </strong><% =obj.Desc%></p>
                    <a class="btn" onclick="openRep(<% =obj.Id%>)">Reporte</a>
                </div>

                <div class="fondo-banner" id="rep<% =obj.Id%>">
                    <div class="reporte">
                        <div class='col-md-1' style='float: right;'>
                            <h2><a href='javascript:onclick=closeRep(<% =obj.Id%>)' style='color: red;'><i class='fa-close'></i></a></h2>
                        </div>
                        <iframe class='panel' name='com1' src='dflGenServ.aspx?id=<% =obj.Id%>' style='background-color: inherit;'></iframe>

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

