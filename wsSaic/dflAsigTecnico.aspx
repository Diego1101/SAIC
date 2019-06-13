<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipalSecretaria.master" AutoEventWireup="true" CodeFile="dflAsigTecnico.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="well1">
        <div class="container" style="align-content:center">
          <div class="row" >
              <h3 style="color: rgb(98, 191, 230);">Asignación de técnicos</h3><br />

              <div class="grid_6" style="margin-left: 22%;">
                <div class="info-box" >
                  <h2 class="fa-edit" style="align-content:center" >Solicitudes de reparación</h2>
                  <hr/>
                    <center>
                        <asp:DropDownList ID="dpdwServicio" runat="server" CssClass="DropDown" style="height:30px;">
                        </asp:DropDownList>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="dpdwTecnico" runat="server"  CssClass="DropDown" style="height:30px;">
                        </asp:DropDownList>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAsignar" runat="server" CssClass="btn" Text="Asignar" OnClientClick="mensaje()" OnClick="btnAsignar_Click" />
                    <asp:TextBox ID="txtConfirm" runat="server" ClientIDMode="Static" type="hidden"></asp:TextBox>
				        <br />
                        <br />
                    </center>
                  <hr/>
                  
                </div>
              </div>
          </div>
        </div>
    </section>

    <script>
        function mensaje() {
            
            var conf = confirm("¿Desea notificar al técnico?");
            document.getElementById("txtConfirm").value = conf;
        }
    </script>
</asp:Content>

