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

    public DataSet listarServicio(string con)
    {
        da = new SqlDataAdapter("TSP_ListarServicio", con);
        ds = new DataSet();
        da.Fill(ds, "ServicioLista");
        return ds;
    }


    public string AsignaTecaServ(int emp, int serv, string cn)
    {
        string res = "-1";

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_asignaServ", cnn);

        SqlParameter nTec = cmd.Parameters.Add("@TECNICO", SqlDbType.Int);
        SqlParameter nServ = cmd.Parameters.Add("@SERVICIO", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;

        nTec.Value = emp;
        nServ.Value = serv;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            res = dr.GetValue(0).ToString();
            
        }
        cnn.Close();

        return res;
    }



}