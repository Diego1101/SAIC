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

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        clsMaquina mq = new clsMaquina(id, Application["cnn"].ToString());
        string res=mq.solicitarServicio(txtSol.Text, Application["cnn"].ToString());
        if (res != "0")
        {
            lblRes.Text = "Servicio solicitado";
            txtSol.Enabled = false;
            btnAceptar.Enabled = false;
        }
        else lblRes.Text = "Error";
    }

}