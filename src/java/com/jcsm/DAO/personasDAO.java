/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jcsm.DAO;

import com.jcsm.configuracion.Dba;
import com.jcsm.configuracion.helpers;
import com.jcsm.entidades.TblCondicionpersona;
import com.jcsm.entidades.TblFiliales;
import com.jcsm.entidades.TblPersonas;
import com.jcsm.entidades.TblRoles;
//import com.jcsm.entidades.seguridad.TblBitacora;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author juanc
 */
public class personasDAO {

    // TblBitacora tmp = new TblBitacora();
    TblPersonas tper = new TblPersonas();
    TblCondicionpersona tcon = new TblCondicionpersona();
    PreparedStatement ps;
    int respuesta = 0;
    String sql = "";
    ResultSet rs = null;
    Dba cn = new Dba();
    Connection con;
    helpers hlp = new helpers();

    public Boolean esterceraedad(TblPersonas per) throws Exception {
        sql = "SELECT TIMESTAMPDIFF(YEAR,fechanacimiento,CURDATE()) AS edad FROM tbl_personas where id=" + per.getId() + ";";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("edad");
        }
        Boolean res;
        res = respuesta >= 60;
        return res;
    }

    public int obteneredad(TblPersonas per) throws Exception {
        respuesta = 0;
        sql = "SELECT TIMESTAMPDIFF(YEAR,fechanacimiento,CURDATE()) AS edad FROM tbl_personas where id=" + per.getId() + ";";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("edad");
        }
        return respuesta;
    }
//0 sin condicion
    // 2 embarazada y discapacidad
    // 3 discapacidad
    //4 embarazada
    //5 tercera edad
    //7 tercera edad embarazada y discapacitada
    //8 tercera edad  discapacidad
    //9 tercera edad y embarazada

    public int obtenercondicion(TblPersonas per) throws Exception {
        respuesta = 0;
        sql = "SELECT\n"
                + "(IFNULL(tbl_condicionpersona.discapacidad,3) +\n"
                + "IFNULL(tbl_condicionpersona.embarazado,2)) as total\n"
                + "FROM\n"
                + "tbl_condicionpersona\n"
                + "WHERE idpersona=" + per.getId() + ";";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("total");
        }
        if (esterceraedad(per)) {
            respuesta = +5;

        }
        return respuesta;
    }

    public int insertarafiliado(TblPersonas per) throws SQLException {
        int valor = 0;

        sql = "INSERT INTO serafil2022.tbl_personas(idafiliacion, nombre, apellido, telefono, email, password, idrol, fechacreacion, fechamodificacion, estado, fechanacimiento, id_filial, genero, foto) VALUES ("
                + per.getIdafiliacion() + " , '" + per.getNombre() + "' , '" + per.getApellido() + "' , " + per.getTelefono() + " , '" + per.getEmail() + "' , '" + per.getPassword() + "' ," + per.getIdrol() + ", CURRENT_DATE() , CURRENT_DATE() , 1 , '" + per.getFechanacimiento() + "' , 1 , '" + per.getGenero() + "' , '" + per.getFoto() + "');";

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
/***
 * 
 * @param id
 * @return
 * @throws Exception 
 */
    public Boolean existedni(String id) throws Exception {
        sql = "SELECT tbl_personas.id  as cantidad FROM tbl_personas where idafiliacion =" + id + ";";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        Boolean res;
        res = respuesta >= 1;
        return res;
    }
/***
 * 
 * @param dni
 * @return
 * @throws Exception 
 */
    public int obtenerid(String dni) throws Exception {
        sql = "SELECT id as cantidad FROM tbl_personas where idafiliacion =" + dni + ";";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        return respuesta;
    }
}
