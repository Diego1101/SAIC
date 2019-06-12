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
        Emp = new clsEmpleado(int.Parse(Session["ID"].ToString()), Application["cnn"].ToString());
        txtNombre.Text = Emp.Nombre;
        txtApellido.Text = Emp.Apellido;
        dwlSexo.SelectedIndex = Emp.Sexo;
        txtDireccion.Text = Emp.Dir;
        txtTel.Text = Emp.Telefono;
        txtCorreo.Text = Emp.Correo;
        if (Emp.Foto != "") imgFoto.ImageUrl = "empleados/"+Emp.Foto;
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        Emp.Nombre= txtNombre.Text;
        Emp.Apellido=txtApellido.Text;
        Emp.Sexo= dwlSexo.SelectedIndex;
        Emp.Dir= txtDireccion.Text;
        Emp.Telefono= txtTel.Text;
        Emp.Correo=txtCorreo.Text;
        if (fluFoto.HasFile)
        {
            string FolderPath = Server.MapPath("~/empleados/");
            fluFoto.SaveAs(FolderPath + fluFoto.FileName);
            Emp.Foto = fluFoto.FileName;
        }
    }
}