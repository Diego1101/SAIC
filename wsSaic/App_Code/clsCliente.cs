using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for clsCliente
/// </summary>
public class clsCliente
{

    public int Id, Sexo, Rol;
    public string Nombre, Apellido, Usuario, Contra, Foto, Calle, Ciudad, Estado, CP, Correo, Telefono;
    public DateTime Cumple, FechaReg;

    SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter da;
    DataSet ds;

    public clsCliente()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    ~clsCliente()
    {

    }

    public string iniciarSesion(string usu, string contra, string cn)
    {
        string res="-1";

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_iniciarSesion", cnn);

        SqlParameter nUsu = cmd.Parameters.Add("@USU", SqlDbType.NVarChar, 15);
        SqlParameter nPas = cmd.Parameters.Add("@CONTRA", SqlDbType.NVarChar, 15);
        SqlParameter nTipo = cmd.Parameters.Add("@TIPO", SqlDbType.Int);
        
        cmd.CommandType = CommandType.StoredProcedure;
        
        nUsu.Value = usu;
        nPas.Value = contra;
        nTipo.Value = 0;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            res = dr.GetValue(0).ToString();
            if (res != "-1")
            {
                Id = int.Parse(dr.GetValue(0).ToString());
                Usuario = dr.GetValue(1).ToString();
                Nombre = dr.GetValue(2).ToString();
                Rol= int.Parse(dr.GetValue(3).ToString());

            }
        }
        cnn.Close();
        
        return res;
    }

    public DataSet listarCliente(string con)
    {
        da = new SqlDataAdapter("TSP_ListarCliente", con);
        ds = new DataSet();
        da.Fill(ds, "ClienteLista");
        return ds;
    }




}