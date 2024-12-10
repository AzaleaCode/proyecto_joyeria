
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
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
                background-color: #343a40;
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
                background-color: white;
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

        <title>Producto</title>
    </head>
    <body>
        <div class="container-hero">
            <div class="container hero">
                <div class="customer-support">

                    <div class="">

                    </div>
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
        <jsp:include page="WEB-INF/menu.jsp" >
            <jsp:param name="opcion" value="productos" />
        </jsp:include>
        <div class="container">
            <h1>Formulario de Productos</h1>   

            <br>
            <form action="ProductoController" method="post">
                <input type="hidden" name="id" value="${producto.id}">

                <div class="form-group">
                    <label for="" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" value="${producto.nombre}" placeholder="Escriba su nombre">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Descripcion</label>
                    <input type="text" class="form-control" name="descripcion" value="${producto.descripcion}" placeholder="Escriba la descripcion">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Precio</label>
                    <input type="text" class="form-control" name="precio" value="${producto.precio}" placeholder="Escriba el Precio">

                </div>

                <div class="form-group">
                    <label for="" class="form-label">Cantidad</label>
                    <input type="text" class="form-control" name="cantidad" value="${producto.cantidad}" placeholder="Escriba la cantidad">

                </div>

                <div class="form-group">
                    <label for="" class="form-label">Categoria</label>
                    <select name="categoria_id" class="form-control">
                        <option value="">--SELECCIONE--</option>
                        <c:forEach var="item" items="${lista_categorias}">
                            <option value="${item.id}"
                                    <c:if test="${producto.categoria_id == item.id}"> 
                                        selected
                                    </c:if> 
                                    >${item.nombre}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>   






        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    </body>
</html>