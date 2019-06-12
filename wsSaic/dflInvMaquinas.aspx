<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipalAdm.master" AutoEventWireup="true" CodeFile="dflInvMaquinas.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <section class="well1 ins2 mobile-center">
        <div class="container">
            <h2>Máquinas en inventario</h2>
            <div class="row off2">

                <%
                    clsMaquina mq = new clsMaquina();
                    List<clsMaquina> maquinas = mq.inventario(Application["cnn"].ToString());
                    foreach (clsMaquina obj in maquinas)
                    {

                %>
                <div class="grid_4" style="margin-top: 10px; margin-bottom: 75px;">
                    <div align="center">
                        <img src="IMGMAQUINAS/<% =obj.Foto%>" alt="Error al cargar la imagen" />
                    </div>
                    <h4><strong>No. Serie: </strong><% =obj.NoSerie%></h4>
                    <p><strong>Modelo: </strong><% =obj.Modelo%></p>
                    <p><strong>Descripción: </strong><% =obj.Desc%></p>
                    <a href="dflDetMaquina.aspx?id=<% =obj.Id%>" class="btn">Modificar</a>
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

