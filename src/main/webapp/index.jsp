<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sportsmate</title>

    <link rel="stylesheet" href="resources/static/css/Sportsmate11.css">

    <style>
        * {margin:0; padding:0;}
    </style>

</head>
<body>
<div id="main">
    <h2 class="main_title">Sportsmate</h2>
</div>

<div class="intro">
    <div class="intro_window">
        <div class="intro_header">
            <div class="header_title">www.sportsmate.com</div>
            <div class="window-controls">
                <div class="window-minimize"></div>
                <div class="window-maximize"></div>
                <div class="window-close"></div>
            </div>
        </div>

        <div class="intro_window_content">
            <div class="intro_text">
                <h2 style="font-size: 50px; margin-bottom: 50px; margin-top: 80px;">Sportsmate란?</h2>
                <p>
                    함께 운동할 친구를 찾고 계신가요? <br>
                    Sportsmate를 통해 운동 파트너를 쉽게 찾을 수 있습니다. <br>
                    이제 혼자가 아닌, 함께 운동할 친구를 찾아서 <br>
                    건강하고 활기찬 라이프스타일을 즐길 수 있어요!
                </p>

                <p style="margin: 20px">
                    ▽
                </p>

                <div class="go_home">
<%--                    <button class="go_btn" onclick="location.href='Home/MainHome.jsp'" style="cursor: pointer">--%>
                    <button class="go_btn" onclick="location.href='/mvcboard/MainHome.do'" style="cursor: pointer">
                        <b>바로 가기</b>
                    </button>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>