<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="/static/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/static/assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="/static/assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="/static/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/static/assets/img/favicon.png">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <div class="logo text-center"><img src="/static/assets/img/logo-dark.png" alt="Klorofil Logo"></div>
                            <p class="lead">登录到你的账号</p>
                        </div>
                        <form class="form-auth-small" action="/login" method="post">
                            <div class="form-group">
                                <label for="signin-email" class="control-label sr-only">邮箱</label>
                                <input type="email" name="email" class="form-control" id="signin-email"  placeholder="邮箱">
                            </div>
                            <div class="form-group">
                                <label for="signin-password" class="control-label sr-only">密码</label>
                                <input type="password" name="password" class="form-control" id="signin-password"  placeholder="密码">
                            </div>
                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left">
                                    <input type="checkbox">
                                    <span>记住我</span>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
                            <div class="bottom">
                                <span class="helper-text"><i class="fa fa-lock"></i> <a href="#">忘记密码</a></span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                        <h1 class="heading">欢迎来到&nbsp;&nbsp;珐依娪!</h1>
                        <p>后台管理系统</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

</html>

