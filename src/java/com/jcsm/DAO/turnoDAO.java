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
public class turnoDAO {

    //TblBitacora tmp = new TblBitacora();
    TblPersonas tper = new TblPersonas();
    TblCondicionpersona tcon = new TblCondicionpersona();
    PreparedStatement ps;
    int respuesta = 0;
    String sql = "";
    ResultSet rs = null;
    Dba cn = new Dba();
    Connection con;

    public int insertarturno(TblTurnos tur) throws SQLException {
        int valor = 0;

        sql = "INSERT into tbl_turnos(idfilial, idpersona, correlativoturno, idservicio, idsubservicio, fechacreacion, estado, tipo)\n"
                + "VALUES(" + tur.getIdfilial().getIdfilial() + "," + tur.getIdpersona().getId() + "," + tur.getCorrelativoturno() + "," + tur.getIdservicio().getIdservicios() + ","
                + tur.getIdsubservicio().getIdsubservicio() + "," + "current_date() ," + tur.getEstado() + ",'" + tur.getTipo() + "');";

        try {
            con = cn.conectarprograma();
            valor = cn.query.executeUpdate(sql);

        } catch (Exception e) {
        } finally {
            cn.commit();
            cn.desconectar();
        }
        return valor;
    }

    public int obtenercorrelativo() throws Exception {
        respuesta = 0;
        sql = "SELECT COUNT(tbl_turnos.idfilial)+1 as cantidad FROM tbl_turnos WHERE tbl_turnos.fechacreacion = CURRENT_DATE();";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        return respuesta;
    }

    public int existeturnohoy(int id) throws Exception {
        respuesta = 0;
        sql = "SELECT COUNT(*) as cantidad FROM  tbl_turnos WHERE tbl_turnos.idpersona =" + id + " AND tbl_turnos.fechacreacion = CURRENT_DATE();";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        return respuesta;
    }
}
