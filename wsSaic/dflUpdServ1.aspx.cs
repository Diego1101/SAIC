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
    }



    protected void btnNegar_Click(object sender, EventArgs e)
    {
        clsSolicitud sol = new clsSolicitud(id, Application["cnn"].ToString());
        sol.negar(txtMotivo.Text, Application["cnn"].ToString());
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        clsSolicitud sol = new clsSolicitud(id, Application["cnn"].ToString());
        sol.aceptar(Application["cnn"].ToString());
    }

    protected void btnBorrar_Click(object sender, EventArgs e)
    {
        if (txtMotivo.Text == "true")
        {
            clsSolicitud sol = new clsSolicitud(id, Application["cnn"].ToString());
            sol.borrar(Application["cnn"].ToString());

        }
        

    }
}