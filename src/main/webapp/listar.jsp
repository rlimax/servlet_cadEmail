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
			margin-left:auto;
			margin-right:auto;
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
				</tr>
			</thead>
			<tbody>
		<%
			boolean c = true;
			int n = 1;
			UsuarioDao u = new UsuarioDao();
			List<Usuario> l = u.ler();
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
						  "</td><td class=\"some\">"+user.getMensagem()+"</td></tr>");
				n++;
			}
		%>
			</tbody>
		</table>
	</div>
</body>
</html>