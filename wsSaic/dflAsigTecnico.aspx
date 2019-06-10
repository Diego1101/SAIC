<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipalSecretaria.master" AutoEventWireup="true" CodeFile="dflAsigTecnico.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="well1">
        <div class="container" style="align-content:center">
          <div class="row" >
              <h3 style="color: rgb(98, 191, 230);">Asignación de técnicos</h3><br />

              <div class="grid_6">
                <div class="info-box" >
                  <h2 class="fa-edit" style="align-content:center" >Solicitudes de reparación</h2>
                  <hr/>
                    <center>
                        <asp:DropDownList ID="dpdwServicio" runat="server">
                        </asp:DropDownList>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="dpdwTecnico" runat="server">
                        </asp:DropDownList>
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAsignar" runat="server" CssClass="btn" Text="Asignar" OnClick="btnAsignar_Click" />
				        <br />
                        <br />
                    </center>
                  <hr/>
                  
                </div>
              </div>
          </div>
        </div>
    </section>

</asp:Content>

