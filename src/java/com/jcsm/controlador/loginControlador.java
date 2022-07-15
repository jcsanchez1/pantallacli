/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jcsm.controlador;

import javax.mail.Transport;
import javax.mail.internet.MimeMultipart;
import javax.activation.FileDataSource;
import javax.activation.DataHandler;
import javax.mail.internet.MimeBodyPart;
import javax.mail.BodyPart;
import javax.mail.internet.InternetAddress;
import javax.mail.Message;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import java.util.Properties;
import com.jcsm.configuracion.helpers;
////////////////////////
import com.jcsm.DAO.loginDAO;
import com.jcsm.entidades.TblPersonas;
import com.sun.xml.ws.security.addressing.impl.policy.Constants;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "loginControlador", urlPatterns = {"/loginControlador"})
public class loginControlador extends HttpServlet {

    private static final long serialVersionUID = 1L;
    TblPersonas tp = new TblPersonas();
    loginDAO lg = new loginDAO();
    helpers hel = new helpers();

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession misession = request.getSession(true);
            int respuesta = 0;
            if (request.getParameter("btn-login") != null) {
                String usuario = request.getParameter("txtusuario");
                String clave = request.getParameter("txtclave");
                tp.setEmail(usuario);
                tp.setPassword(clave);
                try {
                    respuesta = lg.validarlogin(tp);
                    if (respuesta != 0) {
                        tp = lg.Traerdatos(tp);
                        misession.setAttribute("persona", tp);
                        misession.setAttribute("usuario", usuario);
                        misession.setAttribute("ida", tp.getId());
                        misession.setAttribute("ids", tp.getId());
                        //request.getSession().setAttribute("persona", tp);
                        misession.setAttribute("filial", tp.getIdFilial().getIdfilial());
                        misession.setAttribute("rol", tp.getIdrol().getIdrol());
                        misession.setAttribute("nombrerol", tp.getIdrol().getNombrerol());
                        misession.setAttribute("nombrefilial", tp.getIdFilial().getNombrefilial());
                        if (tp.getIdrol().getIdrol() == 5) {
                            response.sendRedirect("/pantallacli/seleccionar.jsp");

                        }  else {
                            response.sendRedirect("/pantallacli/index.jsp?respuesta=" + respuesta);
                        }
                    } else {
                        response.sendRedirect("/pantallacli/index.jsp?respuesta=" + respuesta);
                    }
                } catch (Exception ex) {
                    java.util.logging.Logger.getLogger(loginControlador.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if (request.getParameter("btn-out") != null) {
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("/pantallacli/index.jsp");
                out.print("You are successfully logged out!");

                out.close();
            } else if (request.getParameter("txtrecuperar") != null) {
                String recuperar = request.getParameter("correorecuperar");
                respuesta = lg.existecorreo(recuperar);
                if (respuesta < 1) {
                    response.sendRedirect("/pantallacli/index.jsp?respuesta=" + respuesta);
                } else {
                    String pas, pasm5, tok;
                    pas = hel.cadenaAleatoria(10);
                    pasm5 = hel.getMd5(pas);
                    tok = hel.generartoken();

                    String remitente = "jc.mejia@unah.hn";
                    String clave2 = "Un@h2021.Jc$M";
                    String destino = recuperar;
                    String asunto = "Reseteo de contraseña para " + destino;
                    String cuerpo = "<h4>Recuperacion de contraseña:</h4><p>se ha recibido una solicitud para crear una nueva contraseña</p><p><strong>TOKEN: " + tok + " </strong>token</p><p><strong>PASSWORD: " + pas + " </strong>passw</p><p>en caso de que usted no solicito nueva contraseña, favor comunicarse a nuestro call center</p>";

//                    Properties props = new Properties();
//                    props.put("mail.smtp.host", "smtp.office365.com");
//                    props.put("mail.smtp.port", "587");
//                    props.put("mail.smtp.auth", "true");
//                    props.put("mail.smtp.starttls.enable", "true");
//                    props.put("mail.smtp.user", remitente);
//                    props.put("mail.smtp.clave", clave2);

//                    javax.mail.Session s = javax.mail.Session.getDefaultInstance(props);
//                    MimeMessage mensaje = new MimeMessage(s);

                    try {
                        Properties p = new Properties();
                        p.put("mail.smtp.host", "smtp.office365.com");
                        p.setProperty("mail.smtp.starttls.enable", "true");
                        p.put("mail.smtp.ssl.trust","smtp.office365.com");
                        p.setProperty("mail.smtp.port", "587");
                        p.setProperty("mail.smtp.user", remitente);
                        p.setProperty("mail.smtp.auth", "true");
                        Session s = Session.getDefaultInstance(p);
                        MimeMessage mensaje = new MimeMessage(s);
                        mensaje.setFrom(new InternetAddress(remitente));
                        mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(recuperar));
                       
                        mensaje.setSubject(asunto);
                        mensaje.setText(cuerpo);
                        /*Envio Mensaje de texto*/
                        BodyPart parteTexto = new MimeBodyPart();
                        parteTexto.setContent("<b>" + cuerpo + "</b>", "text/html");

                        MimeMultipart todaslasPartes = new MimeMultipart();
                        todaslasPartes.addBodyPart(parteTexto); 
                        Transport t = s.getTransport("smtp");
                        t.connect(remitente, clave2);
                        t.sendMessage(mensaje,mensaje.getAllRecipients());
                        t.close();
                        
//                        mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));
//                        mensaje.setSubject(asunto);
//
//                        mensaje.setText(cuerpo);
//                        /*Envio Mensaje de texto*/
//                        BodyPart parteTexto = new MimeBodyPart();
//                        parteTexto.setContent("<b>" + cuerpo + "</b>", "text/html");
//
//                        MimeMultipart todaslasPartes = new MimeMultipart();
//                        todaslasPartes.addBodyPart(parteTexto);
//
//                        mensaje.setContent(todaslasPartes);
//
//                        Transport transport = s.getTransport("smtp");
//                        transport.connect("smtp.office365.com", remitente, clave2);
//                        transport.sendMessage(mensaje, mensaje.getAllRecipients());
//                        transport.close();
//                        System.out.println("Correo Enviado");
//                        out.print("<script> alert('Correo Enviado Exitosamente')</script>");
                        lg.insertartoken(tok, recuperar);

                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        response.sendRedirect("/administradocs/cambiarpass.jsp");
                    }
                }
            } else if (request.getParameter("btn-cambiar") != null) {
                String token, email, pass;
                token = request.getParameter("token");
                email = request.getParameter("email");
                pass = request.getParameter("txtclave");
                respuesta = lg.comprobartokenemail(token, email);
                if (respuesta < 1) {
                    response.sendRedirect("/pantallacli/index.jsp?respuesta=" + respuesta);
                } else {
                    lg.cambiarpassword(email, token, pass);
                    response.sendRedirect("/pantallacli/index.jsp");
                }
            }
        }
    }
    /////
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
            java.util.logging.Logger.getLogger(loginControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        //me llega la url "proyecto/login/out"

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
            java.util.logging.Logger.getLogger(loginControlador.class.getName()).log(Level.SEVERE, null, ex);
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
