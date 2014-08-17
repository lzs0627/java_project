<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
String error = (String)request.getAttribute("error");
%>
<html>
<head>
<title>登録画面</title>
</head>
<body>
	<%if(error!=null){%>
	<p style="color:red;font-size:11px;"><%=error%></p>
	<%}%>
<div align="center" style="border:6px solid black">
<h1>人事管理システム</h1>
<form action="" method="post">
ユーザー名: 
<input type="text" name="username" size="20"/>
<br />
   パスワード : 
<input type="password" name="password" size="20"/>
<br/>
<label>
<input type="checkbox" name="id" />
次回からIDの入力を省略
</label>
<br/>
<br/>
<input type="submit" value="ログイン">
<input type="reset" value="キャンセル">
</br>
</div>
<div align="center">
<ins>パスワードを忘れた？</ins>
</div>
</form>
</body>
</html>