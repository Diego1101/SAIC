using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    clsEmpleado Emp;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Emp = new clsEmpleado(int.Parse(Session["ID"].ToString()), Application["cnn"].ToString());
            txtNombre.Text = Emp.Nombre;
            txtApellido.Text = Emp.Apellido;
            dwlSexo.SelectedIndex = Emp.Sexo;
            txtDireccion.Text = Emp.Dir;
            txtTel.Text = Emp.Telefono;
            txtCorreo.Text = Emp.Correo;
            if (Emp.Foto != "")
            {
                imgFoto.ImageUrl = "empleados/" + Emp.Foto;
                lblFoto.Text = Emp.Foto;
            }
        }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Emp = new clsEmpleado();
        Emp.Id = int.Parse(Session["ID"].ToString());
        Emp.Nombre= txtNombre.Text;
        Emp.Apellido=txtApellido.Text;
        Emp.Sexo= dwlSexo.SelectedIndex;
        Emp.Dir= txtDireccion.Text;
        Emp.Telefono= txtTel.Text;
        Emp.Correo=txtCorreo.Text;
        Emp.Foto = lblFoto.Text;
        if (fluFoto.HasFile)
        {
            string FolderPath = Server.MapPath("~/empleados/");
            fluFoto.SaveAs(FolderPath + fluFoto.FileName);
            Emp.Foto = fluFoto.FileName;
        }
        Emp.actualizar(Application["cnn"].ToString());
        Response.Write("<script language ='javascript'>alert('Datos modificados');</script>");

    }

    protected void btnCambiar_Click(object sender, EventArgs e)
    {
        Emp = new clsEmpleado();
        Emp.Id = int.Parse(Session["ID"].ToString());
        if(txtCAnt.Text!="" && txtContra.Text != "" && txtContra.Text == txtCContra.Text)
        {
            string res=Emp.cmbContra(txtCAnt.Text, txtContra.Text, Application["cnn"].ToString());
            if (res == "0") Response.Write("<script language ='javascript'>alert('Contraseña incorrecta');</script>");
            else Response.Write("<script language ='javascript'>alert('Contraseña cambiada');</script>");
        }
        else Response.Write("<script language ='javascript'>alert('Datos incorrectos');</script>");
    }
}