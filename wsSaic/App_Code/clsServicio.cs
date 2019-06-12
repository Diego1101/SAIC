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

    public int Id, IdMaquina, Empleado, Tipo, Estatus, NoServ, Contador, Folio;
    float Precio;
    public string Estado, Desc, Modelo, Dir, Nombre, Problema, Solucion;
    public DateTime Fecha_inicio, Fecha_Fin, Fecha;
    public clsMaquina Maquina;

    SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    SqlDataAdapter da;
    DataSet ds;

    public clsServicio()
    {
    }

    public clsServicio(int id, string cn)
    {
        Id = id;
        //da = new SqlDatadapter("Select", cn);
        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("SELECT * FROM SERVICIO WHERE SR_ID="+id.ToString()+"", cnn);

        cmd.CommandType = CommandType.Text;
        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            Folio = int.Parse(dr.GetValue(1).ToString());
            NoServ = int.Parse(dr.GetValue(2).ToString());
            IdMaquina = int.Parse(dr.GetValue(3).ToString());
            Empleado = int.Parse(dr.GetValue(4).ToString());
            Tipo = int.Parse(dr.GetValue(5).ToString());
            Estatus = int.Parse(dr.GetValue(6).ToString());
            Estado = dr.GetValue(7).ToString();
            Problema = dr.GetValue(8).ToString();
            Solucion = dr.GetValue(9).ToString();
            try
            {
                Precio = float.Parse(dr.GetValue(10).ToString());

            }
            catch
            {
                Precio = 0;
            }
            try
            {
                Contador = int.Parse(dr.GetValue(11).ToString());

            }
            catch
            {
                Contador = 0;
            }
            //Fecha= new DateTime( dr.GetValue(11).ToString();

        }
        cnn.Close();
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

    public string completar(string sol, string edo,int cont, string cn)
    {

        string res = "-1";
            
        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_TERMINARSERVICIO", cnn);

        SqlParameter nId = cmd.Parameters.Add("@ID_SERV", SqlDbType.Int);
        SqlParameter nPieza = cmd.Parameters.Add("@SOL", SqlDbType.NVarChar, 500);
        SqlParameter nDesc = cmd.Parameters.Add("@EDO", SqlDbType.NVarChar, 500);
        SqlParameter nCon = cmd.Parameters.Add("@CONT", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;

        nId.Value = Id;
        nPieza.Value = sol;
        nDesc.Value = edo;
        nCon.Value = cont;


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