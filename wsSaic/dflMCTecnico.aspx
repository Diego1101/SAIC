<%@ Page Title="" Language="C#" MasterPageFile="~/mpPricipalTecnico.master" AutoEventWireup="true" CodeFile="dflMCTecnico.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <div class="row">
            <h3 style="color: rgb(98, 191, 230);">Informacion Personal</h3><br />
            <div class="grid_6">
                <div class="col-lg-5">
                    <h4>Nombre</h4>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txtBox" placeHolder="Nombre" Style="width: 90%;"></asp:TextBox>
                    <br />

                </div>
                <div class="col-lg-5">
                    <h4>Apellido</h4>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txtBox" placeHolder="Apellido"></asp:TextBox>
                    <br />
                </div>
                <div class="col-lg-12">
                    <h4>Sexo</h4>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="DropDown" Style="text-align: left; width: 50%;">
                        <asp:ListItem>Mujer</asp:ListItem>
                        <asp:ListItem>Hombre</asp:ListItem>
                        <asp:ListItem Selected="True">Otro</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                </div>


                <div class="col-lg-12">
                    <h4>Direccion</h4>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txtBox" placeHolder="Direccion"></asp:TextBox>
                </div>

                <div class="col-lg-12">
                    <h4>Teléfono</h4>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txtBox" placeHolder="Teléfono"></asp:TextBox>
                </div>

                <div class="col-lg-12">
                    <h4>Correo</h4>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="txtBox" placeHolder="Correo"></asp:TextBox>
                </div>
                <asp:Button ID="Button3" runat="server" Text="Aceptar" CssClass="btn" Style="float:right;"/>
            </div>

            <div class="grid_6">
                <br />
                <br />
                <div style="margin-left: 25%;">
                    <h4>Foto</h4>
                    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="txtBox" ImageUrl="~/ImgDef/Usuario.jpg" Width="50%" Enabled="false"/>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="Button1" runat="server" Text="Subir" CssClass="btn btn-comp"/>

                </div>
            </div>
        </div>

        <div class="row">
            <h3 style="color: rgb(98, 191, 230);">Cambio de contraseña</h3><br />
            <div class="grid_6">
               
                <h4>Antigua contraseña</h4>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="txtBox" TextMode="Password" placeHolder="Antigua contraseña"></asp:TextBox><br />
                <h4>Nueva contraseña</h4>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="txtBox" TextMode="Password" placeHolder="Nueva contraseña"></asp:TextBox><br />
                <h4>Repetir contraseña</h4>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="txtBox" TextMode="Password" placeHolder="Repetir contraseña"></asp:TextBox><br />
                <asp:Button ID="Button2" runat="server" Text="Aceptar" CssClass="btn" Style="float:right;"/>
            </div>
        </div>
    </div>
    <br /><br />
</asp:Content>

