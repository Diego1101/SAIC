﻿using System;
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

    public int Id, Rol, Id_Sucursal, Folio, Sexo;
    public string Nombre, Apellido, Usuario, Contra, Foto, Dir, Telefono, Correo, Seguro;
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

    public clsEmpleado(int id, string cn)
    {
        Id = id;

        Id = id;
        List<clsServicio> res = new List<clsServicio>();

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("SELECT * FROM EMPLEADO WHERE EM_ID = " + id.ToString() + "", cnn);


        cmd.CommandType = CommandType.Text;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr.GetValue(0) != null)
            {
                //if (dr.GetValue(0) != null) Emp = int.Parse(dr.GetValue(0).ToString());
                Nombre = dr.GetValue(3).ToString();
                Apellido = dr.GetValue(4).ToString();
                Usuario = dr.GetValue(5).ToString();
                Contra = dr.GetValue(6).ToString();
                Foto = dr.GetValue(7).ToString();
                Sexo = int.Parse(dr.GetValue(8).ToString());
                Cumple = DateTime.Parse(dr.GetValue(9).ToString());
                Dir = dr.GetValue(10).ToString();
                Telefono = dr.GetValue(11).ToString();
                Correo = dr.GetValue(12).ToString();
                Seguro = dr.GetValue(13).ToString();
                //Fecha_Reg = DateTime.Parse(dr.GetValue(14).ToString());
            }
        }
        cnn.Close();

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
        cmd = new SqlCommand("TSP_mostrarServiciosTec", cnn);

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
                obj.Id = int.Parse(dr.GetValue(0).ToString());
                obj.IdMaquina = int.Parse(dr.GetValue(1).ToString());
                obj.Tipo = int.Parse(dr.GetValue(2).ToString());
                obj.Desc = dr.GetValue(3).ToString();
                obj.Fecha_inicio = DateTime.Parse(dr.GetValue(4).ToString());
                obj.Modelo = dr.GetValue(5).ToString();
                obj.Dir = dr.GetValue(6).ToString();
                obj.Nombre = dr.GetValue(7).ToString();
                obj.Folio = int.Parse(dr.GetValue(8).ToString());
                obj.Maquina = new clsMaquina(obj.IdMaquina, cn);
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

    public string actualizar(string cn)
    {
        string res = "";

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_ACTUALIZAREMPLEADO", cnn);

        SqlParameter nId = cmd.Parameters.Add("@ID_EMP", SqlDbType.Int);
        SqlParameter nNom = cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 20);
        SqlParameter nAp = cmd.Parameters.Add("@AP", SqlDbType.NVarChar, 20);
        SqlParameter nSx = cmd.Parameters.Add("@SEXO", SqlDbType.Int);
        SqlParameter nDir = cmd.Parameters.Add("@DIR", SqlDbType.NVarChar, 250);
        SqlParameter nTel = cmd.Parameters.Add("@TEL", SqlDbType.NVarChar, 20);
        SqlParameter nCorreo = cmd.Parameters.Add("@CORREO", SqlDbType.NVarChar, 150);
        SqlParameter nFoto = cmd.Parameters.Add("@FOTO", SqlDbType.NVarChar, 300);

        cmd.CommandType = CommandType.StoredProcedure;
       
        nId.Value = Id;
        nNom.Value = Nombre;
        nAp.Value = Apellido;
        nSx.Value = Sexo;
        nDir.Value = Dir;
        nTel.Value = Telefono;
        nCorreo.Value = Correo;
        nFoto.Value = Foto;

        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            res = dr.GetValue(0).ToString();
        }
        cnn.Close();
        return res;
    }

    public string cmbContra(string ant, string nv, string cn)
    {
        string res = "";

        cnn = new SqlConnection(cn);
        cmd = new SqlCommand("TSP_CAMBIARCONTRAEMP", cnn);

        SqlParameter nId = cmd.Parameters.Add("@ID", SqlDbType.Int);
        SqlParameter nNom = cmd.Parameters.Add("@ANT", SqlDbType.NVarChar, 50);
        SqlParameter nAp = cmd.Parameters.Add("@NV", SqlDbType.NVarChar, 50);

        cmd.CommandType = CommandType.StoredProcedure;

        nId.Value = Id;
        nNom.Value = ant;
        nAp.Value = nv;
        

        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            res = dr.GetValue(0).ToString();
        }
        cnn.Close();
        return res;
    }

    
    public List<clsSolicitud> listarSolicitudes(string cn)
    {
        List<clsSolicitud> solicitudes = new List<clsSolicitud>();

        cnn = new SqlConnection(cn);
        //cmd = new SqlCommand("SELECT CN_FOLIO FOLIO, RN_NUMCOPIAS COPIAS, MQ_MODELO MODELO  FROM CONTRATO, RENTA, MAQUINA WHERE CN_TIPO = 2 AND CN_ESTATUS = 1 AND CN_ID_CLI = "+Id.ToString()+" AND RN_ID_CONTRATO = CN_ID AND RN_ID_MQ = MQ_ID", cnn);
        cmd = new SqlCommand("SELECT SL_ID ID, SL_FOLIO, SL_NOMBRE, SL_ESTATUS, SL_DESCRIPCION, SR_FOLIO FROM SOLICITUD, SERVICIO WHERE SL_ID_SERV=SR_ID AND SR_ID_EMP= " + Id.ToString(), cnn);

        cmd.CommandType = CommandType.Text;


        cnn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            string res = dr.GetValue(0).ToString();
            if (res != "0")
            {
                clsSolicitud obj = new clsSolicitud();
                obj.slid= int.Parse(dr.GetValue(0).ToString());
                obj.folio= int.Parse(dr.GetValue(1).ToString());
                obj.nombre = dr.GetValue(2).ToString();
                obj.estatus= int.Parse(dr.GetValue(3).ToString());
                obj.descripcion= dr.GetValue(4).ToString();
                solicitudes.Add(obj);
            }
        }
        cnn.Close();

        return solicitudes;
    }

    public DataSet listarTipR(string con)
    {
        da = new SqlDataAdapter("TSP_TipoEmpleado", con);
        ds = new DataSet();
        da.Fill(ds, "RolLista");
        return ds;
    }

    public string regCliente(string con)
    {
        string res = "";

        cnn = new SqlConnection(con);
        cmd = new SqlCommand("TSP_InsertarEmp", cnn);

        SqlParameter nNom = cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 20);
        SqlParameter nAp = cmd.Parameters.Add("@APELLIDO", SqlDbType.NVarChar, 20);
        SqlParameter nUs = cmd.Parameters.Add("@USU", SqlDbType.NVarChar, 15);
        SqlParameter nCn = cmd.Parameters.Add("@CONTRA", SqlDbType.NVarChar, 15);
        SqlParameter nFoto = cmd.Parameters.Add("@FOTO", SqlDbType.NVarChar, 300);
        SqlParameter nSx = cmd.Parameters.Add("@SEXO", SqlDbType.Int);
        SqlParameter nCumple = cmd.Parameters.Add("@CUMPLE", SqlDbType.DateTime, 60);
        SqlParameter nDr = cmd.Parameters.Add("@DIRECCION", SqlDbType.NVarChar, 60);
        SqlParameter nSeg = cmd.Parameters.Add("@SEGURO", SqlDbType.NVarChar, 30);
        SqlParameter nRol = cmd.Parameters.Add("@ROL", SqlDbType.Int);
        SqlParameter nTel = cmd.Parameters.Add("@TELEFONO", SqlDbType.NVarChar, 12);
        SqlParameter nCorreo = cmd.Parameters.Add("@CORREO", SqlDbType.NVarChar, 150);

        cmd.CommandType = CommandType.StoredProcedure;

        nNom.Value = Nombre;
        nAp.Value = Apellido;
        nUs.Value = Usuario;
        nCn.Value = Contra;
        nFoto.Value = Foto;
        nSx.Value = Sexo;
        nCumple.Value = Cumple;
        nDr.Value = Dir;
        nSeg.Value = Seguro;
        nRol.Value = Rol;
        nTel.Value = Telefono;
        nCorreo.Value = Correo;

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