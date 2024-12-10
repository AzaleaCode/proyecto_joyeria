package com.emergentes.cotrolador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.dao.ProveedorDAO;
import com.emergentes.dao.ProveedorDAOimpl;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProveedorController", urlPatterns = {"/ProveedorController"})
public class ProveedorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            Proveedor proveedor = new Proveedor();
            ProveedorDAO dao = new ProveedorDAOimpl();
            ProductoDAO daoProducto = new ProductoDAOimpl();
            List<Producto> lista_productos = null;

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    lista_productos = daoProducto.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("proveedor", proveedor);
                    request.getRequestDispatcher("frmproveedor.jsp").forward(request, response);
                    break;

                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    proveedor = dao.getById(id);
                    lista_productos = daoProducto.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("proveedor", proveedor);
                    request.getRequestDispatcher("frmproveedor.jsp").forward(request, response);
                    break;
                case "delete":

                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProveedorController");
                    break;
                case "view":
                    List<Proveedor> lista = dao.getAll();
                    request.setAttribute("proveedores", lista);
                    request.getRequestDispatcher("proveedores.jsp").forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            String nombres = request.getParameter("nombres");
            String apellidos = request.getParameter("apellidos");
            String direccion = request.getParameter("direccion");
            String telefonoStr = request.getParameter("telefono");
            String email = request.getParameter("email");
            String productoIdStr = request.getParameter("producto_id");

            int id = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : 0;
            int telefono = (telefonoStr != null && !telefonoStr.isEmpty()) ? Integer.parseInt(telefonoStr) : 0;

            int producto_id = (productoIdStr != null && !productoIdStr.isEmpty()) ? Integer.parseInt(productoIdStr) : 0;

            Proveedor pro = new Proveedor();
            pro.setId(id);
            pro.setNombres(nombres);
            pro.setApellidos(apellidos);
            pro.setDireccion(direccion);
            pro.setTelefono(telefono);
            pro.setEmail(email);
            pro.setProducto_id(producto_id);

            ProveedorDAO dao = new ProveedorDAOimpl();
            if (id == 0) {
                try {
                    dao.insert(pro);
                    response.sendRedirect("ProveedorController");
                } catch (Exception ex) {
                    Logger.getLogger(ProveedorController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    dao.update(pro);
                    response.sendRedirect("ProveedorController");
                } catch (Exception ex) {
                    Logger.getLogger(ProveedorController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(ProveedorController.class.getName()).log(Level.SEVERE, "Error de formato numérico", ex);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de número incorrecto");
        } catch (Exception ex) {
            Logger.getLogger(ProveedorController.class.getName()).log(Level.SEVERE, "Error en doPost", ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en el servidor");
        }
    }
}
