using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dflSolicitud : System.Web.UI.Page
{
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id =  int.Parse(Request.QueryString["id"]);
        string folio = Request.QueryString["folio"];
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtRefaccion.Text == "")
            {
                Response.Write("<script language ='javascript'>alert('No hay refaccion seleccionada');</script>");
            }
            else
            {
                clsServicio serv = new clsServicio();
                string res = serv.solicitudRefaccion(id, txtRefaccion.Text, txtNotas.Text, Application["cnn"].ToString());
                if (res == "1") Response.Write("<script language ='javascript'>alert('Agregada');</script>");
                else if (res == "0") Response.Write("<script language ='javascript'>alert('No se encontro el servicio');</script>");
                else Response.Write("<script language ='javascript'>alert('Error: "+res+"');</script>");
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script language ='javascript'>alert('ER: "+ex.Message +"');document.location.href='dflInSesion.aspx';</script>");

        }
    }
}