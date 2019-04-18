using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for clsEmpleado
/// </summary>
public class clsEmpleado
{

    public int Id, Rol, Id_Sucursal;
    public string Nombre, Apellido, Usuario, Contra, Foto, Sexo, Dir, Telefono, Correo, Seguro;
    public DateTime Cumple, Fecha_Reg;

    SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter da;
    DataSet ds;

    public clsEmpleado()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    ~clsEmpleado()
    {

    }

    public string iniciarSesion(string usu, string contra, string cn)
    {
        string res = "-1";

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_iniciarSesion", cnn);

        SqlParameter nUsu = cmd.Parameters.Add("@USU", SqlDbType.NVarChar, 15);
        SqlParameter nPas = cmd.Parameters.Add("@CONTRA", SqlDbType.NVarChar, 15);
        SqlParameter nTipo = cmd.Parameters.Add("@TIPO", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;

        nUsu.Value = usu;
        nPas.Value = contra;
        nTipo.Value = 1;


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
                Rol = int.Parse(dr.GetValue(3).ToString());
                Id_Sucursal = int.Parse(dr.GetValue(4).ToString());
            }
        }
        cnn.Close();

        return res;
    }

}