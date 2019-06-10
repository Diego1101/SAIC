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
    clsEmpleado objDatos = new clsEmpleado();
    clsServicio objDato = new clsServicio();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //asignarTecaServ(0,0);
            llenardropServicio();
            llenardropTecnico();
        }
    }

    void llenardropTecnico()
    {
        dsFrm = new DataSet();
        dsFrm = objDatos.listarTecnico(Application["cnn"].ToString());
        dpdwTecnico.DataSource = dsFrm;
        dpdwTecnico.DataMember = "TecnicoLista";
        dpdwTecnico.DataValueField = "ID";
        dpdwTecnico.DataTextField = "NOMBRE";
        dpdwTecnico.DataBind();
        dpdwTecnico.Items.Insert(0, "--Selecciona al técnico--");
    }

    void llenardropServicio()
    {
        dsFrm = new DataSet();
        dsFrm = objDato.listarServicio(Application["cnn"].ToString());
        dpdwServicio.DataSource = dsFrm;
        dpdwServicio.DataMember = "ServicioLista";
        dpdwServicio.DataValueField = "ID";
        dpdwServicio.DataTextField = "PROBLEMA";
        dpdwServicio.DataBind();
        dpdwServicio.Items.Insert(0, "--Selecciona el servicio--");

    }

    void asignarTecaServ(int cveT, int cveS)
    {
        //dsFrm = new DataSet();
        //dsFrm = objDato.AsignaTecaServ(cveT, cveS,Application["cnn"].ToString());
        //gvproductos.DataSource = dsFrm;
        //gvproductos.DataMember = "asig";
        //gvproductos.DataBind();
    }

    protected void btnAsignar_Click(object sender, EventArgs e)
    {

        if (dpdwServicio.SelectedIndex != 0 && dpdwTecnico.SelectedIndex != 0)
        {
            clsServicio ser = new clsServicio();
            string res = ser.AsignaTecaServ(int.Parse(dpdwTecnico.SelectedValue.ToString()), int.Parse(dpdwServicio.SelectedValue.ToString()), Application["cnn"].ToString());
            if (res != "-1")
            {
                Response.Write("<script language ='javascript'>alert('Se ha asignado correctamente');</script>");
            }
            else
            {
                Response.Write("<script language ='javascript'>alert('Elige el servicio y al técnico');</script>");
            }
        }






    }
}