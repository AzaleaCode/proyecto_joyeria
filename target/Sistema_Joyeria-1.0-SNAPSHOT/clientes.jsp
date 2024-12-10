 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Goudy+Stout&display=swap');
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
            /* Fondo de imagen con URL */
            background-image: url('https://3.bp.blogspot.com/-6iJtGhXfUgE/V0zHCFrq_rI/AAAAAAAAKx0/T6HHANQGDRQFqfLF2vLaymhYwf_4C5NYwCLcB/s1600/Joyeria%2Bfina%2Ben%2Bplata%2B3.jpg');
            background-size: cover; /* Ajustar el tamaño de la imagen */
            background-position: center; /* Centrar la imagen */
            background-repeat: no-repeat; /* Evitar repetición de la imagen */
        }
        .container-hero {
            background-color: #d2b48c; /* Café claro */
            color: white;
            padding: 20px 0;
        }
        .container-hero .hero {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        .container-logo h1 {
            margin: 0;
            font-size: 24px;
            font-family: 'Goudy Stout', cursive; /* Aplicar la fuente 'Goudy Stout' */
            color: black; /* Color negro */
        }
        header {
            background-color: #d2b48c; /* Café claro */
            color: white;
            padding: 10px 20px;
        }
        .main-content {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
        }
        .btn {
            text-decoration: none;
            padding: 10px 20px;
            color: white;
            background-color: #d2b48c; /* Café claro */
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s;
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        .btn:hover {
            background-color: #b88a60; /* Café oscuro */
        }
        .table-container {
            margin-top: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-family: 'Arial', sans-serif; /* Fuente sans-serif para una buena legibilidad */
            font-weight: bold; /* Texto en negrita */
            font-size: 16px; /* Tamaño de fuente aumentado */
            color: #333; /* Color de texto */
        }
        th {
            background-color: #d2b48c; /* Café claro */
            color: white;
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        tr:hover {
            background-color: #f5e8dc; /* Café claro más claro */
        }
        .fas {
            color: #d2b48c; /* Café claro */
            transition: color 0.3s;
        }
        .fas:hover {
            color: #b88a60; /* Café oscuro */
        }
    </style>
</head>
<body>
    <header>
        <div class="container-hero">
            <div class="container hero">
                <div class="customer-support"></div>
                <div class="container-logo">
                    <h1>JOYERIA</h1>
                </div>
                <div class="container-user">
                   
                </div>
            </div>
        </div>
        <jsp:include page="WEB-INF/menu.jsp">
            <jsp:param name="opcion" value="clientes" />
        </jsp:include>
    </header>

    <section>
        <div>
            <h1>CLIENTES</h1>
            <br>
            <a href="ClienteController?action=add" class="btn btn-primary btn-sm"><i class="fas fa-plus-circle"></i> Nuevo</a>
            
            <div class="main-content">
                <table>
                    <tr>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Id</th>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Nombres</th>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Apellidos</th>
                         <th style="color: white; font-weight: bold; font-size: 20px;">Ci</th>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Direccion</th>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Telefono</th>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Correo Electronico</th>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Editar</th>
                        <th style="color: white; font-weight: bold; font-size: 20px;">Eliminar</th>
                    </tr>
                    <c:forEach var="item" items="${clientes}">
                        <tr>
                            <td style="color: black; font-weight: bold; font-size: 20px;">${item.id}</td>
                            <td style="color: black; font-weight: bold; font-size: 20px;">${item.nombres}</td>
                            <td style="color: black; font-weight: bold; font-size: 20px;">${item.apellidos}</td>
                            <td style="color: black; font-weight: bold; font-size: 20px;">${item.ci}</td>
                            <td style="color: black; font-weight: bold; font-size: 20px;">${item.direccion}</td>
                            <td style="color: black; font-weight: bold; font-size: 20px;">${item.telefono}</td>
                            <td style="color: black; font-weight: bold; font-size: 20px;">${item.email}</td>
                            <td><a href="ClienteController?action=edit&id=${item.id}"><i class="fas fa-edit"></i></a></td>
                            <td><a href="ClienteController?action=delete&id=${item.id}" onclick="return confirm('¿Está seguro?')"><i class="fas fa-trash-alt"></i></a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </section>
    <script src="https://kit.fontawesome.com/81581fb069.js"></script>
</body>
</html>
