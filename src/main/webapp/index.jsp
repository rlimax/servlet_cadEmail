<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		div#corpo{
			text-align:center;
			width: 30%;
			height: 250px; 
			min-width: 244px;
			margin: 50px auto;
			padding: 5px;
			border-radius: 20px;
			border: 2px dotted white;
		}
		h2{
			margin-botton: 20px;
			margin-top: -15px;
		}
		h1{
			margin-top: -10px;
			font-size: 44pt;
			color: white;
			text-shadow: 0px 3px 1px black;
		}
		input{
			border: 1px solid black;
			width:200px;
			height: 30px;
			box-shadow: 0px 2px 2px black;
			text-align:center;
		}
		input[type=submit]{
			background-color: smoke;
			height: 40px;
			border-radius: 20px;
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
<body onload="setInterval(function(){cores()},100)">
	<div id="corpo">
		<h1>&#9993;</h1>
		<form action="XServlet">
			<h2>Cadastre seu email.</h2>
			<input type="email" name="email" maxlength="40" />
			<br />
			<br />
			<input type="submit" value="ENVIAR"/>
		</form>
	</div>
</body>
</html>