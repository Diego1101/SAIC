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
    public int Id, Precio, Tipo, Estatus;
    public string Contrato, Desc, Modelo, Calle, Numero, Ciudad, DEstado, Cp, Nombre;
    public DateTime Fecha, FechaCorte;

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

    
    public string InsertarContrato(string con, string cod, int tipo, int mar, int prove, string nom, string presen, string descrip, int uni, float cost, string fotografia)
    {
        resulConsulta = "";
        cnn = new SqlConnection(con); //crea conexion ado
        cmd = new SqlCommand("TSP_InsertarProducto", cnn);
        //paramtros del procedimiento
        SqlParameter codigo = cmd.Parameters.Add("@CODI", SqlDbType.VarChar, 60);
        SqlParameter tip = cmd.Parameters.Add("@TIPO", SqlDbType.Int, 4);
        SqlParameter marca = cmd.Parameters.Add("@MARCA", SqlDbType.VarChar, 60);
        SqlParameter prov = cmd.Parameters.Add("@PROOV", SqlDbType.VarChar, 60);
        SqlParameter name = cmd.Parameters.Add("@NOMB", SqlDbType.VarChar, 60);
        SqlParameter presenta = cmd.Parameters.Add("@PRESS", SqlDbType.VarChar, 60);
        SqlParameter descr = cmd.Parameters.Add("@DESC", SqlDbType.VarChar, 60);
        SqlParameter unida = cmd.Parameters.Add("@UNID", SqlDbType.VarChar, 60);
        SqlParameter cos = cmd.Parameters.Add("@COSTO", SqlDbType.NVarChar, 60);
        SqlParameter imag = cmd.Parameters.Add("@IMG", SqlDbType.VarChar, 60);
        cmd.CommandType = CommandType.StoredProcedure;
        codigo.Value = cod; tip.Value = tipo; marca.Value = mar; prov.Value = prove; name.Value = nom; presenta.Value = presen; descr.Value = descrip; unida.Value = uni; cos.Value = cost; imag.Value = fotografia;
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
}