<%@include file="/comunes/sesion.jsp" %>
<%@include file="/comunes/validar_pant.jsp" %>
<%@include file="/comunes/noatras.jsp" %>
<%@include file="/comunes/deshabilitar.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/comunes/head1.jsp" %>
    </head>
    <body class="app sidebar-mini" onload="delayRedirect();">
        <!-- Navbar-->
        <%@include file="/comunes/logo.jsp" %>
        <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <%@include file="/comunes/navbar.jsp" %>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">

        <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="fotos/${persona.foto}" height="75px" width="75px" alt="User Image">
            <div>
                <p class="app-sidebar__user-name">${persona.nombre}</p>
                <p class="app-sidebar__user-designation">${persona.idrol.nombrerol}</p>
                <p class="app-sidebar__user-designation">${persona.idFilial.nombrefilial}</p>
            </div>
        </div>
        <ul class="app-menu">
        </ul>
    </aside>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
                <p>Sistema de gestion de afiliados</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
            </ul>
        </div>
        <div id="delayMsg"></div>
        <div class="row">
            <div class="col-md-12">
                <section class="vh-100" style="background-color: #9de2ff;">
                    <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col col-md-9 col-lg-7 col-xl-5">
                                <div class="card" style="border-radius: 15px;">
                                    <div class="card-body p-4">
                                        <div class="d-flex text-black">
                                            <%                    try {
                                                String afilid=String.valueOf(session.getAttribute("afilid"));
                                                    sql = "SELECT CONCAT(tbl_personas.nombre,' ', tbl_personas.apellido) AS afiliado, tbl_roles.nombrerol, tbl_servicios.servicio, tbl_filiales.nombrefilial,tbl_turnos.fechacreacion, tbl_turnos.tipo, MAX(tbl_turnos.correlativoturno) as correlativo, tbl_personas.foto  FROM tbl_turnos INNER JOIN tbl_personas ON tbl_turnos.idpersona = tbl_personas.id INNER JOIN tbl_servicios ON tbl_turnos.idservicio = tbl_servicios.idservicios INNER JOIN tbl_filiales ON tbl_turnos.idfilial = tbl_filiales.idfilial INNER JOIN tbl_roles ON tbl_personas.idrol = tbl_roles.idrol WHERE tbl_turnos.idpersona = " + afilid + " AND tbl_turnos.fechacreacion = CURRENT_DATE()";
                                                    rs = cn.ejecutarConsultaprograma(sql);
                                                    String a1 = "", a2 = " ", a3 = " ", a4 = " ", a5 = " ", a6 = " ", a7 = " ",a8="";
                                                    while (rs.next()) {
                                                        a1 = rs.getString(1);
                                                        a2 = rs.getString(2);
                                                        a3 = rs.getString(3);
                                                        a4 = rs.getString(4);
                                                        a5 = rs.getString(5);
                                                        a6 = rs.getString(6);
                                                        a7 = rs.getString(7);
                                                        a8 = rs.getString(8);
                                                    }
                                            %>
                                            <div class="flex-shrink-0">
                                                <img src="/pantallacli/fotos/<%=a8%>"
                                                     alt="Generic placeholder image" class="img-fluid"
                                                     style="width: 180px; border-radius: 10px;">
                                            </div>
                                            <div class="flex-grow-1 ms-3 text-center">
                                                <h5 class="mb-1"><%=a1%></h5>
                                                <p class="mb-1 " style="color: #2b2a2a;"><%=a2%></p>
                                                <p class="mb-1 " style="color: #2b2a2a;"><%=a4%></p>
                                                <p class="mb-1 " style="color: #2b2a2a;"><%=a5%></p>
                                                <p class="mb-1" style="color: #2b2a2a;"><strong>turno</strong></p>
                                                <h3 class="mb-1"><%=a7%></h3>
                                                <p class="mb-1 " style="color: #2b2a2a;"><%=a3%></p>

                                                <p class="mb-1 " style="color: #2b2a2a;"><%=java.time.LocalDate.now().toString()%></p>
                                            </div>
                                            <%
                                                } catch (Exception e) {
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            </section>

        </div>
    </div>
</main>
<script>
    function delayRedirect() {
        document.getElementById('delayMsg').innerHTML = 'Por favor espere sera redireccionado en <span id="countDown">10</span> segundos....';
        var count = 10;
        setInterval(function () {
            count--;
            document.getElementById('countDown').innerHTML = count;
            if (count == 0) {
                window.location = 'seleccionar.jsp';
            }
        }, 1000);
    }
</script>
<%@include file="/comunes/footer1.jsp" %>
</body>
</html>