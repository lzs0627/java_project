<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%

String msg = (String)request.getAttribute("msg");


%>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>企業人事管理システム｜管理者ログイン</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="/wanwan/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="/wanwan/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="/wanwan/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">

        <div class="form-box" id="login-box">
<% if (msg!=null){%>
                    <%=msg%>            
<% }else{%>
            <form action="" method="post">
                <div class="form-group">
                    ID<input type="text" name="username" class="form-control" placeholder="User Name"/>
                </div>
                <div class="footer">                                                               
                    <button type="submit" class="btn bg-olive btn-block">パスワード探す</button>
                </div>
            </form>


<% } %>
            
            
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="/wanwan/js/jquery-2.1.1.min.js"></script>
        <!-- Bootstrap -->
        <script src="/wanwan/js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>