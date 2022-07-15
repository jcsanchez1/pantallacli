<%@page import="com.jcsm.entidades.TblConfiguracion"%>
<%@include file="/comunes/sesion.jsp" %>
<%@include file="/comunes/noatras.jsp" %>
<%@include file="/comunes/validar_pant.jsp" %>
<%@include file="/comunes/deshabilitar.jsp" %>


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
                <form name="f1" class="login-form" action="/pantallacli/turnoControlador" method="POST">
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>Buscar afiliado</h3>
                    <div class="form-group">
                        <label class="control-label">DNI</label>
                        <input name="dni" class="form-control" type="text" placeholder="DNI" autofocus>
                    </div>

                    <div class="form-group btn-container">
                        <button name="btn-buscar" class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>Buscar</button>
                    </div>
                </form>
            </div>
        </section>

<%@include file="/comunes/footer1.jsp" %>

    </body>
</html>