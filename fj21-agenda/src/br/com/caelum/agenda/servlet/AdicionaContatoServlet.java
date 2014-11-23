package br.com.caelum.agenda.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;

import java.text.ParseException;

@WebServlet("/adicionaContato")
public class AdicionaContatoServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//writer
		PrintWriter out = resp.getWriter();
		
		// parametros de input
		String nome = req.getParameter("nome");
		String endereco = req.getParameter("endereco");
		String email = req.getParameter("email");
		String dataTxt = req.getParameter("dataNascimento");
		Calendar dataNascimento = null;
		
		
		//conversao de data de txt para calendar
		try{
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataTxt);
			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);
			
		} catch(ParseException e){
			throw new ServletException(e);
//			out.println("Erro de conversao da data");
//			return;
		}
		
		//objeto contato
		Contato contato = new Contato();
		contato.setNome(nome);
		contato.setEndereco(endereco);
		contato.setEmail(email);
		contato.setDataNascimento(dataNascimento);
		
		//salva contato
		ContatoDao dao = new ContatoDao();
		dao.adiciona(contato);
		
		//imprime nome do contato que foi adicionado
		
//		out.println("<html>");
//		out.println("<body>");
//		out.println("Contato " + contato.getNome() + " adicionado com sucesso");
//		out.println("</html>");
//		out.println("</body>");
		
		RequestDispatcher rd = req.getRequestDispatcher("/contato-adicionado.jsp");
		rd.forward(req, resp);

	}

}
