<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    /* 큰 틀 */
    .outer{
        width:1000px;
        height:auto;
        margin:auto;
    }
    .outer div{ 
        float:left;
    }

    /* 현재 게시판이름 */
    .top {
        width:800px;
    }
    /* 노란박스 (new) */
    .middle {
        width:800px;
        height:100px;
        background:rgb(247, 198, 4);
        line-height:50px;
        font-size:20px;
        font-weight:900;
        margin:10px;
    }
    .list-area{
        width:800px;
        

    }
    .middle>div{
    	width:100%;
    	height:45px;
    	text-align:center;
    	line-height:70px;
    }
    /* 썸네일 (아직 수정중) */
    .thumbnail{
        width:200px;
        height: 250px;
        margin:10px;
        margin-left: 55px;
    }
    .thumbnail>*{
        float: left;
    }
    #thumbnail{
        width: 220px;
        height: 200px;

    }
    .thumbnail>p{
        width: 100%;
        height: 50px;
        margin: 0;
        box-sizing: border-box;
    }
    .thumbnail>p>img, .thumbnail>p>a{
        width: 66px;
        height: 100%;
        float: left;
        box-sizing: border-box;
    }
    .nickname{
        text-decoration: none;
        color: black;
        font-size: 16px;
        font-weight: bolder;
        line-height: 45px;
        text-align: center;
    }
    .report{
        text-decoration: none;
        color: darkgray;
        text-align: right;
        line-height: 40px;
    }


    /* 페이징바 */
    .paging-area{
        width: 100%;
    }
    .paging-area button{
        border:  0;
        background-color: transparent;
        height: 40px;
        width: 40px;
        border-radius: 5px;
        
    }
    </style>
</head>
<body>

	<!-- 메뉴바 -->
    <%@ include file="../../common/admin_menubar.jsp" %>
    
    <!-- 사이드바 (리뷰) -->
    <%@ include file="../../common/admin_petlogmainSidebar.jsp" %>

	 <!-- 큰 틀 -->
    <div class="outer">

        <!-- 현재 게시판이름 -->
        <div class="top">
            <br>
            <h2 style="color:gray">&gt; 관리자 Petlog</h2>
            <hr>
        </div>

        <!-- 중간 노란박스 -->
        <div class="middle">
            <div>새로 추가된 피드</div>
            <div>102</div>
        </div>

        <!-- 리스트 -->
        <div class="list-area">

            <!-- 썸네일 -->
            <div class="thumbnail">
                <div id="thumbnail">
                    <img src="" alt="">
                </div>    

                <p>
                    <img src="resources/img/petlog_logo.png" alt="">
                    <a href="" class="nickname">뽐뽀미</a>
                    <a href="" class="report">신고</a>
                </p>
            </div>

            <div class="thumbnail">
                <div id="thumbnail">
                    <img src="" alt="">
                </div>    

                <p>
                    <img src="resources/img/petlog_logo.png" alt="">
                    <a href="" class="nickname">뽐뽀미</a>
                    <a href="" class="report">신고</a>
                </p>
            </div>
            <div class="thumbnail">
                <div id="thumbnail">
                    <img src="" alt="">
                </div>    

                <p>
                    <img src="resources/img/petlog_logo.png" alt="">
                    <a href="" class="nickname">뽐뽀미</a>
                    <a href="" class="report">신고</a>
                </p>
            </div>

            <div class="thumbnail">
                <div id="thumbnail">
                    <img src="" alt="">
                </div>    

                <p>
                    <img src="resources/img/petlog_logo.png" alt="">
                    <a href="" class="nickname">뽐뽀미</a>
                    <a href="" class="report">신고</a>
                </p>
            </div>
            <div class="thumbnail">
                <div id="thumbnail">
                    <img src="" alt="">
                </div>    

                <p>
                    <img src="resources/img/petlog_logo.png" alt="">
                    <a href="" class="nickname">뽐뽀미</a>
                    <a href="" class="report">신고</a>
                </p>
            </div>
            <div class="thumbnail">
                <div id="thumbnail">
                    <img src="" alt="">
                </div>    

                <p>
                    <img src="resources/img/petlog_logo.png" alt="">
                    <a href="" class="nickname">뽐뽀미</a>
                    <a href="" class="report">신고</a>
                </p>
            </div>
            
            


            <!-- 페이징 바 / 중간 정렬 (안먹히네)-->
            <div class="paging-area" align="center">
                <button> &lt; </button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button> &gt; </button>
            </div>
        </div>

    </div>

    <!-- 페이징바 -->
    <script>
        $(function(){
        $(".paging-area button").click(function(){
            $(this).siblings(".paging-area button").css({background: "", color:"black"});
            $(this).css({background: "rgb(247, 198, 4)", color:"black"});
            })
        })
    </script>

</body>
</html>