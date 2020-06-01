<%@page import="dao.UsuarioDao"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		div{
			text-align: center;
		}
		h2{
			margin-top: 10px;
			font-size: 24pt;
			color: white;
			text-shadow: 0px 3px 1px black;
		}
		table{
			width: 80%;
			margin-left:auto;
			margin-right:auto;
			margin-botton: 40px;
			border: 1px solid white;
			border-spacing: 0px;
			background-color: rgba(255,255,255,.6);

		}
		tr.transp{
			background-color: rgba(255,255,255,1);
		}
		td, th{
			height: 50px;
			text-align: center;	
			padding: 5px;
		}
		span.med{
			font-size:17pt;
		}
		label, .peq{
			position: relative;
			display: block;
			float: left;
		}
		span.peq{
			font-size:10pt;
		}
		span.ico{
			font-size: 17pt;
			display: inline-block;
			width: 30px;
			height: 30px;
			color: white;
			border-radius: 20px;
			border: 1px solid gray;
		}
		.verd{
			background-color: green;
		}
		.verm{
			background-color: red;
		}
@media (max-width: 1360px) {
  .some {
    display:none;
  }
}
	</style>
	<meta charset="utf-8" />
	<script>
		var i = 50
		var direc = 4
		function cores(){
			document.body.style.backgroundColor = "rgba("+50+","+(i-50)+","+i+",.3)"
			if(i>=200){
				direc=-direc
			}
			if(i<50){
				direc = 4;				
			}
			i+=direc;
		}
	</script>
</head>
<body onload="setInterval(function(){cores()},100);">
	<div id="corpo">
		<br />
		<h2>Lista de mensagens</h2>
		<table>
			<thead>
				<tr>
					<th>
						&nbsp;&nbsp;
						Nº
						&nbsp;&nbsp;
					</th>
					<th>NOME</th>
					<th>EMAIL</th>
					<th class="some">MENSAGEM</th>
					<th colspan="2">AÇÃO</th>
				</tr>
			</thead>
			<tbody>
		<%
			boolean c = true;

			UsuarioDao u = new UsuarioDao();
			List<Usuario> l = u.ler();
			int n = l.size();
			for(Usuario user : l){
				if(c){
					out.print("<tr class=\"transp\">");
					c=false;
				}else{
					out.print("<tr>");
					c=true;
				}
				out.print("<td>"+n+
						  "</td><td>"+user.getNome()+
						  "</td><td>"+user.getEmail()+
						  "</td><td class=\"some\">"+user.getMensagem()+"</td>"+
						  "<td><a href='index.jsp?id="+user.getId()+"&act=atualizar'><span title=\"alterar\" class=\"ico verd\">&#9998;</span></a></td><td><a href='XServlet?id="+user.getId()+"&act=deletar' onclick=\"return confirm('Deseja excluir esse registro?')\"><span title=\"apagar\" class=\"ico verm\">&#10005;</span></a></td></tr>");
				n--;
			}
		%>
			</tbody>
		</table>
		<br /><br /><br /><br />
	</div>
</body>
</html>