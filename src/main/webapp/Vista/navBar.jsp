<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<header>
        <nav class="container-fluid navbar navbar-expand-lg mb-5 fixed-top bg-danger navbar-dark">
          <div class="container">
            <a class="navbar-brand text-uppercase" href="Controlador?accion=inicio">App Contable</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="Controlador?accion=inicio">Inicio</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Controlador?accion=listar">Registros</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Controlador?accion=listaCuentas">Cuentas contables</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Controlador?accion=listaCuentas">Tutorial</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Acerca de</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
    </header>
</body>
</html>