/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jcsm.DAO;

import com.jcsm.configuracion.Dba;
import com.jcsm.entidades.TblCondicionpersona;
import com.jcsm.entidades.TblFiliales;
import com.jcsm.entidades.TblPersonas;
import com.jcsm.entidades.TblRoles;
import com.jcsm.entidades.TblServicios;
import com.jcsm.entidades.TblTurnos;
//import com.jcsm.entidades.seguridad.TblBitacora;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

/**
 *
 * @author juanc
 */
public class servicioDAO {

    //TblBitacora tmp = new TblBitacora();
    TblServicios tser = new TblServicios();
    TblPersonas tper = new TblPersonas();
    TblFiliales tfil = new TblFiliales();
    TblCondicionpersona tcon = new TblCondicionpersona();
    PreparedStatement ps;
    int respuesta = 0;
    String sql = "";
    ResultSet rs = null;
    Dba cn = new Dba();
    Connection con;

    public TblServicios buscarfilia(int id) throws SQLException {
        int valor = 0;

        sql = "SELECT\n"
                + "tbl_servicios.idservicios,\n"
                + "tbl_servicios.servicio\n"
                + "FROM\n"
                + "tbl_servicios\n"
                + "WHERE\n"
                + "tbl_servicios.idservicios =" + id + ";";

        try {
            rs = cn.ejecutarConsultaprograma(sql);
            while (rs.next()) {
                tser.setIdservicios(rs.getInt("idservicios"));
                tser.setServicio(rs.getString("servicio"));


            }
        } catch (Exception e) {
        } finally {
            cn.commit();
            cn.desconectar();
        }
        return tser;
    }
}
