using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        if(txtContra.Text != txtCConta.Text)
        {
            Response.Write("<script language ='javascript'>alert('Las contraseñas no coinciden');</script>");
            return;
        }

        clsCliente cli = new clsCliente();
        cli.Nombre = txtNombre.Text;
        cli.Apellido = txtApellido.Text;
        cli.Usuario = txtUsario.Text;
        cli.Contra = txtContra.Text;
        if (fluFoto.HasFile)
        {
            string FolderPath = Server.MapPath("~/usuarios/");
            fluFoto.SaveAs(FolderPath + fluFoto.FileName);
            lblFoto.Text = fluFoto.FileName;
        }
        cli.Foto = lblFoto.Text;
        cli.Sexo = dwlSexo.SelectedIndex;
        cli.Calle = txtCalle.Text;
        cli.Ciudad = txtCiudad.Text;
        cli.Estado = txtEstado.Text;
        cli.CP = txtCP.Text;
        cli.Correo = txtCorreo.Text;
        cli.Telefono = txtTel.Text;

        string res = cli.regCliente(Application["cnn"].ToString());
        if(res=="0") Response.Write("<script language ='javascript'>alert('El usuario ya exista');</script>");
        else Response.Write("<script language ='javascript'>alert('Cuenta creada');document.location.href='dflInSesion.aspx';</script>");


    }
}