<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipalSecretaria.master" AutoEventWireup="true" CodeFile="dflContratos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="well1">
          <div class="container">
          <div class="row">
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
                        <asp:TextBox ID="txtPrecio" CssClass="txtBox" runat="server" placeholder="Costo"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtFechaCorte" CssClass="txtBox" runat="server" placeholder="Fecha corte(año-mes-día)"></asp:TextBox>
                        <br /><br />
                        
                    </dd>
                  </dl>
                  
                  <dl>
                      <dd>
                   <hr/>
                  <h3>Buscar archivo PDF Contrato </h3>
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
                    <asp:Button ID="btnRegisVen" runat="server" Text="Registrar" CssClass="btn" OnClick="btnRegisVen_Click"/>

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
                        <asp:DropDownList ID="dpdwContrato" runat="server"></asp:DropDownList>
                        <br /><br />
                        <asp:TextBox ID="txtDireccion" CssClass="txtBox" runat="server" placeholder="Direccion"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtCosto" CssClass="txtBox" runat="server" placeholder="Costo"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtCostoExtra" CssClass="txtBox" runat="server" placeholder="Costo extra por copia"></asp:TextBox>
                        <br /><br />
                        <asp:TextBox ID="txtNoCopia"  CssClass="txtBox" runat="server" placeholder="Numero de copias"></asp:TextBox>
                       </dd>    
                  </dl>
                  
                  <dl>
                  </dl>
                    <dl>
                  </dl>
                  <hr/>
                  <h3>Generar Renta </h3>
                  <dl>
                    <dt>Agreagar</dt>
                  </dl>
                    <asp:Button ID="Button1" runat="server" Text="Agregar" CssClass="btn" OnClick="Button1_Click"/>

                    
                    
                </div>
              </div>



            </div>
          </div>
        </section>

</asp:Content>