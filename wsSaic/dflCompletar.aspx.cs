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
        clsServicio Serv = new clsServicio(id, Application["cnn"].ToString());

        if (fluArchivo.HasFile)
        {
            string FolderPath = Server.MapPath("~/Servicios/");
            fluArchivo.SaveAs(FolderPath + fluArchivo.FileName);
            lblArchivo.Text = fluArchivo.FileName;
        }
        Serv.completar(txtSol.Text, lblArchivo.Text, int.Parse(txtContador.Text), Application["cnn"].ToString());
        Response.Write("<script language ='javascript'>document.location.href='dflServicio.aspx';</script>");

    }

}