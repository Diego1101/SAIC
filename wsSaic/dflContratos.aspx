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
                  <h2 class="fa-user">Registrar venta o renta</h2>
                  <hr/>
                  <h3>Datos:   </h3>
                  <dl >
                    
                    <dt>    </dt> 
                    <dd>
                         <br /><br />
                        <%--CssClass="txtBox"  DA FORMATO A LAS CAJAS DE TEXTO--%>
                        <asp:DropDownList ID="dpdwRentaVenta" runat="server"></asp:DropDownList>
                        <br /><br />
                        <asp:DropDownList ID="dpdwCliente" runat="server"></asp:DropDownList>
                        <br /><br />
                        <asp:TextBox ID="txtFolio" CssClass="txtBox" runat="server" placeholder="Folio"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtPrecio" CssClass="txtBox" runat="server" placeholder="Precio"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtFechaCorte" CssClass="txtBox" runat="server" placeholder="Fecha"></asp:TextBox>
                        <br /><br />
                    </dd>
                  </dl>
                  
                  <dl>
                      <dd>
                   <hr/>
                  <h3>Buscar archivo PDF </h3>
                  <dl>
                      <%--<dd>Buscar archivo PDF</dd>--%>
                    <dt><asp:FileUpload ID="fluCargar" runat="server" /> </dt>
                    
                  </dl>
                    <asp:Button ID="btnCargar" runat="server" Text="Cargar PDF" CssClass="btn" OnClick="btnCargar_Click"/>
                   <br /><br />
                  <d1>
                      <div>
                      
                    <iframe name="certificado"
                       src="<%=Session["nomArchivo"].ToString() %>"
                        width="350" height="450"></iframe>
                    <br /><br /></div>
                  </d1>
                  <hr/>
                  </dl>
                    <dl>
                    
                  </dl>
                  <h3>Registrar la venta </h3>
                  <dl>
                    <dt>Agreagar</dt>
                  </dl>
                    <asp:Button ID="btnRegisVen" runat="server" Text="Registrar" CssClass="btn"/>

                  </dd>  
                    
                </div>
              </div>

              <div class="grid_6">
                <div class="info-box">
                  <h2 class="fa-upload">Contrato</h2>
                  
                  
                </div>
              </div>



              <div class="grid_6">
                <div class="info-box">
                  <h2 class="fa-edit">Información de la máquina</h2>
                  <hr/>
                  <h3>Datos:   </h3>
                  <dl >
                    
                    <dt>    </dt> 
                    <dd>
                         <br /><br />
                        <%--CssClass="txtBox"  DA FORMATO A LAS CAJAS DE TEXTO--%>
                        
                        <asp:DropDownList ID="dpdwMaquina" runat="server"></asp:DropDownList>
                        <br /><br />
                        <asp:DropDownList ID="dpdwVenta" runat="server"></asp:DropDownList>
                        <br /><br />
                        <br /><br />
                        <asp:TextBox ID="txtCalle" CssClass="txtBox" runat="server" placeholder="Calle"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtNumCalle" CssClass="txtBox" runat="server" placeholder="Numero"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtCiudad" CssClass="txtBox" runat="server" placeholder="Ciudad"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtEstado" CssClass="txtBox" runat="server" placeholder="Estado"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtCP" CssClass="txtBox" runat="server" placeholder="Código Postal"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtFechaServ"  CssClass="txtBox" runat="server" placeholder="Fecha del Servicio"></asp:TextBox>
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
                    <asp:Button ID="Button1" runat="server" Text="Generar" CssClass="btn" OnClick="Button1_Click"/>

                    
                    
                </div>
              </div>



            </div>
          </div>
        </section>



    <%--<table >
            <tr>
                <td>
                    Cargar un archivo en PDF
                </td>
            </tr>
            <tr>
                <td>
                    Buscar archivo PDF
                </td>
                <td>
                    <asp:FileUpload ID="fluCargar" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnCargar" runat="server" Text="Cargar" OnClick="btnCargar_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <iframe name="certificado"
                        src="<%=Session["nomArchivo"].ToString() %>"
                        width="450" height="350"></iframe>
                    <br /><br />
                </td>
            </tr>
        </table>--%>



</asp:Content>

