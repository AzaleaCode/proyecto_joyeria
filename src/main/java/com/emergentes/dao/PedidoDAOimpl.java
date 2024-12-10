
package com.emergentes.dao;

import com.emergentes.modelo.Pedido;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAOimpl extends ConexionDB implements PedidoDAO{

    @Override
    public void insert(Pedido pedido) throws Exception {
     try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO pedidos (fecha, precio, entregado, pagado, direccion, cliente_id, producto_id) values(?, ?, ?, ?, ?, ?, ?)");
             
            ps.setString(1, pedido.getFecha());
            ps.setFloat(2, pedido.getPrecio());
            ps.setInt(3, pedido.getEntregado());
            ps.setInt(4, pedido.getPagado());
            ps.setString(5, pedido.getDireccion());
            ps.setInt(6, pedido.getCliente_id());
            ps.setInt(7, pedido.getProducto_id());
            
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }    
    }

    @Override
    public void update(Pedido pedido) throws Exception {
        
         try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE pedidos SET  fecha = ?, precio = ?, entregado = ?, pagado = ?, direccion = ?,  cliente_id = ?, producto_id = ?  where id = ?");
             ps.setString(1, pedido.getFecha());
            ps.setFloat(2, pedido.getPrecio());
            ps.setInt(3, pedido.getEntregado());
            ps.setInt(4, pedido.getPagado());
            ps.setString(5, pedido.getDireccion());
            ps.setInt(6, pedido.getCliente_id());
            ps.setInt(7, pedido.getProducto_id());
            ps.setInt(8, pedido.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
          }

    @Override
    public void delete(int id) throws Exception {
         try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM pedidos WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Pedido getById(int id) throws Exception {
        Pedido pe = new Pedido();

        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM pedidos WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pe.setId(rs.getInt("id"));
                pe.setFecha(rs.getString("fecha"));
                pe.setPrecio(rs.getFloat("precio"));
                pe.setEntregado(rs.getInt("entregado"));
                pe.setPagado(rs.getInt("pagado"));
                pe.setDireccion(rs.getString("direccion"));
                pe.setCliente_id(rs.getInt("cliente_id"));
                pe.setProducto_id(rs.getInt("producto_id"));
                
                
            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return pe;
        }

    @Override
    public List<Pedido> getAll() throws Exception {
        List<Pedido> lista = null;
        try {
            this.conectar();

            PreparedStatement ps = this.conn.prepareStatement("SELECT pe. *, p.nombre as producto, c.nombres as cliente  FROM pedidos pe \n" +
"                   LEFT JOIN productos p ON pe.producto_id=p.id\n" +
"                     LEFT JOIN clientes c ON pe.cliente_id = c.id");
            ResultSet rs = ps.executeQuery();
          
            lista = new ArrayList<Pedido>();

            while (rs.next()) {
             Pedido pe = new Pedido();
                pe.setId(rs.getInt("id"));
                pe.setFecha(rs.getString("fecha"));
                pe.setPrecio(rs.getFloat("precio"));
                pe.setEntregado(rs.getInt("entregado"));
                pe.setPagado(rs.getInt("pagado"));
                pe.setDireccion(rs.getString("direccion"));
                pe.setProducto_id(rs.getInt("producto_id"));
                pe.setCliente_id(rs.getInt("cliente_id"));
                
                pe.setCliente(rs.getString("cliente"));
                pe.setProducto(rs.getString("producto"));
                lista.add(pe);
            }
            rs.close();
            ps.close();

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
      }
    
}
