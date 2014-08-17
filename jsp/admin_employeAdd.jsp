<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>登録画面</title>
</head>
<body>
人事管理システム　周　晩華
<div align="right" >
<input type="button" value="メニュー戻る">
</div>
<div align="center" >
<h1>社員情報登録</h1>
<form>
社員名：
<input type="text" name="name"　size="20"/>
所属：
<select name="cars">
<option value="営業部">営業部</option>
<option value="saab">会計部</option>
<option value="fiat">人事部</option>
<option value="audi">技術部</option>
</select>
<br/>
性別：
<input type="radio" name="Sex" value="Male" checked="checked">
男
<input type="radio" name="Sex" value="Female">
女
役職：
<select name="cars">
<option value="ss">課長</option>
<option value="saab">係長</option>
<option value="fiat">部長</option>
<option value="audi">正社員</option>
<option value="audi">アルバイト</option>
</select>
<br />
生年月日：
<input type="text" name="number"　size="20"/>
雇用形態：
<select name="cars">
<option value="ss">正社員</option>
<option value="saab">契約社員</option>
<option value="fiat">派遣社員</option>
<option value="audi">アルバイト</option>
</select>
</br>


</form>
</body>
</html>