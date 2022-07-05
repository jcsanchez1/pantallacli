<%@page import="com.jcsm.DAO.turnoDAO"%>
<%@page import="com.jcsm.entidades.TblTurnos"%>
<%@page import="com.jcsm.configuracion.Dba"%>
<%@page import="com.jcsm.entidades.TblPersonas"%>
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
        <title>Sistema de gestion de afiliados - ${persona.nombre} - Pantalla</title>
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
        </aside>
        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i> Gestions de turnos</h1>
                    <h5>Nueva Persona</h5>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item"><a href="#">turnos</a></li>
                    <li class="breadcrumb-item active"><a href="#">nuevo</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile text-center">
                        <form class="login-form" action="/administradocs/personaControlador" method="POST">
                            <div class="card">
                                <div class="card-header">
                                    Nuevo Registro
                                </div>
                                <div class="card-body">

                                    <div class="form-group row">
                                        <label for="id" class="col-2 col-form-label">DNI</label> 
                                        <div class="col-8">
                                            <input id="dni" name="dni" type="text" class="form-control" required="required">
                                            <span>*Omita el cero a la izquierda.</span>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="nombre" class="col-2 col-form-label">Nombre</label> 
                                        <div class="col-8">
                                            <input id="nombre" name="nombre" type="text" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="apellido" class="col-2 col-form-label">Apellido</label> 
                                        <div class="col-8">
                                            <input id="apellido" name="apellido" type="text" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="telefono" class="col-2 col-form-label">Telefono</label> 
                                        <div class="col-8">
                                            <input id="telefono" name="telefono" type="text" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email" class="col-2 col-form-label">Email</label> 
                                        <div class="col-8">
                                            <input id="email" name="email" type="text" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pasword" class="col-2 col-form-label">Pasword</label> 
                                        <div class="col-8">
                                            <input id="pasword" name="pasword" type="password" class="form-control" required="required">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="fechanacimiento" class="col-2 col-form-label">Fecha nacimiento</label> 
                                        <div class="col-8">
                                            <input id="fechanacimiento" name="fechanacimiento" type="date" class="form-control" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="filial" class="col-2 col-form-label">Genero</label> 
                                        <div class="col-8">
                                            <select id="filial" name="genero" class="custom-select">
                                                <option value="f">Femenino</option>
                                                <option value="m">Masculino</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer text-muted">
                                    <div class="form-group row">
                                        <div class="offset-4 col-8">
                                            <button name="crear-nuevo" type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form> 


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