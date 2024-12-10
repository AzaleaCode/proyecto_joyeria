
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="styles.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://3.bp.blogspot.com/-6iJtGhXfUgE/V0zHCFrq_rI/AAAAAAAAKx0/T6HHANQGDRQFqfLF2vLaymhYwf_4C5NYwCLcB/s1600/Joyeria%2Bfina%2Ben%2Bplata%2B3.jpg'); /* URL de la imagen de fondo */
            background-size: cover; /* Cubre toda la pantalla */
            background-position: center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita repetir la imagen */
        }
        .container-hero {
            background-color: rgba(52, 58, 64, 0.8); /* Fondo semi-transparente */
            color: white;
            padding: 10px 0;
        }
        .container-logo h1 {
            margin: 0;
            padding: 0;
            text-align: center;
            color: #343a40; /* Color del título de la empresa */
            font-size: 28px;
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        .container-logo h1 a {
            color: #343a40; /* Color del título de la empresa */
            text-decoration: none;
        }
        .container-user {
            text-align: right;
            padding-right: 20px;
        }
        header {
            background-color: #007bff;
            padding: 10px 0;
            color: white;
        }
        .container {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo blanco semi-transparente */
            margin: 20px auto;
            max-width: 600px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .container h1 {
            text-align: center;
            color: #343a40; /* Color del título */
            font-size: 24px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #343a40; /* Color del texto */
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-family: Arial, sans-serif; /* Fuente sans-serif para los campos de formulario */
        }
        .btn {
            text-decoration: none;
            padding: 10px 20px;
            color: white;
            background-color: #007bff;
            border-radius: 5px;
            display: inline-block;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>

    <title>Categorías</title>
</head>
<body>
    <div class="container-hero">
        <div class="container hero">
            <div class="customer-support">
                <div class=""></div>
            </div>
            <div class="container-logo">
                <i class=""></i>
                <h1 class=""><a href="/">JOYERIA</a></h1>
            </div>
            <div class="container-user">
                <i class=""></i>
                <i class=""></i>
            </div>
        </div>
    </div>
    <jsp:include page="WEB-INF/menu.jsp"> 
        <jsp:param name="opcion" value="categorias" />  
    </jsp:include>

    <div class="container">
        <h1>Formulario de Categorías</h1>
        <form action="CategoriaController" method="post">
            <input type="hidden" name="id" value="${categoria.id}">
            <div class="form-group">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" id="nombre" class="form-control" name="nombre" value="${categoria.nombre}" placeholder="Ingrese el nombre">
            </div>
            <div class="form-group">
                <label for="descripcion" class="form-label">Descripción</label>
                <input type="text" id="descripcion" class="form-control" name="descripcion" value="${categoria.descripcion}" placeholder="Ingrese la descripción">
            </div>
            <button type="submit" class="btn btn-primary">Enviar</button>
        </form>
    </div>
</body>
</html>
