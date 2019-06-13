<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflSolicitudesTec.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="well1 ins2 mobile-center">
        <div class="container">
            <h2>Solicitudes</h2>
            <div class="row" style="display:flex; flex-wrap: wrap;">

                <%
                    clsEmpleado emp = new clsEmpleado(int.Parse(Session["ID"].ToString()), Application["cnn"].ToString());

                    List<clsSolicitud> sol = emp.listarSolicitudes(Application["cnn"].ToString());
                    foreach (clsSolicitud obj in sol)
                    {
                        string status;
                        switch (obj.estatus)
                        {
                            case 0: status = "Negada"; break;
                            case 1: status = "Pendiente"; break;
                            case 2: status = "Aprobada"; break;
                            default: status = "Nose"; break;
                        }

                %>


                <div class="solicitudServ">
                    <h4 style="color:white;"><strong>Folio: </strong><% =obj.folio%></h4>
                    <p><strong>Nombre: </strong><% =obj.nombre%></p>
                    <p><strong>Descripción: </strong><% =obj.descripcion%></p>
                    <p><strong>Estatus: </strong><% =status%></p>
                    
           
                    
                    <div style="margin-left: 0px; margin-right: 0px; width: 100%; margin-top:5px;">
                        <iframe class='panel ' name='com1' src='dflUpdServ1.aspx?p=2&id=<% =obj.slid%>' style='background-color: inherit; height: 76px;'></iframe>
                    </div>

                </div>

                <%
                    }
                %>



            </div>
        </div>

    </section>
</asp:Content>

