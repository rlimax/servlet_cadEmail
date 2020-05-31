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
			sql = conexao.prepareStatement("select * from tb_usuario where id > 8;");
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

}
