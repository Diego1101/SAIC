<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflMCEmp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <div class="row">
            <h3 style="color: rgb(98, 191, 230);">Informacion Personal</h3>
            <br />
            <div class="grid_6">
                <div class="col-lg-5">
                    <h4>Nombre</h4>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="txtBox" placeHolder="Nombre" Style="width: 90%;" required="required"></asp:TextBox>
                    <br />

                </div>
                <div class="col-lg-5">
                    <h4>Apellido</h4>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="txtBox" placeHolder="Apellido" required="required"></asp:TextBox>
                    <br />
                </div>
                <div class="col-lg-12">
                    <h4>Sexo</h4>
                    <asp:DropDownList ID="dwlSexo" runat="server" CssClass="DropDown" Style="text-align: left; width: 50%; height: 40px;">
                        <asp:ListItem>Mujer</asp:ListItem>
                        <asp:ListItem>Hombre</asp:ListItem>
                        <asp:ListItem Selected="True">Otro</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                </div>


                <div class="col-lg-12">
                    <h4>Direccion</h4>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="txtBox" placeHolder="Direccion" required="required"></asp:TextBox>
                </div>

                <div class="col-lg-12">
                    <h4>Teléfono</h4>
                    <asp:TextBox ID="txtTel" runat="server" CssClass="txtBox" placeHolder="Teléfono" required="required"></asp:TextBox>
                </div>

                <div class="col-lg-12">
                    <h4>Correo</h4>
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="txtBox" placeHolder="Correo" type="email" required="required"></asp:TextBox>
                </div>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn" Style="float: right;" OnClick="btnGuardar_Click" />
            </div>

            <div class="grid_6">
                <br />
                <br />
                <div style="margin-left: 25%;">
                    <h4>Foto</h4>

                    <asp:ImageButton ID="imgFoto" runat="server" CssClass="txtBox" ImageUrl="~/ImgDef/Usuario.jpg" Width="50%" Enabled="false" ClientIDMode="Static" />
                    <asp:FileUpload ID="fluFoto" runat="server" ClientIDMode="Static" />
                    <asp:Button ID="btnSubir" runat="server" Text="Subir" CssClass="btn btn-comp" />

                </div>
            </div>
        </div>

        <div class="row">
            <h3 style="color: rgb(98, 191, 230);">Cambio de contraseña</h3>
            <br />
            <div class="grid_6">

                <h4>Antigua contraseña</h4>
                <asp:TextBox ID="txtCAnt" runat="server" CssClass="txtBox" TextMode="Password" placeHolder="Antigua contraseña"></asp:TextBox><br />
                <h4>Nueva contraseña</h4>
                <asp:TextBox ID="txtContra" runat="server" CssClass="txtBox" TextMode="Password" placeHolder="Nueva contraseña"></asp:TextBox><br />
                <h4>Repetir contraseña</h4>
                <asp:TextBox ID="txtCContra" runat="server" CssClass="txtBox" TextMode="Password" placeHolder="Repetir contraseña"></asp:TextBox><br />
                <asp:Button ID="btnCambiar" runat="server" Text="Cambiar" CssClass="btn" Style="float: right;" />
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

