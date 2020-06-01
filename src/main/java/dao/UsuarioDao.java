package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Usuario;

public class UsuarioDao{
	public boolean incluir(Usuario user) {
		try {
			Connection conexao = Conexao.getConn();
			PreparedStatement sql;
			sql = conexao.prepareStatement("insert into tb_usuario(nome, email, mensagem) values(?,?,?);");
			sql.setString(1, user.getNome());
			sql.setString(2, user.getEmail());
			sql.setString(3, user.getMensagem());
			sql.execute();
			sql.close();
			conexao.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Usuario> ler() {
		try {
			Connection conexao = Conexao.getConn();
			PreparedStatement sql;
			sql = conexao.prepareStatement("select * from tb_usuario order by id desc;");
			ResultSet rs = sql.executeQuery();
			List<Usuario> ls = new ArrayList<Usuario>();
			while(rs.next()){
				Usuario u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setNome(rs.getString("nome"));
				u.setEmail(rs.getString("email"));
				u.setMensagem(rs.getString("mensagem"));
				ls.add(u);
			}
			sql.close();
			conexao.close();
			return ls;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Usuario consulta(String id) {
		try {
			Connection conexao = Conexao.getConn();
			PreparedStatement sql;
			sql = conexao.prepareStatement("select * from tb_usuario where id = ?;");
			sql.setInt(1, Integer.parseInt(id));
			
			ResultSet rs = sql.executeQuery();
			Usuario u = new Usuario();
			while(rs.next()){
				u.setId(rs.getInt("id"));
				u.setNome(rs.getString("nome"));
				u.setEmail(rs.getString("email"));
				u.setMensagem(rs.getString("mensagem"));
			}
			sql.close();
			conexao.close();
			return u;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean alterar(Usuario u) {
		try {
			Connection conexao = Conexao.getConn();
			PreparedStatement sql;
			sql = conexao.prepareStatement("update tb_usuario set nome=?, email=?, mensagem=? where id=?;");
			
			sql.setString(1, u.getNome());
			sql.setString(2, u.getEmail());
			sql.setString(3, u.getMensagem());
			sql.setInt(4, u.getId());
			sql.execute();
			sql.close();
			conexao.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deletar(String id) {
		try {
			Connection conexao = Conexao.getConn();
			PreparedStatement sql;
			sql = conexao.prepareStatement("delete from tb_usuario where id=?;");
			sql.setInt(1, Integer.parseInt(id));
			sql.execute();
			sql.close();
			conexao.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
