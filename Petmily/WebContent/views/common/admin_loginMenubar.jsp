<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pm.admin_Login.model.vo.AdminMember"%>
<%
    String contextPath = request.getContextPath();

	AdminMember loginAdmin = (AdminMember)session.getAttribute("loginAdmin");

 %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>adminMemManager</title>
    <style>
        /* 전체적 구조 */
        .header{width:100%;height:140px;text-align: center;line-height: 140px;}
        .nav-area{height: 10px;}
    
        /* header부분 전반적인 구조 */
        .header>div{height: 70px; }
        #logo{width: 35%; position: relative; margin: 0 auto;}

        /* navigator 영역에 대한 세부 스타일 */
        .nav-area{
            position: relative;
            background: rgb(247, 198, 4);
            height: 60px; 
            width: 100%;
            margin: 0 auto;
        }
        .nav-area .inner{
            position: relative;
            width: 1600px;
            margin: 0 auto;
        }
        .nav-area .inner .logout{
            position: absolute;
            top: 17px;
            right: 15px;
            display: block;
            color:black;
            font-size: 16px;
            font-weight: bold;
        }
        .nav-area .menu-box{
            width: 1200px;
        }
        .menu{
            display: table-cell;
            width: 160px;
            height: 60px;
        }
        .menu a{
            text-decoration: none;
            color: black;
            font-size: 20px;
            font-weight: bold;
            display: block;
            width: 90%;
            height: 100%;
            line-height: 60px;
            cursor: pointer;
        }
        .menu a:hover{background: white; text-decoration: none; color:black}
        

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    
    <body>
        <!-- 상단 로고 -->
        <div class="header">
            <div id="logo">
                <a href=""><a href="" id="adminmain">
                <img style="width: 350px;" src="resources/img/logo_side.png" alt="">
            	</a>
            </div>  
        </div>
       <!-- 메뉴바 -->
        <div class="nav-area" align="center">
            <div class="inner" style="width: 1600px; margin: 0 auto;">
                <div class="menu-box">
                    <div class="menu"></div> 
                    <div class="menu"></div>
                    <div class="menu"></div>
                    <div class="menu"></div>
                    <div class="menu"></div>
                    <div class="menu"></div>
                </div>
                <a class="logout"></a>
            </div>
        </div>
    
    </body>
    </html>