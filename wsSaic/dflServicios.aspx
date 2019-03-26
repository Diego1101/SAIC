<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflServicios.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <section class="well1">
          <div class="container">
          <div class="row">

              <div class="grid_4">
                <div class="info-box">
                  <h2 class="fa-comment">Servicio 1</h2>
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
                    <asp:Button ID="btnC1" runat="server" Text="Completado" CssClass="btn"/>
                </div>
              </div>

              <div class="grid_4">
                <div class="info-box">
                  <h2 class="fa-comment">Servicio 2</h2>
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
                    <asp:Button ID="btnC2" runat="server" Text="Completado" CssClass="btn"/>
                </div>
              </div>

              <div class="grid_4">
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
              </div>

            </div>
          </div>
        </section>
</asp:Content>

