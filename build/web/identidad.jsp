<%@page import="com.jcsm.entidades.TblPersonas"%>
<%@page import="com.jcsm.DAO.turnoDAO"%>
<%@page import="com.jcsm.entidades.TblTurnos"%>
<%@page import="com.jcsm.configuracion.Dba"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jcsm.entidades.TblConfiguracion"%>
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
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Sistema de gestion de afiliados - Administracion</title>
        <script src="js/md5.js" type="text/javascript"></script>
        <script>
            function modificarPASS() {
                let sinCifrar = document.getElementById("txtclave2").value;
                let cifrado = hex_md5(sinCifrar);
                document.getElementById("txtclave").value = cifrado;
                console.log(sinCifrar);
                console.log(cifrado);
            }
        </script>
    </head>
    <body>
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <section class="login-content">
            <div class="logo">
                <%
                    try {
                        sql = "SELECT tbl_configuracion.logo, tbl_configuracion.logopeque, tbl_configuracion.nombre FROM tbl_configuracion";
                        rs = cn.ejecutarConsultaprograma(sql);
                        TblConfiguracion tcon = new TblConfiguracion();
                        String a1 = "", a2 = "", a3 = "";
                        while (rs.next()) {
                            tcon.setLogo(rs.getString(1));
                            a1 = rs.getString(1);
                            tcon.setLogopeque(rs.getString(2));
                            a2 = rs.getString(2);
                            tcon.setNombre(rs.getString(3));
                            a3 = rs.getString(3);
                        }
                %>
                <img src="images/<%=a1%>" alt="<%=a3%>"/>
                <%
                    } catch (Exception e) {
                    } finally {
                        cn.desconectar();
                    }
                %>
            </div>
            <div class="login-box">
                <form name="f1" class="login-form" action="/pantallacli/turnoControlador" method="POST">
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>CREAR TURNO</h3>
                    <div class="form-group">
                        <label class="control-label">DNI</label>
                        <input name="dni" class="form-control" type="text" placeholder="DNI" autofocus>
                    </div>

                    <div class="form-group btn-container">
                        <button name="btn-crearticket" class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>Crear</button>
                    </div>
                </form>
            </div>
        </section>

        <!-- Essential javascripts for application to work-->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="js/plugins/pace.min.js"></script>
        <script type="text/javascript">
                            // Login Page Flipbox control
                            $('.login-content [data-toggle="flip"]').click(function () {
                                $('.login-box').toggleClass('flipped');
                                return false;
                            });
        </script>
    </body>
</html>