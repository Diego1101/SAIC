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
    clsEmpleado objEmp = new clsEmpleado();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            llenardropTipoEmp();
        }
        
    }

    void llenardropTipoEmp()
    {
        dsFrm = new DataSet();
        dsFrm = objEmp.listarTipR(Application["cnn"].ToString());
        dpdwRol.DataSource = dsFrm;
        dpdwRol.DataMember = "RolLista";
        dpdwRol.DataValueField = "ID";
        dpdwRol.DataTextField = "NOMBRE";
        dpdwRol.DataBind();
        dpdwRol.Items.Insert(0, "--Selecciona rol--");

    }
}