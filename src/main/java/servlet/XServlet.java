package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDao;
import modelo.Usuario;

@WebServlet(urlPatterns = "/XServlet")
public class XServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String nome = req.getParameter("nome");
		String msg = req.getParameter("msg");
		out.print("<html><head>");
		out.print("<style>div#corpo{text-align:center; box-align: center; width: 35%;height: 540px;min-width: 270px;" + 
					"margin: 30px auto;padding: 5px;border-radius: 20px;border: 2px dotted white;" + 
					"background-color: rgba(255,255,255,.6);}" + 
					"h1{margin-top: -10px;font-size: 44pt;color: white;text-shadow: 0px 3px 1px black, 0px -1px 1px black;}" + 
					"input{border: 1px solid black;width:235px;height: 30px;" +
					"box-shadow: 0px 2px 2px black;text-align:center;}" + 
					"input[type=submit]{background-color: smoke;height: 40px;border-radius: 20px;}" + 
					"table{border-spacing: 5px;margin-left:auto;margin-right:auto;margin-top:-30px;}" + 
					"textarea{width:236px; height: 100px;resize: none;text-align: justify;font-weight: bold; margin:auto; display: block;" + 
					"font-style: italic;box-shadow: 0px 2px 2px black;padding: 10px;}" + 
					"td{height: 60px;}span.med{font-size:17pt;}" +
					"label, .peq{position: relative;display: block;float: left;}" + 
					"span.peq{font-size:10pt;}span.escura{font-weight: bold;}</style>");
		out.print("<script>var i = 50; var direc = 4;");
		out.print("function cores(){document.body.style.backgroundColor = \"rgba(\"+50+\",\"+(i-50)+\",\"+i+\",.3)\";");
		out.print("if(i>=200){ direc=-direc;}"); 
		out.print("if(i<50){direc = 4;}"); 
		out.print("i+=direc;}</script>");
		out.print("</head><body onload=\"setInterval(function(){cores()},200)\">");
		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = new Usuario();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setMensagem(msg);
		out.print("<div id=\"corpo\"><h2>SERVLET ONLINE</h2><br />");
		out.print("<div><span>Prezado(a) "+usuario.getNome()+",</span><br /><br />");
		out.print("O email digitado foi: <span class=\"escura\">"+usuario.getEmail()+"</span><br /><br /><br />");
		out.print("Mensagem<br /><br /><textarea disabled=\"disabled\">"+usuario.getMensagem()+"</textarea><br /><br />");
		out.print("<h1>&#9996;</h1>");
		if (dao.incluir(usuario)) {
			out.print("Sua mensagem foi enviada com sucesso.<br><br>");
			out.print("<a href=\"listar.jsp\">Listar Mensagens</a>");
		}else {
			out.print("Ocorreu um erro e sua mensagem não foi enviada.");			
		}
		out.print("</div></div></body></html>");
	}

}
