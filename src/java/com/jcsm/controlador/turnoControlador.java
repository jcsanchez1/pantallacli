
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jcsm.controlador;

import com.jcsm.DAO.filiaDAO;
import com.jcsm.DAO.personasDAO;
import com.jcsm.DAO.servicioDAO;
import com.sun.xml.ws.security.addressing.impl.policy.Constants;
import com.jcsm.DAO.turnoDAO;
import com.jcsm.entidades.TblFiliales;
import com.jcsm.entidades.TblPersonas;
import com.jcsm.entidades.TblServicios;
import com.jcsm.entidades.TblSubservicios;
import com.jcsm.entidades.TblTurnos;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jboss.logging.Logger;
import sun.util.logging.PlatformLogger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author juanc
 */
@WebServlet(name = "turnoControlador", urlPatterns = {"/turnoControlador"})
public class turnoControlador extends HttpServlet {

    private static final long serialVersionUID = 1L;

    TblTurnos turn = new TblTurnos();
    turnoDAO tdao = new turnoDAO();
    filiaDAO fdao = new filiaDAO();
    servicioDAO sdao = new servicioDAO();
    personasDAO pdao = new personasDAO();
    int respuesta = 0;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession misession = request.getSession(true);
            int respuesta = 0;
            if (request.getParameter("btn-crearticket") != null) {
                try {
                    turn.setEstado(1);
                    String a1, a2, a3, a4;
                    a1 = request.getParameter("dni");
                    a2 = "1";//request.getParameter("filial");
                    a3 = "1";//request.getParameter("servicio");
                    a4 = "1";//request.getParameter("subservicio");
                    if (pdao.existedni(a1) == false) {

                    } else {
                        response.sendRedirect("selec-serv.jsp");
                    }
                } catch (Exception e) {
                } finally {

                }
            } else if (request.getParameter("crear-nuevo") != null) {

            } else if (request.getParameter("crear-nuevo") != null) {
            } else if (request.getParameter("btn-crearticket") != null) {
                try {
                    turn.setEstado(1);
                    String a1, a2, a3, a4;
                    int id;
                    a1 = request.getParameter("dni");
                    a2 = request.getParameter("filial");
                    id= pdao.obtenerid(a1);
                    a3 = "1";request.getParameter("servicio");
                    a4 = "1";request.getParameter("subservicio");
                    turn.setCorrelativoturno(tdao.obtenercorrelativo());
                    int idper = id;
                    int filial = Integer.parseInt(a2);
                    int servicio = Integer.parseInt(a3);
                    int subservicio = Integer.parseInt(a4);

                    TblFiliales fi = new TblFiliales();
                    fi = fdao.buscarfilia(filial);
                    //fi.setIdfilial(filial);
                    turn.setIdfilial(fi);
                    TblServicios se = new TblServicios();
                    se = sdao.buscarfilia(servicio);
                    TblSubservicios su = new TblSubservicios();
                    //se.setIdservicios(servicio);
                    turn.setIdservicio(se);
                    su.setIdsubservicio(subservicio);
                    turn.setIdsubservicio(su);
                    TblPersonas pe = new TblPersonas();
                    pe.setId(idper);
                    personasDAO pdao = new personasDAO();
                    turn.setIdpersona(pe);
                    int val = pdao.obtenercondicion(pe);

                    String valu = "";
                    switch (val) {
                        case 0:
                            valu = "0. Normal";
                            break;
                        case 2:
                            valu = "2. Embarazada con discapacidad";
                            break;
                        case 3:
                            valu = "3. Discapacidad";
                            break;
                        case 4:
                            valu = "4. Embarazada";
                            break;
                        case 5:
                            valu = "5. tercera edad";
                            break;
                        case 7:
                            valu = "7. tercera edad embarazada con discapacidad";
                            break;
                        case 8:
                            valu = "8. tercera edad con discapacidad";
                            break;
                        case 9:
                            valu = "9. tercera edad embarazada";
                            break;
                        default:
                            valu = "0. Normal";
                            break;
                    }
                    turn.setTipo(valu);
                    respuesta = tdao.insertarturno(turn);
                    request.getSession().setAttribute("turno", turn);
                } catch (Exception e) {
                } finally {

                }
                if (respuesta > 0) {
                    response.sendRedirect("tur-creado.jsp");
                    return;
                } else {
                    response.sendRedirect("index.jsp");
                    return;
                }
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(turnoControlador.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(turnoControlador.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
