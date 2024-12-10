<%
    String opcion = request.getParameter("opcion");
%>
<style>
    .btn-modern:hover {
        background: linear-gradient(135deg, #a777e3, #6e8efb);
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        transform: translateY(-2px);
    }
</style>




<div class="container-navbar">
    <nav class="navbar container">
        <i class="fa-solid fa-bars"></i>
        <ul class="menu">

            <li><a href="index.jsp">Inicio</a></li>


            <li >
                <a class="nav-link <%=(opcion.equals("productos") ? "active" : "")%>" href="ProductoController">Productos</a>
            </li>

            <li >
                <a class="nav-link <%=(opcion.equals("clientes") ? "active" : "")%>" href="ClienteController">Clientes</a>
            </li>
            
            <li >
                <a class="nav-link <%=(opcion.equals("pedidos") ? "active" : "")%>" href="PedidoController">Pedidos</a>
            </li>
 
            <li >
                <a class="nav-link <%=(opcion.equals("categorias") ? "active" : "")%>" href="CategoriaController">Categorias</a>
            </li>

            <li >
                <a class="nav-link <%=(opcion.equals("proveedores") ? "active" : "")%>" href="ProveedorController">Proveedores</a>
            </li>

            <li >
                <a class="nav-link <%=(opcion.equals("usuarios") ? "active" : "")%>" href="UsuarioController">Usuarios</a>
            </li>



        </ul>

        <a href="LoginController?action=logout" class="btn btn-outline-success btn-modern" style="border-radius: 25px; padding: 10px 20px; font-size: 16px; font-weight: bold; text-transform: uppercase; background: linear-gradient(135deg, #6e8efb, #a777e3); color: white; border: none; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); transition: all 0.3s ease;">
            Cerrar Sesión
        </a>





        </form>
    </nav>
</div>
