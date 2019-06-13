using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    clsEmpleado objEmp = new clsEmpleado();
    DataSet dsFrm = new DataSet();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            llenardropTipoEmp();
            clsEmpleado Emp = new clsEmpleado();
            string res = Emp.regCliente(Application["cnn"].ToString());
            
            txtNombre.Text = Emp.Nombre;
            txtApellido.Text = Emp.Apellido;
            dwlSexo.SelectedIndex = Emp.Sexo;
            txtDir.Text = Emp.Dir;
            txtTel.Text = Emp.Telefono;
            txtCorreo.Text = Emp.Correo;
            if (Emp.Foto != "")
            {
                imgFoto.ImageUrl = "empleados/" + Emp.Foto;
                lblFoto.Text = Emp.Foto;
            }
            
        }
        
    }

    void llenardropTipoEmp()
    {
        dsFrm = new DataSet();
        dsFrm = objEmp.listarTipR(Application["cnn"].ToString());
        dpdwRol.DataSource = dsFrm;
        dpdwRol.DataMember = "RolLista";
        dpdwRol.DataValueField = "ID";
        dpdwRol.DataTextField = "NOMBRE";
        dpdwRol.DataBind();
        dpdwRol.Items.Insert(0, "--Selecciona rol--");

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        if (txtContra.Text != txtCConta.Text)
        {
            Response.Write("<script language ='javascript'>alert('Las contraseñas no coinciden');</script>");
            return;
        }

        clsEmpleado cli = new clsEmpleado();
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
        cli.Dir = txtDir.Text;
        cli.Cumple = DateTime.Parse(txtCumple.Text);
        cli.Seguro = txtSeguroS.Text;
        cli.Rol = dpdwRol.SelectedIndex;
        cli.Correo = txtCorreo.Text;
        cli.Telefono = txtTel.Text;
        
        string res = cli.regCliente(Application["cnn"].ToString());
        if (res == "-1") Response.Write("<script language ='javascript'>alert('El usuario ya existe');</script>");
        else Response.Write("<script language ='javascript'>alert('Cuenta creada');</script>");


    }

    protected void btnEditar_Click(object sender, EventArgs e)
    {
        clsEmpleado Emp = new clsEmpleado();
        string res = Emp.regCliente(Application["cnn"].ToString());
        Emp.Id = int.Parse(res.ToString());
        Emp.Nombre = txtNombre.Text;
        Emp.Apellido = txtApellido.Text;
        Emp.Sexo = dwlSexo.SelectedIndex;
        Emp.Dir = txtDir.Text;
        Emp.Telefono = txtTel.Text;
        Emp.Correo = txtCorreo.Text;
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
}