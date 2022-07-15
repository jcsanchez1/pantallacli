<%@include file="/comunes/sesion.jsp" %>
<%@include file="/comunes/noatras.jsp" %>
<%@include file="/comunes/validar_pant.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/comunes/head1.jsp" %>
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
                    <form class="login-form" action="/pantallacli/personaControlador" method="POST">
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
                                    <div class="offset-2 col-8">
                                        <button name="crear-persona" type="submit" class="btn btn-primary btn-block btn-lg">Crear</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form> 


                </div>
            </div>
        </div>
    </main>
<%@include file="/comunes/footer1.jsp" %>

</body>
</html>