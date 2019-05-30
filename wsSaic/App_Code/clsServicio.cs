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

    public int Id, Maquina, Empleado, Tipo, Estatus, Folio;
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

    public string solicitudRefaccion(int id, string pieza, string desc, string cn)
    {
        string res="-1";

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_AGREGARSOLICITUD", cnn);

        SqlParameter nId = cmd.Parameters.Add("@ID_SERV", SqlDbType.Int);
        SqlParameter nPieza = cmd.Parameters.Add("@PIEZA", SqlDbType.NVarChar, 200);
        SqlParameter nDesc = cmd.Parameters.Add("@DESC", SqlDbType.NVarChar, 100);

        cmd.CommandType = CommandType.StoredProcedure;

        nId.Value = id;
        nPieza.Value = pieza;
        nDesc.Value = desc;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            res = dr.GetValue(0).ToString();
            
        }
        cnn.Close();

        return res;
    }


    ~clsServicio()
    {

    }
}