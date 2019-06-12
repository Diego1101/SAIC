﻿using System;
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

   
    public string solicitarServicio(string problema, string cn)
    {
        string res = "";


        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_CREARSERVICIO", cnn);

        SqlParameter nMq = cmd.Parameters.Add("@MQ", SqlDbType.Int);
        SqlParameter nPro = cmd.Parameters.Add("@PROBLEMA", SqlDbType.NVarChar, 200);

        cmd.CommandType = CommandType.StoredProcedure;

        nMq.Value = Id;
        nPro.Value = problema;

        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            res = dr.GetValue(0).ToString();
            
        }
        cnn.Close();

        return res;
    }

    public List<clsMaquina> inventario(string cn)
    {
        List<clsMaquina> res = new List<clsMaquina>();

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("SELECT MQ_ID FROM MAQUINA WHERE MQ_ESTATUS=1", cnn);

        cmd.CommandType = CommandType.Text;

        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            res.Add(new clsMaquina(int.Parse(dr.GetValue(0).ToString()), cn));
        }
        cnn.Close();


        return res;
    }

}