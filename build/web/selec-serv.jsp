<%@page import="com.jcsm.DAO.personasDAO"%>
<%@page import="com.jcsm.entidades.TblPersonas"%>
<%@page import="com.jcsm.entidades.TblSubservicios"%>
<%@page import="com.jcsm.entidades.TblServicios"%>
<%@page import="com.jcsm.entidades.TblFiliales"%>
<%@page import="com.jcsm.DAO.turnoDAO"%>
<%@page import="com.jcsm.entidades.TblTurnos"%>
<%@page import="com.jcsm.configuracion.Dba"%>

<%@page import="java.sql.ResultSet"%>
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
    int a,b;
    
    a = pers.getIdrol().getIdrol();
    b =  pers.getIdFilial().getIdfilial();
    if (a != 5) {
        response.sendRedirect("prohibido.jsp");
    }
%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
        <!-- Twitter meta-->
        <meta property="twitter:card" content="summary_large_image">
        <meta property="twitter:site" content="@pratikborsadiya">
        <meta property="twitter:creator" content="@pratikborsadiya">
        <!-- Open Graph Meta-->
        <meta property="og:type" content="website">
        <meta property="og:site_name" content="Vali Admin">
        <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
        <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
        <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
        <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
        <title>Sistema de gestion de afiliados - ${persona.nombre} - Afiliado</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="app sidebar-mini">
        <!-- Navbar-->
        <header class="app-header"><a class="app-header__logo" href="admin-index.jsp"><img src="images/logo2.png" height="50px" width="150px" alt=""/></a>

            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!--Notification Menu-->
                <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell-o fa-lg"></i></a>
                    <ul class="app-notification dropdown-menu dropdown-menu-right">
                        <li class="app-notification__title">You have 4 new notifications.</li>
                        <div class="app-notification__content">
                            <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                                    <div>
                                        <p class="app-notification__message">Lisa sent you a mail</p>
                                        <p class="app-notification__meta">2 min ago</p>
                                    </div></a></li>
                            <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                                    <div>
                                        <p class="app-notification__message">Mail server not working</p>
                                        <p class="app-notification__meta">5 min ago</p>
                                    </div></a></li>
                            <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                                    <div>
                                        <p class="app-notification__message">Transaction complete</p>
                                        <p class="app-notification__meta">2 days ago</p>
                                    </div></a></li>
                            <div class="app-notification__content">
                                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                                        <div>
                                            <p class="app-notification__message">Lisa sent you a mail</p>
                                            <p class="app-notification__meta">2 min ago</p>
                                        </div></a></li>
                                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                                        <div>
                                            <p class="app-notification__message">Mail server not working</p>
                                            <p class="app-notification__meta">5 min ago</p>
                                        </div></a></li>
                                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                                        <div>
                                            <p class="app-notification__message">Transaction complete</p>
                                            <p class="app-notification__meta">2 days ago</p>
                                        </div></a></li>
                            </div>
                        </div>
                        <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
                    </ul>
                </li>
                <!-- User Menu-->
                <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
                    <ul class="dropdown-menu settings-menu dropdown-menu-right">
                        <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
                        <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
                        <li><a class="dropdown-item" href="page-login.html"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
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
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h5 class="card-header">Ticket</h5>
                        <div class="card-body">
                            <h5 class="card-title">Nuevo ticket</h5>
                            <p class="card-text">Selecciones una opcion:</p>
                            <div class="container">
                                <form class="login-form" action="/administradocs/turnoControlador" method="POST">
                                    <input type="text" name="filial" value="<%=b%>">
                                    <div class="form-group row">
                                        <label for="servicio" class="col-2 col-form-label">Servicio</label> 
                                        <div class="col-8">
                                            <%
                                                try {
                                                    sql = "SELECT tbl_servicios.idservicios, tbl_servicios.servicio FROM tbl_servicios ORDER BY tbl_servicios.idservicios ASC";
                                                    rs = cn.ejecutarConsultaprograma(sql);
                                                    String id, nombre;
                                            %>
                                            <select id="servicio" name="servicio" class="custom-select" required="required">
                                                <%
                                                    while (rs.next()) {
                                                        id = rs.getString(1);
                                                        nombre = rs.getString(2);%>
                                                <option  value ="<%=id%>"><%=nombre%></option>
                                                <% } %>
                                            </select>
                                            <%
                                                } catch (Exception e) {
                                                } finally {
                                                    cn.desconectar();
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="subservicio" class="col-2 col-form-label">Sub servicio</label> 
                                        <div class="col-8">
                                            <%
                                                try {
                                                    sql = "SELECT tbl_subservicios.idsubservicio, tbl_subservicios.subservicio FROM tbl_subservicios ORDER BY tbl_subservicios.idsubservicio ASC";
                                                    rs = cn.ejecutarConsultaprograma(sql);
                                                    String id, nombre;
                                            %>
                                            <select id="subservicio" name="subservicio" class="custom-select" required="required">
                                                <%
                                                    while (rs.next()) {
                                                        id = rs.getString(1);
                                                        nombre = rs.getString(2);%>
                                                <option  value ="<%=id%>"><%=nombre%></option>
                                                <% } %>
                                            </select>
                                            <%
                                                } catch (Exception e) {
                                                } finally {
                                                    cn.desconectar();
                                                }
                                            %>
                                        </div>
                                    </div> 
                                    <input type="hidden" name="idper"  value="${persona.id}">
                                    <div class="form-group row">
                                        <div class="offset-4 col-8">
                                            <button name="btn-crearticket" type="submit" class="btn btn-primary btn-large">CREAR TICKET</button>
                                        </div>
                                    </div>
                                </form>                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- Essential javascripts for application to work-->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <!-- Google analytics script-->
        <script type="text/javascript">
            if (document.location.hostname == 'pratikborsadiya.in') {
                (function (i, s, o, g, r, a, m) {
                    i['GoogleAnalyticsObject'] = r;
                    i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date();
                    a = s.createElement(o),
                            m = s.getElementsByTagName(o)[0];
                    a.async = 1;
                    a.src = g;
                    m.parentNode.insertBefore(a, m)
                })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
                ga('create', 'UA-72504830-1', 'auto');
                ga('send', 'pageview');
            }
        </script>
    </body>
</html>
<%
    if (request.getParameter("btn-crearticket") != null) {
        try {
            turn.setEstado(1);
            turn.setCorrelativoturno(tdao.obtenercorrelativo());
            String a1, a2, a3, a4;
            a1 = request.getParameter("idper");
            a2 = request.getParameter("filial");
            a3 = request.getParameter("servicio");
            a4 = request.getParameter("subservicio");
            turn.setCorrelativoturno(tdao.obtenercorrelativo());
            int idper = Integer.getInteger(a1);
            int filial = Integer.getInteger(a2);
            int servicio = Integer.getInteger(a3);
            int subservicio = Integer.getInteger(a4);
            TblFiliales fi = new TblFiliales();
            fi.setIdfilial(filial);
            turn.setIdfilial(fi);
            TblServicios se = new TblServicios();
            TblSubservicios su = new TblSubservicios();
            se.setIdservicios(servicio);
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
                case 2:
                    valu = "2. Embarazada con discapacidad";
                case 3:
                    valu = "3. Discapacidad";
                case 4:
                    valu = "4. Embarazada";
                case 5:
                    valu = "5. tercera edad";
                case 7:
                    valu = "7. tercera edad embarazada con discapacidad";
                case 8:
                    valu = "8. tercera edad con discapacidad";
                case 9:
                    valu = "9. tercera edad embarazada";
                default:
                    valu = " otros";
            }
            turn.setTipo(valu);
            tdao.insertarturno(turn);

        } catch (Exception e) {
            e.toString();
        } finally {
            request.getRequestDispatcher("afiliado-tur-creado.jsp").forward(request, response);
        }

    }
%>