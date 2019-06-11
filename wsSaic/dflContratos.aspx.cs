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
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            llenardropMaquina();
            llenardropCliente();
            llenardropTipoVen();
        }
    }

    protected void btnCargar_Click(object sender, EventArgs e)
    {
        if (fluCargar.HasFile)
        {
            string FolderPath = Server.MapPath("~/Archivos_PDF/");
            fluCargar.SaveAs(FolderPath + fluCargar.FileName);
            Session["nomArchivo"] = "/Archivos_PDF/" + fluCargar.FileName;
        }
        else
        {
            Session["nomArchivo"] = "dflIframe.aspx";
            Response.Write("<script language='javascript'>alert('Es necesario seleccionar un archivo');</script>");
        }
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

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}