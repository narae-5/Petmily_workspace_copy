<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pm.member.model.vo.Member"%>
<%
   String contextPath = request.getContextPath();
   Member loginUser = (Member)session.getAttribute("loginUser");
   String alert = (String)session.getAttribute("alert");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div, img, li{
    box-sizing: border-box;
}
    /* 전체적 구조 */
.header{height: 140px;line-height: 140px;}
.nav-area{height: 40px;}

    /* header부분 전반적인 구조 */
.header>div{height: 100%; float: left;}
#left{width: 30%; position: relative;}
#logo{width: 41%; position: relative;text-align: center;}
#right{width: 29%; position: relative;}

/* 로고 이미지 스타일 */
#logo img{
    width: 350px;
    height: 70px;
}

/* 오른쪽 상단 전반적 구조 */
#right > div{
    height:30px; 
    float: left; 
    margin-top: 70px;
    margin-right: 12px; 
}
/* 사용자 이름 뜨는 부분 */
#memName{
    font-size: 20px; 
    width: 40%; 
    margin-left: 20px; 
    line-height: 40px;
    font-weight: bold;
}
/* 로그인 버튼 */
#loginBtn{
    font-size: 18px;
    /*width: 20%;*/ 
    line-height: 40px;
    margin-left:30px;
    font-weight:bold;
}
#loginBtn>a{text-decoration: none; color: black;}
/* 로그아웃 버튼 */
#logout, #register{
    font-size:18px; 
    /*width: 20%;*/ 
    line-height: 40px;
    margin-left:30px;
    font-weight: bold;
}
#logout>a{text-decoration: none; color: black;}

/* 회원가입 버튼 */
#register >a{
    text-decoration: none; color: black;
}

#heart, #shoppingCart{
    line-height: 30px;
    margin-left:10px;
}
/* 찜버튼 */
#heart img{width: 30px; height: 30px;}
/* 장바구니버튼 */
#shoppingCart img{width: 30px; height: 30px;}

/* navigator 영역에 대한 세부 스타일 */
.nav-area{
	background: rgb(247, 198, 4); 
	margin-bottom: 70px; 
	height:50px;
}
.menu{
    display: table-cell;
    width: 200px;
    height: 50px;

}
.menu a{
    text-decoration: none;
    color: black;
    font-size: 20px;
    font-weight: bold;
    display: block;
    width: 100%;
    height: 100%;
    line-height: 40px;
    cursor: pointer;
    padding-top:5px;
}

.menu a:hover{background: white; text-decoration: none; color:black}

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
body *{
   font-family: 'Pretendard-Regular';
}
@font-face {
    font-family: 'EliceDigitalBaeum_Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.header *{
    font-family: 'EliceDigitalBaeum_Regular';
}
.nav-area *{
    font-family: 'EliceDigitalBaeum_Regular';
}
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

	<% if(alert != null) { %>
		<script>
			alert("<%= alert %>");
		</script>
		<% session.removeAttribute("alert"); %>
	<% } %>
	
    <div class="header">
        <div id="left"></div>
        <div id="logo">
            <a href="<%= contextPath %>">
                <img src="resources/img/logo_side.png" alt="">
            </a>
        </div>
        
        <div id="right">
        
        	<% if(loginUser == null) { %>
	            <!--로그인 전-->
	            <div id="loginBtn">
	                <a href="<%= contextPath %>/loginForm.me">로그인</a>
	            </div>
	            <div id="register">
	                <a href="<%= contextPath %>/joinForm.me">회원가입</a>
	            </div>
	            
	        <% } else { %>
	            <!-- 로그인 후 -->
	            <div id="memName">
	                <b><%= loginUser.getMemName() %></b>님, 반가워요! &nbsp;&nbsp;&nbsp;&nbsp;
	            </div>
	            <div id="logout">
	                <a href="<%= contextPath %>/logout.me">로그아웃</a>
	            </div>
	            
	            <div id="heart">
	                <a href="<%= contextPath %>/like.my">
	                    <img src="resources/img/heart.jpg" alt="">
	                </a> 
	            </div>
	            <div id="shoppingCart">
	                <a href="<%= contextPath %>/cart.my">
	                    <img src="resources/img/shopping_cart.png" alt="">
	                </a>
	            </div>
	        <% } %>
        </div>
    </div>

    <div class="nav-area" align="center">
        <div class="menu"><a href="<%= contextPath %>/shop.main">스토어</a></div>
        <div class="menu"><a href="<%= contextPath %>/main.ask?page=1">궁금해요</a></div>
        <div class="menu"><a href="<%= contextPath %>/main.missing?page=1">찾고있어요</a></div>
        <div class="menu"><a href="<%= contextPath %>/main.petLog?page=1">PetLog</a></div>
        <div class="menu"><a href="<%= contextPath %>/main.market?page=1">중고거래</a></div>
        <div class="menu"><a href="<%= contextPath %>/infoUpdateForm.my">MyPage</a></div>
        <div class="menu"><a href="<%= contextPath %>/main.no">고객센터</a></div>
    </div>

    <!-- 수정필요한 부분!! -->
    <script>
        $(function(){
            $(".menu").click(function(){
                $(this).siblings(".menu").css("background", "rgb(247, 198, 4)");
                $(this).css("background", "white");
            })
        })
    </script>
</body>
</html>