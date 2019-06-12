﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clsRenta
/// </summary>
public class clsRenta
{
    public int Maquina, Contrato, Nocopia;
    public string Direccion;
    public DateTime Fecha, FechaCorte;
    public float costo, costoEx;

    public SqlConnection cnn;
    SqlCommand cmd;
    SqlDataReader dr;
    public SqlDataAdapter da;
    DataSet ds;
    string resulConsulta = "";


    public clsRenta()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    ~clsRenta()
    {

    }


    //corregir NO SIRVE (no recibe la variable de maquina)
    public string InsertarRenta(string con, int maq, int contra, float costo, float costoEx, string dir, DateTime fechVen, int nocop)
    {
        resulConsulta = "";
        cnn = new SqlConnection(con); //crea conexion ado
        cmd = new SqlCommand("TSP_InsertarRenta", cnn);
        //paramtros del procedimiento

        SqlParameter maqui = cmd.Parameters.Add("@MAQUINA", SqlDbType.Int);
        SqlParameter cont = cmd.Parameters.Add("@CONTRATO", SqlDbType.Int);
        SqlParameter cos = cmd.Parameters.Add("@COSTO", SqlDbType.NVarChar, 60);
        SqlParameter cosEx = cmd.Parameters.Add("@COSTOEXTRA", SqlDbType.NVarChar, 60);
        SqlParameter dire = cmd.Parameters.Add("@DIRECCION", SqlDbType.VarChar, 100);
        SqlParameter fechaVenci = cmd.Parameters.Add("@FECHCORTE", SqlDbType.DateTime, 60);
        SqlParameter ncop = cmd.Parameters.Add("@NOCOPIA", SqlDbType.Int);

        cmd.CommandType = CommandType.StoredProcedure;
        maqui.Value = maq; cont.Value = contra; cos.Value = costo; cosEx.Value = costoEx; dire.Value = dir; fechaVenci.Value = fechVen; ncop.Value = nocop;
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