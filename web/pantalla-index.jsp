<%@include file="/comunes/sesion.jsp" %>
<%@include file="/comunes/noatras.jsp" %>
<%@include file="/comunes/validar_pant.jsp" %>
<%@include file="/comunes/deshabilitar.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/comunes/head1.jsp" %>
        <meta http-equiv="refresh" content="30">
    </head>
    <body class="app sidebar-mini">
        <!-- Navbar-->
        <%@include file="/comunes/logo.jsp" %>
        <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <%@include file="/comunes/navbar.jsp" %>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">

        <%@include file="/comunes/avatar.jsp" %>
        <div class="row">
            <%                    int cont2 = 1;
                if (cont2 > 0) {
            %>
            <%
                try {
                    sql = "SELECT CONCAT(tbl_personas.nombre,' ', tbl_personas.apellido) AS afiliado, tbl_roles.nombrerol, tbl_servicios.servicio, tbl_filiales.nombrefilial,tbl_turnos.fechacreacion, tbl_turnos.tipo,tbl_turnos.correlativoturno , tbl_turnos.estado  FROM tbl_turnos INNER JOIN tbl_personas ON tbl_turnos.idpersona = tbl_personas.id INNER JOIN tbl_servicios ON tbl_turnos.idservicio = tbl_servicios.idservicios INNER JOIN tbl_filiales ON tbl_turnos.idfilial = tbl_filiales.idfilial INNER JOIN tbl_roles ON tbl_personas.idrol = tbl_roles.idrol WHERE tbl_turnos.estado != 2 AND tbl_turnos.fechacreacion = CURRENT_DATE() AND tbl_turnos.idfilial = " + b + " LIMIT 3";
                    rs = cn.ejecutarConsultaprograma(sql);
                    String a1 = "", a2 = " ", a3 = " ", a4 = " ", a5 = " ", a6 = " ", a7 = " ", a8 = "";
                    while (rs.next()) {
                        a1 = rs.getString(1);
                        a2 = rs.getString(2);
                        a3 = rs.getString(3);
                        a4 = rs.getString(4);
                        a5 = rs.getString(5);
                        a6 = rs.getString(6);
                        a7 = rs.getString(7);
                        a8 = rs.getString(8);

            %>
            <div class="card text-center" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title"><%=a1%></h5>
                    <p class="card-text"><%=a3%></p>
                    <p class="card-text"><%=a7%></p>
                    <p class="card-text"><%=a6%></p>
                    <% if (a8.equals("4")) {%>
                    <p class="btn btn-danger">Perdido</p>
                    <%} else if (a8.equals("1")) {
                    %>
                    <p class="btn btn-secondary">No atendido</p>
                    <%} else if (a8.equals("3")) {
                    %>
                    <p class="btn btn-success">Atendido</p>
                    <%} else if (a8.equals("2")) { %>
                    <p class="btn btn-success">Atendiendo</p>
                    <%}%>
                </div>
            </div>



            <%}
                } catch (Exception e) {
                }
            } else {
            %>
            <p class="text-center">No hay tickets para el dia de hoy</p><%
                }
            %>

        </div>
    </aside>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-dashboard"></i> Gestions de turnos</h1>
                <h5>Atendiendo actualmente</h5>
                <div class="row">
                    <%
                        int cont = 1;
                        if (cont > 0) {
                    %>
                    <%
                        try {
                            sql = "SELECT CONCAT(tbl_personas.nombre,' ', tbl_personas.apellido) AS afiliado, tbl_roles.nombrerol, tbl_servicios.servicio, tbl_filiales.nombrefilial,tbl_turnos.fechacreacion, tbl_turnos.tipo,tbl_turnos.correlativoturno , tbl_turnos.estado  FROM tbl_turnos INNER JOIN tbl_personas ON tbl_turnos.idpersona = tbl_personas.id INNER JOIN tbl_servicios ON tbl_turnos.idservicio = tbl_servicios.idservicios INNER JOIN tbl_filiales ON tbl_turnos.idfilial = tbl_filiales.idfilial INNER JOIN tbl_roles ON tbl_personas.idrol = tbl_roles.idrol WHERE tbl_turnos.estado = 2 AND tbl_turnos.fechacreacion = CURRENT_DATE() AND tbl_turnos.idfilial = " + b + " LIMIT 3";
                            rs = cn.ejecutarConsultaprograma(sql);
                            String a1 = "", a2 = " ", a3 = " ", a4 = " ", a5 = " ", a6 = " ", a7 = " ", a8 = "";
                            while (rs.next()) {
                                a1 = rs.getString(1);
                                a2 = rs.getString(2);
                                a3 = rs.getString(3);
                                a4 = rs.getString(4);
                                a5 = rs.getString(5);
                                a6 = rs.getString(6);
                                a7 = rs.getString(7);
                                a8 = rs.getString(8);

                    %>
                    <div class="card text-center" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"><%=a1%></h5>
                            <p class="card-text"><%=a3%></p>
                            <p class="card-text"><%=a7%></p>
                            <p class="card-text"><%=a6%></p>
                            <% if (a8.equals("4")) {%>
                            <p class="btn btn-danger">Perdido</p>
                            <%} else if (a8.equals("1")) {
                            %>
                            <p class="btn btn-secondary">No atendido</p>
                            <%} else if (a8.equals("3")) {
                            %>
                            <p class="btn btn-success">Atendido</p>
                            <%} else if (a8.equals("2")) { %>
                            <p class="btn btn-primary">Atendiendo</p>
                            <%}%>
                        </div>
                    </div>



                    <%}
                        } catch (Exception e) {
                        }
                    } else {
                    %>
                    <p class="text-center">No hay tickets para el dia de hoy</p><%
                        }
                    %>



                </div>

            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile text-center">
                    <iframe width="854" height="480"
                            src="https://www.youtube.com/embed/8uMzcIy3-NI?autoplay=1&mute=1&loop=1?controls=0">
                    </iframe>
                </div>
            </div>
        </div>
    </main>
    <%@include file="/comunes/footer1.jsp" %>
</body>
</html>