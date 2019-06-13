<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflMaquinasTec.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <section class="well1 ins2 mobile-center">
        <div class="container">
            <h2>Máquinas en inventario <a href="dflDetMaquina.aspx"><i class="fa-plus"></i></a> </h2>
            <div class="row off2" style="display:flex; flex-wrap: wrap;">

                <%
                    clsMaquina mq = new clsMaquina();
                    List<clsMaquina> maquinas = mq.mqTenico(int.Parse(Session["ID"].ToString()),Application["cnn"].ToString());
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
                    <a href="dflDetMaquinaTec.aspx?id=<% =obj.Id%>" class="btn">Modificar</a>
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

