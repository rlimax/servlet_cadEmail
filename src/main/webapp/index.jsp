<%@page import="dao.UsuarioDao"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		div#corpo{
			text-align:center;
			width: 35%;
			height: 540px; 
			min-width: 270px;
			margin: 30px auto;
			padding: 5px;
			border-radius: 20px;
			border: 2px dotted white;
			background-color: rgba(255,255,255,.6);
		}
		h1{
			margin-top: -10px;
			font-size: 44pt;
			color: white;
			text-shadow: 0px 3px 1px black;
		}
		input{
			border: 1px solid black;
			width:235px;
			height: 30px;
			box-shadow: 0px 2px 2px black;
			text-align:center;
		}
		input[type=submit], input[type=button]{
			background-color: smoke;
			height: 40px;
			border-radius: 20px;
		}
		table{
			border-spacing: 5px;
			margin-left:auto;
			margin-right:auto;
			margin-top:-30px;
			/*border: 1px solid red;*/
		}
		textarea{
			width:215px;
			height: 80px;
			resize: none;
			text-align: justify;
			font-style: italic;
			border: 1px solid black;
			box-shadow: 0px 2px 2px black; 
			padding: 10px;
		}
		td{
			height: 60px;
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
		function clear(){
			//document.getElementsByName('nome').autocomplete="off";
			//document.getElementsByName('email').value="";
			//document.getElementsByName('msg').value="";
		}
		function siz(){
			var x = document.querySelector('.peq');
			var y = 110 - (document.getElementById('msg').value.length);
			x.innerHTML = "Max: "+y+" caracteres.";
		}
	</script>
</head>
<%


String id = request.getParameter("id");
String act = request.getParameter("act");

Usuario u = new Usuario();
UsuarioDao dao = new UsuarioDao();

if(id != null){
	//out.println("<script>alert('Id:"+id+" Action:"+act+"');</script>");
	u = dao.consulta(id);
	act = "atualizar";
}else{
	act = "incluir";
}

%>
<body onload="setInterval(function(){cores()},100); clear()">
	<div id="corpo">
		<h1>&#9993;</h1>
		<form action="XServlet">
			<input name="act" type="hidden" value="<% out.print(act); %>" />
			<input name="id" type="hidden" value="<% out.print(id); %>" />
			<table>
				<thead>
					<tr>
						<th>
							<span class="med">Contato</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<label for="nome">Nome:</label><br />
							<input type="text" name="nome" maxlength="100" value="<% out.print(u.getNome()!= null ? u.getNome() : ""); %>"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="email">Email:</label><br />
							<input type="email" name="email" maxlength="40" value="<% out.print(u.getEmail()!= null ? u.getEmail() : ""); %>" />
						</td>
					</tr>
					<tr>
						<td>
						<label for="msg">Mensagem</label><br />
						<textarea id="msg" name="msg" maxlength="110" oninput="siz()"><% out.print(u.getMensagem()!= null ? u.getMensagem() : ""); %></textarea>
						<br /><span class="peq">Max: 110 caracteres.</span>
						</td>
					</tr>
					<tr>
						<td>
							<br /><br />
							<input type="submit" value="ENVIAR"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>