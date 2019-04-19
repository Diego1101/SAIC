using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dflClSesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ID"] = -1;
        Session["Usuario"] = -1;
        Session["Rol"] = -1;
        Session["Nombre"] = -1;
        Response.Write("<script language ='javascript'>document.location.href='dflPrincipal.aspx';</script>");
    }
}