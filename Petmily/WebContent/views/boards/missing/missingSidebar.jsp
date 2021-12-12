<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*사이드바 스타일*/
    .sidebar-area{
        float: left;
        width: 250px;
        height: 800px;
        position: relative;
    }
    /* 사이드바 큰 제목 스타일 */
    #boardName{
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
        width: 100px;
        display: none;
        margin-bottom: 3px;
        cursor: pointer;
        margin-left: 15px;
    }
</style>
<%@ include file="../../common/links.jsp" %>
</head>
<body>
      <!--  사이드바  -->
      <div class="sidebar-area">
        <ul>
            <div id="boardName">찾고있어요</div>
            <div id="d-category">
                <div class="d-category" id="dog">강아지</div>
                <div class="dd-category missing">찾고있어요</div>
                <div class="dd-category found">보호하고 있어요</div>

                <div class="d-category" id="cat">고양이</div>
                <div class="dd-category missing">찾고있어요</div>
                <div class="dd-category found">보호하고 있어요</div>

                <div class="d-category" id="etc">기타</div>
                <div class="dd-category missing">찾고있어요</div>
                <div class="dd-category found">보호하고 있어요</div>
            </div>
        </ul>
    </div>

    <script>
        $(function(){
            $(".d-category").click(function(){
                $(this).siblings(".d-category").css({background: "", color:"black"});
                $(this).css({background: "rgb(247, 198, 4)", color:"white"});
                const $missing = $(this).next();
    
                if($missing.css("display") == "none" && $missing.next().css("display") == "none"){
                    $(this).siblings(".missing").slideUp();
                    $(this).siblings(".found").slideUp();
                    
                    $missing.slideDown();
                    $missing.next().slideDown();
                }else{
                    $missing.slideUp();
                    $missing.next().slideUp();
                }
            })

            $(".dd-category").click(function(){
                $(this).siblings(".dd-category").css("color", "darkgray").css("text-decoration", "none");
                $(this).css("color", "orange").css("text-decoration", "underline");
            })
        })
    </script>
</body>
</html>