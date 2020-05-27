package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/XServlet")
public class XServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		out.print("<html><head>");
		out.print("<style>div#corpo{text-align:center; width: 30%;height: 250px; min-width: 244px;"
				+ "margin: 50px auto; padding: 5px; border-radius: 20px; border: 2px dotted white;}"
				+ "h2{margin-botton: 10px;margin-top: 30px; letter-spacing:3px;}h1{margin-top: 10px; "
				+ "font-size: 40pt; color:white; text-shadow: 0px 3px 1px black;} span{font-weight:bold; font-size: 16pt;}</style>");
		//out.print("<meta charset=\"utf-8\" />");
		out.print("<script>var i = 50; var direc = 4;");
		out.print("function cores(){document.body.style.backgroundColor = \"rgba(\"+50+\",\"+(i-50)+\",\"+i+\",.3)\";");
		out.print("if(i>=200){ direc=-direc;}"); 
		out.print("if(i<50){direc = 4;}"); 
		out.print("i+=direc;}</script>");

		out.print("</head><body onload=\"setInterval(function(){cores()},200)\">");
		out.print("<div id=\"corpo\"><h2>Servlet OnLine</h2><br />");
		out.print("O email digitado foi: <span>"+email+"</span><br /><h1>&#9996;</h1><br /><br />");

		try {
			//definir acesso banco de dados
			Class.forName("com.mysql.cj.jdbc.Driver");
			//Connection conexao = DriverManager.getConnection("jdbc:mysql://[server]/[bd]", "[user]", "[password]");
			out.print("<br />Conexão com o BD bem sucedida.");
			PreparedStatement sql = conexao.prepareStatement("insert into usuario(email) values(?);");
			sql.setString(1, email);
			sql.execute();
			if(sql.getUpdateCount()>0){
				out.print("<br />Email cadastrado com sucesso.");
			}else {
				out.print("<br />Email não cadastrado.");		
			}
			sql.close();
			conexao.close();
		} catch (Exception e) {
			out.print("<br />Ocorreu um erro com sua requisição.");
		}

		out.print("</div></body></html>");
	}

}
