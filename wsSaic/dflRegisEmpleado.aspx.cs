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
    DataSet dsFrm = new DataSet();
    clsEmpleado objEmp = new clsEmpleado();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            llenardropTipoEmp();
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
        else Response.Write("<script language ='javascript'>alert('Cuenta creada');document.location.href='dflInSesion.aspx';</script>");


    }
}