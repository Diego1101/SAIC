<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflRegistro.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-offset-2">
                <h3 style="color: rgb(98, 191, 230); margin-left: 10px;">Registro</h3>
                <br />
                <div class="grid_8">
                    <div class="col-md-5" style="overflow: hidden">
                        <div class="grid_3">

                            <div style="margin-left: 0%;">
                                <h4>Foto</h4>

                                <asp:label id="lblFoto" runat="server" text="Label" visible="false"></asp:label>
                                <asp:imagebutton id="imgFoto" runat="server" cssclass="txtBox" imageurl="~/ImgDef/Usuario.jpg" width="50%" enabled="false" clientidmode="Static" />
                                <asp:fileupload id="fluFoto" runat="server" clientidmode="Static" />

                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <h4>Nombre</h4>
                        <asp:textbox id="txtNombre" runat="server" cssclass="txtBox" placeholder="Nombre"  required="required"></asp:textbox>
                        <br />

                    </div>
                    <div class="col-lg-5">
                        <h4>Apellido</h4>
                        <asp:textbox id="txtApellido" runat="server" cssclass="txtBox" placeholder="Apellido" required="required"></asp:textbox>
                        <br />
                    </div>
                    <div class="row"></div>
                    <div class="col-lg-5">
                        <h4>Sexo</h4>
                        <asp:dropdownlist id="dwlSexo" runat="server" cssclass="DropDown" style="text-align: left; width: 105%; height: 40px;">
                        <asp:ListItem>Mujer</asp:ListItem>
                        <asp:ListItem>Hombre</asp:ListItem>
                        <asp:ListItem Selected="True">Otro</asp:ListItem>
                    </asp:dropdownlist>
                        <br />
                        <br />
                    </div>
                    <div class="row"></div>

                    <div class="col-lg-5" >
                        <h4>Calle</h4>
                        <asp:textbox id="txtCalle" runat="server" cssclass="txtBox" placeholder="Calle" required="required" style="width: 95%"></asp:textbox>
                    </div>

                    <div class="col-lg-5 col-lg-offset-1" >
                        <h4>Ciudad</h4>
                        <asp:textbox id="txtCiudad" runat="server" cssclass="txtBox" placeholder="Ciudad" required="required"></asp:textbox>
                    </div>
                    
                    <div class="col-lg-5" style="margin-top:25px;">
                        <h4>Estado</h4>
                        <asp:textbox id="txtEstado" runat="server" cssclass="txtBox" placeholder="Estado" required="required" style="width: 95%"></asp:textbox>
                    </div>

                    <div class="col-lg-5 col-lg-offset-1" style="margin-top:25px;">
                        <h4>C.P.</h4>
                        <asp:textbox id="txtCP" runat="server" cssclass="txtBox" placeholder="Codigo Postal" required="required"></asp:textbox>
                    </div>

                    <div class="col-lg-5" style="margin-top:25px;">
                        <h4>Teléfono</h4>
                        <asp:textbox id="txtTel" runat="server" cssclass="txtBox" placeholder="Teléfono" required="required"></asp:textbox>
                    </div>

                    <div class="col-lg-5 col-lg-offset-1" style="margin-top:25px;">
                        <h4>Correo</h4>
                        <asp:textbox id="txtCorreo" runat="server" cssclass="txtBox" placeholder="Correo" type="email" required="required"></asp:textbox>
                    </div>

                    
                    
                    
                    <div class="col-lg-12" style="padding-left:0px; margin-top: 25px;">
                    <div class="col-lg-5">
                        <h4>Usuario</h4>
                        <asp:textbox id="txtUsario" runat="server" cssclass="txtBox" placeholder="Usuario" required="required"></asp:textbox>
                    </div>
                        </div>

                    <div class="col-lg-5" style="margin-top:25px;">
                        <h4>Contraseña</h4>
                        <asp:textbox id="txtContra" runat="server" cssclass="txtBox" placeholder="Contraseña"  required="required" TextMode="Password"></asp:textbox>
                        <br />

                    </div>
                    <div class="col-lg-5 col-lg-offset-1" style="margin-top:25px;">
                        <h4>Confirmar contraseña</h4>
                        <asp:textbox id="txtCConta" runat="server" cssclass="txtBox" placeholder="Confirmar" required="required"  TextMode="Password"></asp:textbox>
                        
                    </div>

                    <asp:button id="btnGuardar" runat="server" text="Crear Cuenta" cssclass="btn" style="float: right;" OnClick="btnGuardar_Click"/>
                </div>

            </div>
    </div>

    </div>

    <script>

        const realInput = document.getElementById('fluFoto');


        realInput.addEventListener('change', () => {
            //alert(realInput.value);
            const name = realInput.value.split(/\\|\//).pop();

            fileInfo.innerHTML = name;

        });


        document.getElementById("fluFoto").onchange = function (e) {
            // Creamos el objeto de la clase FileReader
            let reader = new FileReader();

            // Leemos el archivo subido y se lo pasamos a nuestro fileReader
            reader.readAsDataURL(e.target.files[0]);

            // Le decimos que cuando este listo ejecute el código interno
            reader.onload = function () {
                let image = document.getElementById("imgFoto");

                image.src = reader.result;
                preview.innerHTML = '';
                preview.append(image);
            };
        }



    </script>
    <br />
    <br />



</asp:Content>

