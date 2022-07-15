<%@page import="com.jcsm.entidades.TblConfiguracion"%>
<%@include file="/comunes/sesion.jsp" %>
<%@include file="/comunes/noatras.jsp" %>
<%@include file="/comunes/validar_pant.jsp" %>
<%@include file="/comunes/deshabilitar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/comunes/head1.jsp" %>
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
                <div class="row text-center">
                    <div class="col-12">
                        <br>
                        <br>
                        <a href="pantalla-index.jsp" class="btn btn-group-lg btn-primary">Pantalla turnos</a>
                        <br>
                        <br>
                    </div>
                    <br>
                    <br>
                    <div class="col-12">
                        <br>
                        <br>
                        <a href="identidad.jsp" class="btn btn-group-lg btn-secondary">Crear turno</a> 

                    </div>
                </div>



            </div>
        </section>

        <%@include file="/comunes/footer1.jsp" %>
    </body>
</html>