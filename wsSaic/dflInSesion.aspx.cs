using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInSesion_Click(object sender, EventArgs e)
    {

        if (txtContra.Text != "" && txtUsuario.Text != "")
        {
            if (dwlTipo.SelectedIndex == 0)
            {
                clsCliente cli = new clsCliente();
                string res = cli.iniciarSesion(txtUsuario.Text, txtContra.Text, Application["cnn"].ToString());
                if (res == "-1")
                {
                    Response.Write("<script language ='javascript'>alert('Datos incorrectos');document.location.href='dflInSesion.aspx';</script>");
                }
                else
                {
                    Session["Usuario"] = cli.Usuario;
                    Session["Nombre"] = cli.Nombre;
                    Session["Rol"] = cli.Rol;
                    Session["ID"] = cli.Id;
                    Response.Write("<script language ='javascript'>document.location.href='dflPrincipal.aspx';</script>");
                }
            }
            else
            {
                clsEmpleado emp = new clsEmpleado();
                string res = emp.iniciarSesion(txtUsuario.Text, txtContra.Text, Application["cnn"].ToString());
                if (res == "-1")
                {
                    Response.Write("<script language ='javascript'>alert('Datos incorrectos');document.location.href='dflInSesion.aspx';</script>");
                }
                else
                {
                    Session["Usuario"] = emp.Usuario;
                    Session["Nombre"] = emp.Nombre;
                    Session["Rol"] = emp.Rol;
                    Session["ID"] = emp.Id;
                    Session["Sucursal"] = emp.Id_Sucursal;
                    switch (emp.Rol)
                    {
                        case 1: //Adm
                            
                            Response.Write("<script language ='javascript'>document.location.href='dflSolicitudesAdm.aspx';</script>");
                            break;

                        case 2: //Secretaria
                            Response.Write("<script language ='javascript'>document.location.href='dflPagos.aspx';</script>");
                            break;

                        case 3://Tecnico
                            Response.Write("<script language ='javascript'>document.location.href='dflServicios.aspx';</script>");
                            break;
                        default:
                            Response.Write("<script language ='javascript'>alert('Error')</script>");
                            break;
                    }
                }
            } 
        }
        else
        {
            Response.Write("<script language ='javascript'>alert('Datos incorrectos');</script>");

        }
    }
}