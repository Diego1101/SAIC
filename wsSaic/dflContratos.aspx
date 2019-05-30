<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipalSecretaria.master" AutoEventWireup="true" CodeFile="dflContratos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="well1">
          <div class="container">
          <div class="row">

              

              

              <%--<div class="grid_4">
                <div class="info-box">
                  <h2 class="fa-comment">Servicio 3</h2>
                  <hr/>
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
                  <hr/>
                  <h3>Ubicación: </h3>
                  <dl>
                    <dt>No muy lejos</dt>
                  </dl>
                    <asp:Button ID="btnC3" runat="server" Text="Completado" CssClass="btn"/>
                </div>
              </div>--%>

              <div class="grid_6">
                <div class="info-box">
                  <h2 class="fa-comment">Información del cliente</h2>
                  <hr/>
                  <h3>Datos:   </h3>
                  <dl >
                    
                    <dt>    </dt> 
                    <dd>
                         <br /><br />
                        <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtAP" runat="server" placeholder="Apellido Paterno"></asp:TextBox>
                        
                        <br /><br />
                        <asp:TextBox ID="txtAM" runat="server" placeholder="Apellido Materno"></asp:TextBox>

                        <br /><br />
                        <asp:TextBox ID="txtDir" runat="server" placeholder="Dirección"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtMQ" runat="server" placeholder="Equipo"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtFechContrato" runat="server" placeholder="Fecha Contrato"></asp:TextBox>
                    </dd>
                          
                  </dl>
                  
                  <dl>
                    
                  </dl>
                    <dl>
                    
                  </dl>
                  <hr/>
                  <h3>Generar Contraro </h3>
                  <dl>
                    <dt>Agreagar</dt>
                  </dl>
                    <asp:Button ID="btnContrato" runat="server" Text="Generar" CssClass="btn"/>
                </div>
              </div>



            </div>
          </div>
        </section>





</asp:Content>

