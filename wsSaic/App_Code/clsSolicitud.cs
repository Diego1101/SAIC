using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsSolicitud
/// </summary>
public class clsSolicitud
{

    public int slid, folio;
    public string descripcion, nombre;
    public SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    public SqlDataAdapter da;
    DataSet ds;
    string resulConsulta = "";
    public clsSolicitud(int id, string cn)
    {
        slid = id;
        List<clsServicio> res = new List<clsServicio>();

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_DATOSOLICITUD", cnn);

        SqlParameter nSol = cmd.Parameters.Add("@ID", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;

        nSol.Value = id;

        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr.GetValue(1) != null)
            {
                //if (dr.GetValue(0) != null) Emp = int.Parse(dr.GetValue(0).ToString());
                slid = int.Parse(dr.GetValue(1).ToString());
                folio = int.Parse(dr.GetValue(2).ToString());
                nombre = dr.GetValue(3).ToString();
                descripcion = dr.GetValue(4).ToString();
            }
        }
        cnn.Close();
    }
    ~clsSolicitud()
    {

    }
}