using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for clsMaquina
/// </summary>
public class clsMaquina
{


    public int Id, Emp, Inv, Contador, Estatus;
    public string Modelo, NoSerie, Desc, Foto;
    public float Precio;
    

    public SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    public SqlDataAdapter da;
    DataSet ds;
    string resulConsulta = "";

    public clsMaquina()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public clsMaquina(int id, string cn)
    {
        Id = id;
        List<clsServicio> res = new List<clsServicio>();

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_DATOSMAQUINA", cnn);

        SqlParameter nTec = cmd.Parameters.Add("@ID_MQ", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;

        nTec.Value = id;

        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr.GetValue(1) != null)
            {
                //if (dr.GetValue(0) != null) Emp = int.Parse(dr.GetValue(0).ToString());
                Inv = int.Parse(dr.GetValue(1).ToString());
                Modelo = dr.GetValue(2).ToString();
                NoSerie = dr.GetValue(3).ToString();
                Estatus = int.Parse(dr.GetValue(4).ToString());
                Precio = float.Parse(dr.GetValue(5).ToString());
                Desc = dr.GetValue(6).ToString();
                Contador = int.Parse(dr.GetValue(7).ToString());
                Foto = dr.GetValue(8).ToString();
            }
        }
        cnn.Close();
    }

    public DataSet listarMaquina(string con)
    {
        da = new SqlDataAdapter("TSP_ListarMaquina", con);
        ds = new DataSet();
        da.Fill(ds, "MaquiLista");
        return ds;
    }

    

}