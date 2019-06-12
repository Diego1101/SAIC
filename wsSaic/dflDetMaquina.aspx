<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipalAdm.master" AutoEventWireup="true" CodeFile="dflDetMaquina.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-offset-2">
                <h3 style="color: rgb(98, 191, 230); margin-left: 10px;">Registro</h3>
                <br />
                <div class="grid_8">
                    <div class="col-md-5" style="overflow: hidden">
                        <div class="grid_4">
                            <div style="margin-left: 0%;">
                                <h4>Foto</h4>
                                <asp:Label ID="lblFoto" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:ImageButton ID="imgFoto" runat="server" CssClass="txtBox" ImageUrl="~/ImgDef/Usuario.jpg" Width="50%" Enabled="false" ClientIDMode="Static" />
                                <asp:FileUpload ID="fluFoto" runat="server" ClientIDMode="Static" />

                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-lg-offset-1">
                        <h4>No. Serie</h4>
                        <asp:TextBox ID="txtNoSerie" runat="server" CssClass="txtBox" placeholder="No.Serie" required="required"></asp:TextBox>
                        <br />

                    </div>
                    <div class="col-lg-5 col-lg-offset-1">
                        <h4>Modelo</h4>
                        <asp:TextBox ID="txtModelo" runat="server" CssClass="txtBox" placeholder="Modelo" required="required"></asp:TextBox>

                    </div>


                    <div class="row"></div>
                    <div class="col-lg-12" style="margin-top: 25px;">
                        <div>
                            <h4>Descripcion</h4>
                            <asp:TextBox ID="txtDesc" runat="server" CssClass="txtBox" placeholder="Usuario" Style="width: 95%" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row"></div>
                    <div class="col-lg-5" style="margin-top: 25px;">
                        <h4>Tecnico</h4>
                        <asp:DropDownList ID="dwlTecnico" runat="server" CssClass="DropDown" Style="text-align: center; width: 105%; height: 40px;">
                        </asp:DropDownList>

                    </div>
                    <div class="col-lg-5 col-lg-offset-1" style="margin-top: 25px;">
                        <h4>Contador</h4>
                        <asp:TextBox ID="txtContador" runat="server" CssClass="txtBox" placeholder="Contador" required="required" Style="width: 95%"></asp:TextBox>
                    </div>

                    <div class="row"></div>

                    <div class="col-lg-5" style="margin-top: 25px;">
                        <h4>Precio</h4>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="txtBox" placeholder="Precio" required="required" Style="width: 95%" TextMode="Number"></asp:TextBox>
                    </div>

                    <div class="col-lg-5 col-lg-offset-1" style="margin-top: 25px;">
                        <h4>Ultimo servicio</h4>
                        <asp:TextBox ID="txtUltS" runat="server" CssClass="txtBox" placeholder="Ultimo Servicio" Style="width: 95%"></asp:TextBox>
                    </div>
                   
                     <asp:Button ID="btnBorrar" runat="server" Text="Borrar" CssClass="btn" style="margin-left:15px;" OnClick="btnBorrar_Click" OnClientClick="confirmar()" />
                    <asp:TextBox ID="txtConfirm" runat="server" ClientIDMode="Static" type="hidden"></asp:TextBox>
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn" Style="float: right;" OnClick="btnGuardar_Click" />
                </div>

            </div>
        </div>

    </div>

    <script>

        function confirmar() {

            var name1 = confirm('Seguro que desea borrar\nEsta acción no se puede deshacer')

            if (name1 == true) {

                document.getElementById("txtConfirm").value = "1";

            }
            else {

                document.getElementById("txtConfirm").value = "0";
            }

        }

    </script>
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

