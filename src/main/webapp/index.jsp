
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0"
            />
        <title>Joyeria</title>
        <link rel="stylesheet" href="styles.css" />
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
            <jsp:param name="opcion" value="" />
        </jsp:include>

        <section class="banner">
            <div class="content-banner">

                <h2>BIENVENIDO <br />A LA PAGINA</h2>

            </div>
        </section>

        
    
        <script
            src="https://kit.fontawesome.com/81581fb069.js"
         
        ></script>
    </body>
</html>
