<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
String error = (String)request.getAttribute("error");
%>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>企業人事管理システム｜管理者ログイン</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="../css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">

        <div class="form-box" id="login-box">
            <div class="header">KNN企業人事管理ログイン</div>
            <form action="" method="post">
                <div class="body bg-gray">
                    <div class="form-group">
                        ID<input type="text" name="username" class="form-control" placeholder="User Name"/>
                    </div>
                    <div class="form-group">PASSWORD
                        <input type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>          
                    <div class="form-group">
                        <label><input type="checkbox" name="remember_me"/> 次回からIDを入力省略</label>
                    </div>
                    <%if(error != null) {%>
                    <div class="form-group has-warning">
                        <label class="control-label" for="inputWarning"><i class="fa fa-warning"></i> <%=error%></label>
                    </div>
                    <%}%>
                </div>
                <div class="footer">                                                               
                    <button type="submit" class="btn bg-olive btn-block">ログイン</button>  
                    
                    <p><a href="/wanwan/find_password">パスワードを忘れた？</a></p>
                    
                </div>
            </form>

            
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="../js/jquery-2.1.1.min.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>