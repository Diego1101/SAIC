using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for clsServicio
/// </summary>
public class clsServicio
{

    public int Id, Maquina, Empleado, Tipo, Estatus;
    public string Estado, Desc, Modelo, Calle, Numero, Ciudad, DEstado, Cp, Nombre;
    public DateTime Fecha_inicio, Fecha_Fin;

    SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter da;
    DataSet ds;

    public clsServicio()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    ~clsServicio()
    {

    }
}