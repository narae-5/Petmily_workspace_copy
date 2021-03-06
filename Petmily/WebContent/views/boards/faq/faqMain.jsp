<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>

    .outer {
        width: 1400px;
        margin: auto;
    }

    .inner {
        width: 800px;
        height: auto;
        margin: auto;
    }

    .inner > div {
        width: 85%;
    }

    .faq {
        margin: auto;
        width: 80%;

    }

    #title {
        font-weight: 900;
        font-size: 45px;
        height: 100px;
        margin-top: -15px;
        float: left;
    }

    #title_sm {
        position: relative;
        left: 15px;
        top: 15px;
        font-weight: bold;
        font-size: 18px;
    }

    .search-back {
        background-color: rgb(235, 235, 235);
        width: 670px;
        height: 120px;
        margin: auto;
        margin-top: 60px;
    }

    .search-in {
        position: relative;
        left: 10px;
        top: 30px;
    }

    #searchBox {
        width: 400px;
        height: 35px;
        border-radius: 5px;
        border: 1px solid lightgray;
    }

    button {
        width: 80px;
        margin-bottom: 5px;
    }


    #keyword-title {
        float: left;
        font-weight: bold;
        margin: 10px 5px 0px 90px;
        font-size: 15px;
    }

    .keyword-tag {
        float: left;
        margin: 10px 10px;
        background-color: white;
        border-radius: 10px;
        padding: 0 10px;
        color: orange;
        font-weight: bold;
        text-decoration-line: none !important;
    }

    .keyword-tag:hover {
        color: tomato;
    }

    .menuform {
        float: left;
        width: 220px;
        margin-top: 60px;
    }

    .vertical-line {
        float: left;
        border-left: 1px solid lightgray;
        height: 200px;
        margin-top: 60px;

    }

    .iconimg {
        width: 50px;
        height: 50px;
        margin-left: 90px;
        margin-bottom: 30px;
    }

    .menulist {
        font-size: 20px;
        margin-left: 30px;
        margin-bottom: 60px;
    }

    .menulist>ul>li>a {
        text-decoration-line: none !important;
        font-size: 15px;
        color: black;
    }

    .tableCategory {
        font-size: 20px;
        font-weight: bold;
        padding-left: 10px;
        
    }

    .tdTitle {
        width: 200px;
        text-align: center;
        font-size: 15px;
        cursor: pointer;
    }

    .tdContent { 
        text-align: center;
        font-size: 15px;
        cursor: pointer;
    }


</style>
</head>
<body>
    <%@ include file="../../common/menubar.jsp" %>
    
    <div class="outer">
        <%@ include file="../notice/noticeSidebar.jsp" %>
        
        
        <div class="inner">
            
            <div class="faq">

                <div>
                    <p id="title">FAQ</p>
                    <span id="title_sm">?????? ?????? ??????</span>
                </div>
                
                <div>

                    <div class="search-back">

                        <div class="search-in"> 

                            <div class="search">
                                <input type="text" id="searchBox" name="search">
                                <button type="button" class="btn btn-sm btn-warning">??????</button>
                            </div>
                            <div class="keyword-area">
                                <p id="keyword-title">?????? ?????????</p>

                                <a href="" class="keyword-tag">#????????????</a>
                                <a href="" class="keyword-tag">#?????????</a>
                                <a href="" class="keyword-tag">#?????????</a>
                                <a href="" class="keyword-tag">#??????</a>
                            </div>

                        </div>
                    </div>
                    
                </div>


                <div class="menuform">
                    
                    <div>
                        <img src="resources/img/member-card.png" class="iconimg">
                    </div>

                    <div class="menulist">
                        <ul>
                            <li><a href="">????????????</a></li>
                            <li><a href="">???????????? ?????????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">?????? ??? ?????????</a></li>
                        </ul>
                    </div>

                </div>

                <div class="vertical-line"></div>

                <div class="menuform">
                    
                    <div>
                        <img src="resources/img/coin.png" class="iconimg">
                    </div>

                    <div class="menulist">
                        <ul>
                            <li><a href="">?????? ?????? / ??????</a></li>
                            <li><a href="">????????? ?????? ??????</a></li>
                            <li><a href="">?????? / ??????</a></li>
                            <li><a href="">?????????</a></li>
                        </ul>
                    </div>

                </div>

                <div class="vertical-line"></div>

                <div class="menuform">
                    
                    <div>
                        <img src="resources/img/photo.png" class="iconimg">
                    </div>

                    <div class="menulist">
                        <ul>
                            <li><a href="">????????? ??????</a></li>
                            <li><a href="">?????? / ??????</a></li>
                            <li><a href="">????????????</a></li>
                            <li><a href="">??????</a></li>
                        </ul>
                    </div>

                </div>

                
                <p class="tableCategory" style="width: 200px;">??????</p>
                

                <table class="table table-hover">
                    <tr>
                        <td class="tdTitle">????????????</td>
                        <td class="tdContent">??????????????? ????????? ??????????</td>
                    </tr>

                    <tr>
                        <td class="tdTitle">????????????</td>
                        <td class="tdContent">?????? ?????? '?????? ????????? ??????????????????'?????? ???????????? ?????????.</td>
                    </tr>

                    <tr>
                        <td class="tdTitle">???????????? ?????????</td>
                        <td class="tdContent">??????????????? ???????????? ????????????</td>
                    </tr>

                    <tr>
                        <td class="tdTitle">?????????</td>
                        <td class="tdContent">???????????? ?????????????????????</td>
                    </tr>

                    <tr>
                        <td class="tdTitle">????????? ??????</td>
                        <td class="tdContent">????????? ????????? ??????????????? ???????????? ????????? ????????????????</td>
                    </tr>

                    <tr>
                        <td class="tdTitle">?????? / ??????</td>
                        <td class="tdContent">??????/?????? ?????? ????????? ??????????</td>
                    </tr>

                    <tr>
                        <td class="tdTitle">????????? ?????? ??????</td>
                        <td class="tdContent">???????????? ???????????? ????????????</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <script>
            $(function(){
               $("tr").click(function(){
                  //const num = $(this).children().eq(0).text();
                  
                  // /jsp/detail.faq?num=??????????????????
                  location.href = '<%=contextPath%>/detail.faq'
               })
            })
         </script>

        <%@ include file="../bCommon/boardPagingBar.jsp" %>
    </div>
    
    <div style="margin-top: 200px;">
        <%@ include file="../../common/footerbar.jsp" %>
    </div>
    
</body>
</html>