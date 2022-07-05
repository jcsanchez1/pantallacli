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
public class filiaDAO {

  //  TblBitacora tmp = new TblBitacora();
    TblPersonas tper = new TblPersonas();
    TblFiliales tfil = new TblFiliales();
    TblCondicionpersona tcon = new TblCondicionpersona();
    PreparedStatement ps;
    int respuesta = 0;
    String sql = "";
    ResultSet rs = null;
    Dba cn = new Dba();
    Connection con;

    public TblFiliales buscarfilia(int id) throws SQLException {
        int valor = 0;

        sql = "SELECT\n"
                + "tbl_filiales.idfilial,\n"
                + "tbl_filiales.nombrefilial\n"
                + "FROM\n"
                + "tbl_filiales\n"
                + "WHERE\n"
                + "tbl_filiales.idfilial =" + id + ";";

        try {
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            tfil.setIdfilial(rs.getInt("idfilial"));
            tfil.setNombrefilial(rs.getString("nombrefilial"));
            
        }
        } catch (Exception e) {
        } finally {
            cn.desconectar();
        }
        return tfil;
    }
}
