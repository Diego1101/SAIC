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
    clsCliente objCli = new clsCliente();
    clsVenta objVen = new clsVenta();
    clsMaquina objMaq = new clsMaquina();
    clsRenta objRen = new clsRenta();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            llenardropMaquina();
            llenardropContrato();
            llenardropCliente();
            llenardropTipoVen();
        }
    }

    protected void btnCargar_Click(object sender, EventArgs e)
    {
        //if (fluCargar.HasFile)
        //{
        //    string FolderPath = Server.MapPath("~/Archivos_PDF/");
        //    fluCargar.SaveAs(FolderPath + fluCargar.FileName);
        //    Session["nomArchivo"] = "/Archivos_PDF/" + fluCargar.FileName;
        //}
        //else
        //{
        //    Session["nomArchivo"] = "dflIframe.aspx";
        //    Response.Write("<script language='javascript'>alert('Es necesario seleccionar un archivo');</script>");
        //}
    }

    void llenardropCliente()
    {
        dsFrm = new DataSet();
        dsFrm = objCli.listarCliente(Application["cnn"].ToString());
        dpdwCliente.DataSource = dsFrm;
        dpdwCliente.DataMember = "ClienteLista";
        dpdwCliente.DataValueField = "ID";
        dpdwCliente.DataTextField = "NOMBRE";
        dpdwCliente.DataBind();
        dpdwCliente.Items.Insert(0, "--Selecciona al cliente--");

    }

    void llenardropTipoVen()
    {
        dsFrm = new DataSet();
        dsFrm = objVen.listarTipV(Application["cnn"].ToString());
        dpdwRentaVenta.DataSource = dsFrm;
        dpdwRentaVenta.DataMember = "TipoLista";
        dpdwRentaVenta.DataValueField = "ID";
        dpdwRentaVenta.DataTextField = "TIPO";
        dpdwRentaVenta.DataBind();
        dpdwRentaVenta.Items.Insert(0, "--Selecciona el tipo--");

    }

    void llenardropMaquina()
    {
        dsFrm = new DataSet();
        dsFrm = objMaq.listarMaquina(Application["cnn"].ToString());
        dpdwMaquina.DataSource = dsFrm;
        dpdwMaquina.DataMember = "MaquiLista";
        dpdwMaquina.DataValueField = "ID";
        dpdwMaquina.DataTextField = "MAQUINA";
        dpdwMaquina.DataBind();
        dpdwMaquina.Items.Insert(0, "--Selecciona la máquina--");
    }

    void llenardropContrato()
    {
        dsFrm = new DataSet();
        dsFrm = objVen.listarContrato(Application["cnn"].ToString());
        dpdwContrato.DataSource = dsFrm;
        dpdwContrato.DataMember = "ContraLista";
        dpdwContrato.DataValueField = "ID";
        dpdwContrato.DataTextField = "CONTRATO";
        dpdwContrato.DataBind();
        dpdwContrato.Items.Insert(0, "--Selecciona el folio del contrato--");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string resultado = "";
        if (dpdwContrato.SelectedIndex > 0 && dpdwMaquina.SelectedIndex> 0 )
        {
            resultado = objRen.InsertarRenta(Application["cnn"].ToString(), int.Parse(dpdwMaquina.SelectedIndex.ToString()), int.Parse(dpdwContrato.SelectedIndex.ToString()),  float.Parse(txtCosto.Text), float.Parse(txtCostoExtra.Text),txtDireccion.Text, int.Parse(txtNoCopia.Text));
            if (int.Parse(resultado) > 0)
            {
                    Response.Write("<script language='javascript'>alert('La renta se insertó correctamente'); </script>");
                
            }
            else if (int.Parse(resultado) == -1)
            {
                Response.Write("<script language='javascript'>alert('Ya está en renta la máquina !'); </script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('La renta no se insertó'); </script>");
            }
        }
        else
        {
            Response.Write("<script language='javascript'>alert('Seleccione la máquina y el num. de folio de contrato'); </script>");
        }
    }

    protected void btnRegisVen_Click(object sender, EventArgs e)
    {
        string resultado = "";
        if (dpdwCliente.SelectedIndex > 0)
        {
            resultado = objVen.InsertarContrato(Application["cnn"].ToString(), int.Parse(dpdwRentaVenta.SelectedValue.ToString()), int.Parse(dpdwCliente.SelectedValue.ToString()), txtFolio.Text, float.Parse(txtPrecio.Text), DateTime.Parse(txtFechaCorte.Text), fluCargar.FileName);
            if (int.Parse(resultado) > 0)
            {
                if (fluCargar.HasFile)
                {
                    string FolderPath = Server.MapPath("~/Archivos_PDF/");
                    fluCargar.SaveAs(FolderPath + fluCargar.FileName);
                    Session["nomArchivo"] = "/Archivos_PDF/" + fluCargar.FileName;
                    Response.Write("<script language='javascript'>alert('EL contrato " + txtFolio.Text + " se insertó correctamente'); </script>");
                }
                else
                {
                    Session["nomArchivo"] = "dflIframe.aspx";
                    Response.Write("<script language='javascript'>alert('Es necesario seleccionar un archivo');</script>");
                }
            }
            else if (int.Parse(resultado) == -1)
            {
                Response.Write("<script language='javascript'>alert('EL contrato " + txtFolio.Text + " ya existe'); </script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('EL contrato " + txtFolio.Text + " NO se insertó'); </script>");
            }
        }
        else
        {
            Response.Write("<script language='javascript'>alert('Seleccione al cliente'); </script>");
        }
    }
}