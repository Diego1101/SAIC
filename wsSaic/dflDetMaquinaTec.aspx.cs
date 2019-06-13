using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    DataSet dsFrm;
    clsEmpleado objDatos = new clsEmpleado();
    int Id;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            Id = int.Parse(Request.QueryString["id"]);
        }
        catch (Exception ex)
        {
            btnBorrar.Visible = false;
            imgFoto.ImageUrl = "ImgDef/Usuario.jpg";
            Id = 0;
        }

        if (!IsPostBack)
        {
            llenardropTecnico();
            try
            {

                Id = int.Parse(Request.QueryString["id"]);
                clsMaquina mq = new clsMaquina(Id, Application["cnn"].ToString());
                txtNoSerie.Text = mq.NoSerie;
                txtModelo.Text = mq.Modelo;
                lblFoto.Text = mq.Foto;
                imgFoto.ImageUrl = "IMGMAQUINAS/" + mq.Foto;
                txtDesc.Text = mq.Desc;


                dwlTecnico.SelectedValue = mq.Emp.ToString();

                txtContador.Text = mq.Contador.ToString();
                txtPrecio.Text = mq.Precio.ToString();

            }
            catch (Exception ex)
            {
                Id = 0;
            }



        }
    }

    void llenardropTecnico()
    {
        dsFrm = new DataSet();
        dsFrm = objDatos.listarTecnico(Application["cnn"].ToString());
        dwlTecnico.DataSource = dsFrm;
        dwlTecnico.DataMember = "TecnicoLista";
        dwlTecnico.DataValueField = "ID";
        dwlTecnico.DataTextField = "NOMBRE";
        dwlTecnico.DataBind();
        dwlTecnico.Items.Insert(0, "--Selecciona al técnico--");
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        if (dwlTecnico.SelectedIndex == 0)
        {
            Response.Write("<script language ='javascript'>alert('No se selecciono un tecnico');</script>");
            return;
        }
        clsMaquina mq = new clsMaquina();

        mq.Id = Id;

        mq.Emp = int.Parse(dwlTecnico.SelectedValue);
        mq.Modelo = txtModelo.Text;
        mq.NoSerie = txtNoSerie.Text;
        mq.Precio = float.Parse(txtPrecio.Text);
        mq.Desc = txtDesc.Text;
        mq.Ult = txtUltS.Text;
        mq.Contador = int.Parse(txtContador.Text);
        if (fluFoto.HasFile)
        {
            string FolderPath = Server.MapPath("~/IMGMAQUINAS/");
            fluFoto.SaveAs(FolderPath + fluFoto.FileName);
            lblFoto.Text = fluFoto.FileName;
        }
        mq.Foto = lblFoto.Text;

        string res = mq.AM(Application["cnn"].ToString());
        if (res == "1") Response.Write("<script language ='javascript'>alert('Maquina agregada');</script>");
        else if (res == "2") Response.Write("<script language ='javascript'>alert('Maquina modificada');</script>");
        else Response.Write("<script language ='javascript'>alert('Error');</script>");

    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        if (txtConfirm.Text == "1")
        {
            clsMaquina mq = new clsMaquina(Id, Application["cnn"].ToString());
            mq.borrar(Application["cnn"].ToString());
            Response.Write("<script language ='javascript'>alert('Borrado');document.location.href='dflInvMaquinas.aspx';</script>");
        }
        else
        {
            Response.Write("<script language ='javascript'>alert('Cancelado');</script>");
        }

    }
}