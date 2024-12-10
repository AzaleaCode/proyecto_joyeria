package com.emergentes.cotrolador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.PedidoDAO;
import com.emergentes.dao.PedidoDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Cliente;
import com.emergentes.modelo.Pedido;
import com.emergentes.modelo.Producto;
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

@WebServlet(name = "PedidoController", urlPatterns = {"/PedidoController"})
public class PedidoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            Pedido pedido = new Pedido();
            PedidoDAO dao = new PedidoDAOimpl();
            ProductoDAO daoProducto = new ProductoDAOimpl();
            ClienteDAO daoCliente = new ClienteDAOimpl();

            List<Producto> lista_productos = null;
            List<Cliente> lista_clientes = null;

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    lista_clientes = daoCliente.getAll();
                    lista_productos = daoProducto.getAll();

                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("lista_productos", lista_productos);

                    request.setAttribute("pedido", pedido);
                    request.getRequestDispatcher("frmpedido.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    pedido = dao.getById(id);
                    lista_clientes = daoCliente.getAll();
                    lista_productos = daoProducto.getAll();

                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("lista_productos", lista_productos);

                    request.setAttribute("pedido", pedido);
                    request.getRequestDispatcher("frmpedido.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("PedidoController");
                    break;
                case "view":
                    List<Pedido> lista = dao.getAll();
                    request.setAttribute("pedidos", lista);
                    request.getRequestDispatcher("pedidos.jsp").forward(request, response);
                    break;

            }

        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        float precio = Float.parseFloat(request.getParameter("precio"));
        int entregado = Integer.parseInt(request.getParameter("entregado"));
        int pagado = Integer.parseInt(request.getParameter("pagado"));
        String direccion = request.getParameter("direccion");
        int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
        int producto_id = Integer.parseInt(request.getParameter("producto_id"));

        Pedido pedido = new Pedido();
        pedido.setId(id);
        pedido.setFecha(fecha);
        pedido.setPrecio(precio);
        pedido.setEntregado(entregado);
        pedido.setPagado(pagado);
        pedido.setDireccion(direccion);
        pedido.setProducto_id(producto_id);
        pedido.setCliente_id(cliente_id);

        if (id == 0) {
            PedidoDAO dao = new PedidoDAOimpl();
            try {
                dao.insert(pedido);
                response.sendRedirect("PedidoController");
            } catch (Exception ex) {
                Logger.getLogger(PedidoController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            PedidoDAO dao = new PedidoDAOimpl();
            try {
                dao.update(pedido);
                response.sendRedirect("PedidoController");
            } catch (Exception ex) {
                Logger.getLogger(PedidoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
