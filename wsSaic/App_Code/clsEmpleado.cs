using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

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

    public clsEmpleado(int id)
    {
        Id = id;
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

    public List<clsServicio> serviciosEmp(int emp, int tipo, String cn)
    {
        List<clsServicio> res = new List<clsServicio>();

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_mosntrarServiciosTec", cnn);

        SqlParameter nTec = cmd.Parameters.Add("@TECNICO", SqlDbType.Int);
        SqlParameter nTipo = cmd.Parameters.Add("@TIPO", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;

        nTec.Value = emp;
        nTipo.Value = tipo;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr.GetValue(0) != null)
            {
                clsServicio obj = new clsServicio();
                obj.Id= int.Parse(dr.GetValue(0).ToString());
                obj.Maquina= int.Parse(dr.GetValue(1).ToString());
                obj.Tipo = int.Parse(dr.GetValue(2).ToString());
                obj.Desc = dr.GetValue(3).ToString();
                obj.Fecha_inicio = DateTime.Parse(dr.GetValue(4).ToString());
                obj.Modelo = dr.GetValue(5).ToString();
                obj.Calle = dr.GetValue(6).ToString();
                obj.Numero = dr.GetValue(7).ToString();
                obj.Ciudad = dr.GetValue(8).ToString();
                obj.DEstado = dr.GetValue(9).ToString();
                obj.Cp = dr.GetValue(10).ToString();
                obj.Nombre = dr.GetValue(11).ToString();
                res.Add(obj);
            }
        }
        cnn.Close();



        return res;
    }

    public DataSet listarTecnico(string con)
    {
        da = new SqlDataAdapter("TSP_ListarTecnico", con);
        ds = new DataSet();
        da.Fill(ds, "TecnicoLista");
        return ds;
    }



}