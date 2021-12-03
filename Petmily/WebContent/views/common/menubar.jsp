<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pm.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, img, li{
        box-sizing: border-box;
        border: 1px soli black;
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
    #userName{
        font-size: 14px; 
        width: 40%; 
        margin-left: 20px; 
        line-height: 40px;
        font-weight: bold;
    }
    /* 로그인 버튼 */
    #loginBtn{
        font-size: 13px;
        width:20%;
        line-height: 40px;
        margin-left:80px;
        font-weight:bold;
    }
    #loginBtn>a{text-decoration: none; color: black;}
    /* 로그아웃 버튼 */
    #logout, #register{
        font-size:13px; 
        width: 20%; 
        line-height: 40px;
        font-weight: bold;
    }
    #logout>a{text-decoration: none; color: black;}

    /* 회원가입 버튼 */
    #register >a{
        text-decoration: none; color: black;
    }

    #heart, #shoppingCart{
        line-height: 30px;
    }
    /* 찜버튼 */
    #heart img{width: 20px; height: 20px;}
    /* 장바구니버튼 */
    #shoppingCart img{width: 20px; height: 20px;}

    /* navigator 영역에 대한 세부 스타일 */
    .nav-area{background: rgb(247, 198, 4); margin-bottom: 70px;}
    .menu{
        display: table-cell;
        width: 200px;
        height: 40px;
    }
    .menu a{
        text-decoration: none;
        color: black;
        font-size: 15px;
        font-weight: bold;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 40px;
        cursor: pointer;
    }

    .menu a:hover{background: white; text-decoration: none; color:black}

    /*사이드바 스타일*/
    .sidebar-area{
        float: left;
        width: 250px;
        height: 800px;
        position: relative;
    }
    /* 사이드바 큰 제목 스타일 */
    #category{
        list-style-type: none;
        font-weight: bolder;
        font-size: 25px;
        position: absolute;
        left:90px;
    }
    /* 강아지, 고양이, 기타 카테고리 스타일*/
    .d-category{
        list-style-type: none;
        font-size: 16px;
        width: 130px;
        font-weight: bolder;
        cursor:pointer;
        margin-bottom: 5px;
    }
    #d-category{
        position: absolute;
        top:80px;
        left: 90px;
    }
    /* 세부 카테고리 전체 스타일 */
    .dd-category{
        list-style-type: none;
        color: darkgray;
        font-weight: bolder;
        font-size: 13px;
        width: 60px;
        display: none;
        margin-bottom: 3px;
        cursor: pointer;
        margin-left: 15px;
    }
    

    .menu a:hover{background: white;}
    
    
    
    
     /* footer 영역의 세부 스타일 */
     #footer{
         background-color: rgb(211, 211, 211); /* 색 다시 설정 */
     }
     #footer_1{ margin-left:40px}
     #footer_1>a{
            font-weight:600;
            margin:15px;
            line-height:20px;
            color:rgb(97, 95, 95); /* 색 다시 설정 */
            font-size: 13px;
            
        }
        #footer_2{ margin-left:40px}
        #footer_2>p{
            width:100%;
            margin:0;
            box-sizing:border-box;
            
        }
        #p1{height:80%; padding:15px; font-size:12px;}
        #p2{height:20%; padding:15px; font-size:10px; }

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
    <div class="header">
        <div id="left"></div>
        <div id="logo">
            <a href="">
                <img src="../../resources/img/logo_side.png" alt="">
            </a>
        </div>
        <div id="right">
            <!--로그인 전-->
            <div id="loginBtn">
                <a href="">로그인</a>
            </div>
            <div id="register">
                <a href="">회원가입</a>
            </div>
            
            <!-- 로그인 후
            <div id="userName">
                <b>xxxx</b>님, 반가워요! &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div id="logout">
                <a href="">로그아웃</a>
            </div>
            -->
            <div id="heart">
                <a href="">
                    <img src="../../resources/img/heart.jpg" alt="">
                </a> 
            </div>
            <div id="shoppingCart">
                <a href="">
                    <img src="../../resources/img/shopping_cart.png" alt="">
                </a>
            </div>
        </div>
    </div>

    <div class="nav-area" align="center">
        <div class="menu"><a href="">쇼핑몰</a></div>
        <div class="menu"><a href="">궁금해요</a></div>
        <div class="menu"><a href="">찾고있어요</a></div>
        <div class="menu"><a href="">PetLog</a></div>
        <div class="menu"><a href="">중고거래</a></div>
        <div class="menu"><a href="">MyPage</a></div>
        <div class="menu"><a href="">고객센터</a></div>
    </div>


    <!--  사이드바  -->
    <div class="sidebar-area">
        <ul>
            <div id="category">중고거래</div>
            <div id="d-category">
                <div class="d-category" id="dog">강아지</div>
                <div class="dd-category buy">살래요</div>
                <div class="dd-category sell">팔래요</div>

                <div class="d-category" id="cat">고양이</div>
                <div class="dd-category buy">살래요</div>
                <div class="dd-category sell">팔래요</div>

                <div class="d-category" id="etc">기타</div>
                <div class="dd-category buy">살래요</div>
                <div class="dd-category sell">팔래요</div>
            </div>
        </ul>
    </div>

    <script>
        $(function(){
            $(".d-category").click(function(){
                $(this).siblings(".d-category").css({background: "", color:"black"});
                $(this).css({background: "rgb(247, 198, 4)", color:"white"});
                const $buy = $(this).next();
    
                if($buy.css("display") == "none" && $buy.next().css("display") == "none"){
                    $(this).siblings(".buy").slideUp();
                    $(this).siblings(".sell").slideUp();
                    
                    $buy.slideDown();
                    $buy.next().slideDown();
                }else{
                    $buy.slideUp();
                    $buy.next().slideUp();
                }
            })

            $(".dd-category").click(function(){
                $(this).siblings(".dd-category").css("color", "darkgray").css("text-decoration", "none");
                $(this).css("color", "orange").css("text-decoration", "underline");
            })
        })
    </script>
    

    
    
    
      <div id="footer">
        <div id="footer_1">
            <a href="">서비스 이용약관</a> 
            <a href="">개인정보처리방침</a> 
            <a href="">협업/제휴 문의</a> 
            <a href="">고객센터</a>
        </div>
        <div id="footer_2">
            <p id="p1">
                (주)펫밀리 대표 :  개발하라묘    |     사업자 등록번호 : 123-45-67890 사업자정보확인     |     통신판매업신고번호 : 제 2021-서울강남-1004호     |       TEL : 1588-1588
				<br>서울특별시 강남구 테헤란로100 (kh빌딩) 7층
            </p>
            <p id="p2">
                Copyright © www.petmily.com all rights reserved.
            </p>
        </div>
    </div>

</body>
</html>