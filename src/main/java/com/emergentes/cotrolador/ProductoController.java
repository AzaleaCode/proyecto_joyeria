package com.emergentes.cotrolador;

import com.emergentes.dao.CategoriaDAO;
import com.emergentes.dao.CategoriaDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Categoria;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoController", urlPatterns = {"/ProductoController"})
public class ProductoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            Producto producto = new Producto();
            ProductoDAO dao = new ProductoDAOimpl();
            CategoriaDAO daoCategoria = new CategoriaDAOimpl();
            List<Categoria> lista_categorias = null;

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    lista_categorias = daoCategoria.getAll();
                    request.setAttribute("lista_categorias", lista_categorias);
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;

                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    producto = dao.getById(id);
                    lista_categorias = daoCategoria.getAll();
                    request.setAttribute("lista_categorias", lista_categorias);
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmproducto.jsp").forward(request, response);
                    break;
                case "delete":

                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoController");
                    break;
                case "view":
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
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
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String precioStr = request.getParameter("precio");
            String cantidadStr = request.getParameter("cantidad");
            String categoriaIdStr = request.getParameter("categoria_id");

            int id = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : 0;
            float precio = (precioStr != null && !precioStr.isEmpty()) ? Float.parseFloat(precioStr) : 0.0f;
            int cantidad = (cantidadStr != null && !cantidadStr.isEmpty()) ? Integer.parseInt(cantidadStr) : 0;
            int categoria_id = (categoriaIdStr != null && !categoriaIdStr.isEmpty()) ? Integer.parseInt(categoriaIdStr) : 0;

            Producto pro = new Producto();
            pro.setId(id);
            pro.setNombre(nombre);
            pro.setDescripcion(descripcion);
            pro.setPrecio(precio);
            pro.setCantidad(cantidad);
            pro.setCategoria_id(categoria_id);

            ProductoDAO dao = new ProductoDAOimpl();
            if (id == 0) {
                try {
                    dao.insert(pro);
                    response.sendRedirect("ProductoController");
                } catch (Exception ex) {
                    Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    dao.update(pro);
                    response.sendRedirect("ProductoController");
                } catch (Exception ex) {
                    Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, "Error de formato numérico", ex);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de número incorrecto");
        } catch (Exception ex) {
            Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, "Error en doPost", ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en el servidor");
        }
    }
}
