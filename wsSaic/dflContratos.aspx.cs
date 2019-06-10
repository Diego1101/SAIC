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
//eres una perra Diego
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
}