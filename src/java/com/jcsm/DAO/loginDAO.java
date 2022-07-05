/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jcsm.DAO;

import com.jcsm.configuracion.Dba;
import com.jcsm.configuracion.helpers;
import com.jcsm.entidades.TblFiliales;
import com.jcsm.entidades.TblPersonas;
import com.jcsm.entidades.TblRoles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author juanc
 */
public class loginDAO {

    TblPersonas tmp = new TblPersonas();
    TblRoles tmpr = new TblRoles();
    TblFiliales tmpf = new TblFiliales();
    int respuesta = 0;
    String sql = "";
    ResultSet rs = null;
    Dba cn = new Dba();
    PreparedStatement ps;
    Connection con;
    helpers hlp = new helpers();

    /**
     * *
     *
     * @param tp
     * @return
     * @throws Exception
     */
    public int validarlogin(TblPersonas tp) throws Exception {
        sql = "select count(id) as cantidad from tbl_personas where email='" + tp.getEmail() + "' and password='" + tp.getPassword() + "'  and estado=1";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        return respuesta;
    }

    /**
     *
     * @param tp
     * @return
     * @throws Exception
     */
    public int intentosfallidos(TblPersonas tp) throws Exception {
        sql = "SELECT\n"
                + "COUNT(tbl_intentoslogin.idintento) AS cantidad \n"
                + "FROM\n"
                + "tbl_intentoslogin\n"
                + "WHERE\n"
                + "tbl_intentoslogin.correcto = '" + tp.getEmail() + "' AND tbl_intentoslogin.fechacreacion = CURDATE()";

        rs = cn.ejecutarConsultabitacora(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        return respuesta;
    }

    /**
     *
     * @param tp
     * @return
     * @throws Exception
     */
    public TblPersonas Traerdatos(TblPersonas tp) throws Exception {
        sql = "SELECT\n"
                + "tbl_personas.id,\n"
                + "CONCAT(tbl_personas.nombre, \" \",\n"
                + "tbl_personas.apellido) as nombre,\n"
                + "tbl_personas.telefono,\n"
                + "tbl_personas.email,\n"
                + "tbl_personas.idrol,\n"
                + "tbl_personas.fechanacimiento,\n"
                + "tbl_personas.id_filial,\n"
                + "tbl_personas.genero,\n"
                + "tbl_personas.foto,\n"
                + "tbl_roles.nombrerol,\n"
                + "tbl_filiales.nombrefilial\n"
                + "FROM\n"
                + "tbl_personas\n"
                + "INNER JOIN tbl_roles ON tbl_personas.idrol = tbl_roles.idrol\n"
                + "INNER JOIN tbl_filiales ON tbl_personas.id_filial = tbl_filiales.idfilial where email='" + tp.getEmail() + "' and password='" + tp.getPassword() + "'";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            tmp.setId(rs.getInt("id"));
            tmp.setNombre(rs.getString("nombre"));
            tmp.setTelefono(rs.getInt("telefono"));
            tmp.setEmail(rs.getString("email"));
            tmpr.setIdrol(rs.getInt("idrol"));
            tmpr.setNombrerol(rs.getString("nombrerol"));
            tmp.setIdrol(tmpr);
            tmp.setFechanacimiento(rs.getDate("fechanacimiento"));
            tmpf.setIdfilial(rs.getInt("id_filial"));
            tmp.setIdFilial(tmpf);
            tmpf.setNombrefilial(rs.getString("nombrefilial"));
            tmp.setGenero(rs.getString("genero"));
            tmp.setFoto(rs.getString("foto"));

        }
        return tmp;

    }

    /**
     *
     * @param email
     * @return
     * @throws Exception
     */
    public int existecorreo(String email) throws Exception {
        sql = "SELECT COUNT(id) as cantidad  FROM tbl_personas WHERE email = '" + email + "' and estado=1";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        return respuesta;
    }

    /**
     *
     * @param token
     * @param email
     * @return
     * @throws SQLException
     */
    public int insertartoken(String token, String email) throws SQLException {
        int valor = 0;

        sql = "UPDATE tbl_personas SET token_recovery = '" + token + "' WHERE email = '" + email + "';";

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

    /**
     *
     * @param email
     * @param token
     * @param pass
     * @return
     * @throws SQLException
     */
    public int cambiarpassword(String email, String token, String pass) throws SQLException {
        int valor = 0;

        sql = "UPDATE tbl_personas SET password='" + pass + "' WHERE email = '" + email + "' AND token_recovery = '" + token + "';";

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
        public int comprobartokenemail( String token, String email) throws Exception {
        sql = "SELECT COUNT(id) as cantidad FROM tbl_personas WHERE token_recovery = '" + token + " ' AND email ='" + email + "' and estado=1";
        rs = cn.ejecutarConsultaprograma(sql);
        while (rs.next()) {
            respuesta = rs.getInt("cantidad");
        }
        return respuesta;
    }
}
