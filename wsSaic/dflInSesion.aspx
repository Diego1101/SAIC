<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="dflInSesion.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <br />
            <div class=" col-xs-3 col-md-offset-4"> 
                <h3 style="color: #62bfe6; text-align: center">Iniciar sesion</h3>
                <br />
                <asp:DropDownList ID="dwlTipo" runat="server" CssClass="DropDown" TabIndex="4">
                    <asp:ListItem>Cliente</asp:ListItem>
                    <asp:ListItem>Empleado</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtUsuario" runat="server" placeHolder="Usuario" CssClass="txtBox" TabIndex="1" ></asp:TextBox>
                <asp:TextBox ID="txtContra" runat="server" placeHolder="Contraseña" CssClass="txtBox" TabIndex="2"></asp:TextBox>
                <div style="text-align:right; font-size: 10px;"><p><a href="#" class="" tabindex="10">¿Olvidaste tu contraseña?</a></p></div>
                <div><asp:Button ID="btnInSesion" runat="server" Text="Iniciar Sesión" TabIndex="3" CssClass="btn btnSesion" OnClick="btnInSesion_Click"/></div>
                <h8>¿No tienes cuenta? Registrate <a href="#" class="">aqui</a></h8>
            </div>
            
        </div>
    </div>
    <br />
    <br />
</asp:Content>

