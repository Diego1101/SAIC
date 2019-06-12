using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsVenta
/// </summary>
public class clsVenta
{

    //RECORDAR NENE QUE ESTA ES LA CLASE CONTRATO---------------°°°°°°°°°°°°°°°°°°°°°°OK59
    public int Id, Precio, Tipo, Estatus, Cliente;
    public string Folio, Contrato, Desc, Modelo, Calle, Numero, Ciudad, DEstado, Cp, Nombre;
    public DateTime Fecha, FechaCorte;
    public float costo;

    public SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    public SqlDataAdapter da;
    DataSet ds;
    string resulConsulta = "";


    public clsVenta()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    ~clsVenta()
    {

    }

    public DataSet listarTipV(string con)
    {
        da = new SqlDataAdapter("TSP_TipoVenta", con);
        ds = new DataSet();
        da.Fill(ds, "TipoLista");
        return ds;
    }

    
    public string InsertarContrato(string con, int tipo, int cliente, string folio, float costo, DateTime fechaCorte, string contrato)
    {
        resulConsulta = "";
        cnn = new SqlConnection(con); //crea conexion ado
        cmd = new SqlCommand("TSP_InsertarContrato", cnn);
        //paramtros del procedimiento
        SqlParameter tip = cmd.Parameters.Add("@TIPO", SqlDbType.Int, 4);
        SqlParameter cli = cmd.Parameters.Add("@CLIENTE", SqlDbType.Int, 4);
        SqlParameter fol = cmd.Parameters.Add("@FOLIO", SqlDbType.VarChar, 60);
        SqlParameter cos = cmd.Parameters.Add("@COSTO", SqlDbType.NVarChar, 60);
        SqlParameter fechCor = cmd.Parameters.Add("@FECHCORTE", SqlDbType.DateTime, 60);
        SqlParameter contra = cmd.Parameters.Add("@CONTRATO", SqlDbType.VarChar, 1000);
        cmd.CommandType = CommandType.StoredProcedure;
        tip.Value = tipo; cli.Value = cliente; fol.Value = folio; cos.Value = costo; fechCor.Value = fechaCorte; contra.Value = contrato;
        cnn.Open();
        //ejeucta el command
        dr = cmd.ExecuteReader();
        resulConsulta = "0";
        //lee los registros que devolvio el sp
        //SI READER ENTONCES WHILE 
        while (dr.Read())
        {
            resulConsulta = dr.GetValue(0).ToString();
        }
        //
        dr.Close();
        cnn.Close();
        return resulConsulta;
    }

    public DataSet listarContrato(string con)
    {
        da = new SqlDataAdapter("TSP_ListarContrato", con);
        ds = new DataSet();
        da.Fill(ds, "ContraLista");
        return ds;
    }

    
}