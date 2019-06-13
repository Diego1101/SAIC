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

    public clsSolicitud()
    {

    }

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
            if (dr.GetValue(0) != null)
            {
                //if (dr.GetValue(0) != null) Emp = int.Parse(dr.GetValue(0).ToString());
                slid = int.Parse(dr.GetValue(0).ToString());
                folio = int.Parse(dr.GetValue(1).ToString());
                nombre = dr.GetValue(2).ToString();
                descripcion = dr.GetValue(3).ToString();
            }
        }
        cnn.Close();
    }

    ~clsSolicitud()
    {

    }

    public List<clsSolicitud> listarPendientes(string cn)
    {
        List<clsSolicitud> solicitudes = new List<clsSolicitud>();

        cnn = new SqlConnection(cn);
        //cmd = new SqlCommand("SELECT CN_FOLIO FOLIO, RN_NUMCOPIAS COPIAS, MQ_MODELO MODELO  FROM CONTRATO, RENTA, MAQUINA WHERE CN_TIPO = 2 AND CN_ESTATUS = 1 AND CN_ID_CLI = "+Id.ToString()+" AND RN_ID_CONTRATO = CN_ID AND RN_ID_MQ = MQ_ID", cnn);
        cmd = new SqlCommand("SELECT * FROM SOLICITUD WHERE SL_ESTATUS = 1", cnn);

        cmd.CommandType = CommandType.Text;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            string res = dr.GetValue(0).ToString();
            if (res != "0")
            {
                clsSolicitud obj = new clsSolicitud(int.Parse(res), cn);
                solicitudes.Add(obj);
            }
        }
        cnn.Close();
        
        return solicitudes;
    }

    public void negar(string mot, string cn)
    {
        string des = descripcion + "\nMotivo: " + mot;
        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("UPDATE SOLICITUD SET SL_ESTATUS=0, SL_DESCRIPCION='"+des+"' WHERE SL_ID=" + slid.ToString(), cnn);

        cmd.CommandType = CommandType.Text;


        cnn.Open();
        dr = cmd.ExecuteReader();

        
        cnn.Close();

    }

    public void aceptar( string cn)
    {
        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("UPDATE SOLICITUD SET SL_ESTATUS=2 WHERE SL_ID=" + slid.ToString(), cnn);

        cmd.CommandType = CommandType.Text;


        cnn.Open();
        dr = cmd.ExecuteReader();


        cnn.Close();

    }
}