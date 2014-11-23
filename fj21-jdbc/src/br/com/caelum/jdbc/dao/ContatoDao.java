package br.com.caelum.jdbc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.jdbc.ConnectionFactory;
import br.com.caelum.jdbc.modelo.Contato;

public class ContatoDao {

	private Connection connection;

	public ContatoDao() {

		this.connection = new ConnectionFactory().getConnection();

	}

	public void adiciona(Contato contato) {

		String sql = "insert into contatos"
				+ "(nome,email,endereco,dataNascimento)" + " values(?,?,?,?)";
		try {

			// prepared statement para inserção
			PreparedStatement stmt = this.connection.prepareStatement(sql);

			// seta os valores
			stmt.setString(1, contato.getNome());
			stmt.setString(2, contato.getEmail());
			stmt.setString(3, contato.getEndereco());
			stmt.setDate(4, new Date(contato.getDataNascimento()
					.getTimeInMillis()));

			// executa
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {

			throw new DAOException(e);

		}

	}

	public List<Contato> getLista() {

		try {

			List<Contato> contatos = new ArrayList<Contato>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from contatos where nome like 'C%'");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Contato contato = new Contato();
				contato.setId(rs.getLong("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setEndereco(rs.getString("endereco"));

				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataNascimento"));
				contato.setDataNascimento(data);

				contatos.add(contato);

			}

			rs.close();
			stmt.close();
			return contatos;

		} catch (SQLException e) {
			throw new DAOException(e);
		}

	}

	public Contato pesquisar(int id) {

		try {

			PreparedStatement stmt = this.connection
					.prepareStatement("select * from contatos where id=?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Contato contato = new Contato();
				contato.setId(rs.getLong("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setEndereco(rs.getString("endereco"));

				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataNascimento"));
				contato.setDataNascimento(data);

				rs.close();
				stmt.close();
				return contato;

			} else {

				rs.close();
				stmt.close();
				throw new SQLException("Contato inexistente!");

			}

		} catch (SQLException e) {
			throw new DAOException(e);
		}

	}
}
