<%@page import="com.jcsm.configuracion.Dba"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.jcsm.entidades.TblConfiguracion"%>
<%@include file="/comunes/noatras.jsp" %>
<%@include file="/comunes/deshabilitar.jsp" %>
<%
    int respuesta = 0;
    String sql = "";
    ResultSet rs = null;
    Dba cn = new Dba();
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/comunes/head1.jsp" %>
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
                <form name="f1" class="login-form" action="/pantallacli/loginControlador" method="POST">
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>Ingresar</h3>
                    <div class="form-group">
                        <label class="control-label">Usuario</label>
                        <input name="txtusuario" class="form-control" type="text" placeholder="Email" autofocus>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Contraseña</label>
                        <input id="txtclave2" name="txtclave2" onblur="modificarPASS();"     class="form-control" type="password" placeholder="Password">
                        <input id="txtclave" name="txtclave"   class="form-control" type="hidden" placeholder="Password">
                    </div>

                    <div class="form-group">
                        <div class="utility">
                            <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Recuperar contraseña</a></p>
                        </div>
                    </div>
                    <div class="form-group btn-container">
                        <button name="btn-login" onclick="modificarPASS();"  class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>Ingresar</button>
                    </div>
                </form>
                <form class="forget-form" action="/pantallacli/loginControlador" method="POST">
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Recuperar Contraseña?</h3>
                    <div class="form-group">
                        <label class="control-label">EMAIL</label>
                        <input name="correorecuperar" id="correorecuperar" class="form-control" type="text" placeholder="Email">
                    </div>
                    <div class="form-group btn-container">
                        <button name="txtrecuperar" id="txtrecuperar" class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>Resetear</button>
                    </div>
                    <div class="form-group mt-3">
                        <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Regresar</a></p>
                    </div>
                </form>
            </div>
        </section>

        <%@include file="/comunes/footer1.jsp" %>
    </body>
</html>