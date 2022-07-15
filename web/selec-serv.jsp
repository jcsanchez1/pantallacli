<%@include file="/comunes/sesion.jsp" %>
<%@include file="/comunes/noatras.jsp" %>
<%@include file="/comunes/validar_pant.jsp" %>
<%@include file="/comunes/deshabilitar.jsp" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <%@include file="/comunes/head1.jsp" %>
    </head>
    <body class="app sidebar-mini">
        <!-- Navbar-->
        <header class="app-header"><a class="app-header__logo" href="admin-index.jsp"><img src="images/logo2.png" height="50px" width="150px" alt=""/></a>

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
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h5 class="card-header">Ticket</h5>
                        <div class="card-body">
                            <h5 class="card-title">Nuevo ticket</h5>
                            <p class="card-text">Selecciones una opcion:</p>
                            <div class="container">
                                <form class="login-form" action="/pantallacli/turnoControlador" method="POST">
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
                                    <input type="text" name="idper"  value="${persona.id}">
                                    <input name="dni" type="text" value="${dni}"
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
        <%@include file="/comunes/footer1.jsp" %>
    </body>
</html>
