<%@page import="com.jcsm.DAO.turnoDAO"%>
<%@page import="com.jcsm.entidades.TblTurnos"%>
<%@page import="com.jcsm.configuracion.Dba"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jcsm.entidades.TblPersonas"%>
<%@page import="com.jcsm.DAO.personasDAO"%>
<%@page import="com.jcsm.entidades.TblPersonas"%>
<%@page import="com.jcsm.entidades.TblSubservicios"%>
<%@page import="com.jcsm.entidades.TblServicios"%>
<%@page import="com.jcsm.entidades.TblFiliales"%>
<%

    int respuesta = 0;
    String sql = "";
    ResultSet rs = null;
    Dba cn = new Dba();
    TblTurnos turn = new TblTurnos();
    turnoDAO tdao = new turnoDAO();
%>
<%
    if (request.getSession(false) == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    TblPersonas pers = new TblPersonas();
    pers = (TblPersonas) session.getAttribute("persona");
    int a, b;

    a = pers.getIdrol().getIdrol();
    b = pers.getIdFilial().getIdfilial();
    if (a != 5) {
        response.sendRedirect("prohibido.jsp");
    }
%>