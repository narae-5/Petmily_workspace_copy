<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>adminSoppingPdUd</title>
    <style>
        /* cont-wrap */
        .cont-wrap{
            margin-left: 350px;
        }
        .title-box h3{
            font-size: 24px;
            font-weight: bold;
            color: rgb(196, 195, 195);
        }
        .ct-tit{
            font-size: 26px;
            font-weight: bold;
        }
        
        /* 셀렉트 박스 */
        .search-box{
            display: flex;
        }

        .selectpicker{
            width: 150px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        /* 검색 박스 */
        .search .form-control{
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search button{
            width: 50px;
            height: 50px;
            border: 1px solid #ddd;
            border-radius: 4px;
            line-height: 50px;
        }
        /* 버튼 박스 */
        .btn-box{
            display: flex;
            justify-content: flex-end;
        }
        /* 표 */
        table {
            text-align: center;
        }
        /* 페이징바 */
        .paging-area button{
            border:  0;
            background-color: transparent;
            height: 40px;
            width: 40px;
            border-radius: 5px;
        }
        /* 모달 팝업 */
        .modal .modal-footer{
            justify-content: center;
        }
        .modal .modal-header{
            border-bottom: 0;
        }
        .modal .modal-body{
            margin: 0 70px;
        }
        .modal-body .md-box{
            position: relative;
            margin-bottom: 25px;
        }
        .md-box p{
            font-size: 14px;
            color: #555;
            font-weight: 500;
            margin: 0;
        }
        .md-box input{
            font-size: 22px;
            padding: 5px 0;
            border:0;
            width: 230px;
        }
        .md-box .btn-box{
            position: absolute;
            bottom: 0;
            right: 0;
        }
        .md-box .btn-box button{
            background-color: #d4d4d4;
        }
        #memInfor{
            background: rgb(247, 198, 4);
            color: white;
        }
        /* 삭제모달창 */
        .modalMsg-area{
            font-weight: bolder;
            font-size: 17px;
            margin-top: 20px;
            height: 70px;
            text-align: center;
        }
        #deletebtn-area>*{
            color: white;
            font-weight: bolder;
            font-size: 15px;
            height: 35px;
            line-height: 5px;
            width: 70px;
            margin-top: -10px;
        }
        #confirm-btn{
            background-color: red;
            margin-right: 2px;
            line-height: 22px;
        }
        #closebtn{
            background-color: gray;
            margin-left: 2px;
        }
        #deleteCompletedclosebtn{
            background-color: orange;
            width: 100px;
            color: white;
            font-weight: bolder;
        }
        .modal-backdrop { opacity:0.3 !important; }

        /* 날짜 스타일*/
        #missing-date-area>p{
        float: left;
        text-align: left;
        margin-right: 30px;
        }
        /* 사이드바 색 고정 */
        #spDvlist{
            background: rgb(247, 198, 4);
            color: white;
        }



    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </head>
    <body>

        <%@ include file="../../common/admin_menubar.jsp" %>
        
        <div class="container" style="max-width:1600px;">
        <%@ include file="../../common/admin_shoppingSidebar.jsp" %>
            
            <!-- cont-wrap -->
            <div class="cont-wrap">
                <div class="title-box mt-1 pb-2">
                    <h3>> 관리자 쇼핑몰</h3>
                </div>
                <div class="content">
                    <hr>
                    <p class="ct-tit pb-3">주문/배송 조회</p>
                    
                    <!-- 회원 조회 -->
                    <div class="search-box pb-5">
                        <select class="selectpicker show-tick p-2">
                            <option>주문 번호</option>
                            <option>배송 중</option>
                            <option>배송 전</option>
                            <option>배송 완료</option>
                        </select>
                        <div class="search">
                            <form class="form-inline" action=" ">
                              <input class="form-control p-4" type="text" placeholder="내용을 입력해주세요." style="width: 350px;">
                              <button class="btn" type="submit">
                                <span class="material-icons">search</span>                                    
                              </button>
                            </form>
                        </div>
                    </div>
                    <div id="missing-date-area">
                        <div style="width: 160px;" class="d-flex">
                           <input class="form-control mr-2" type="date"> ~ <input class="form-control mr-2" type="date">
                        </div>
                     </div>
                     <br><br><br><br>
                    <!-- table -->
                    <div class="table">
                        
                        
                        <table style="width: 100%;" class="table table-striped">
                            <thead>
                                <tr>
                                    <th width="50px">No.</th>
                                    <th width="200px">주문번호</th>
                                    <th width="200px">고객명</th>
                                    <th width="200px">배송상태</th>
                                    <th width="350px">배송주소</th>
                                    <th width="170px">주문일자</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--1. 게시글 없을 경우-->
                                <tr style="display:none">
                                    <td colspan="6">조회된 게시글이 없습니다</td>
                                </tr>
                                <!--2. 게시글 있을 경우-->
                                <tr>
                                    <td>1</td>
                                    <td>135</td>
                                    <td>김혜선</td>
                                    <td>배송중</td>
                                    <td>서울시동작구사당동</td>
                                    <td>21.12.26</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>90</td>
                                    <td>이동물</td>
                                    <td>배송전</td>
                                    <td>인천시 연수구</td>
                                    <td>21.12.26</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>89</td>
                                    <td>짱보미</td>
                                    <td>배송중</td>
                                    <td>서울시 서초구 방배동</td>
                                    <td>21.12.26</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>70</td>
                                    <td>김사랑</td>
                                    <td>배송중</td>
                                    <td>서울시 용산구</td>
                                    <td>21.12.25</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>65</td>
                                    <td>실험3</td>
                                    <td>배송전</td>
                                    <td>서울시 강남구 청담동</td>
                                    <td>21.12.25</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>62</td>
                                    <td>실험2</td>
                                    <td>배송중</td>
                                    <td>서울시동작구사당동</td>
                                    <td>21.12.25</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>60</td>
                                    <td>실험4</td>
                                    <td>배송중</td>
                                    <td>경기도 의정부시</td>
                                    <td>21.12.24</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>59</td>
                                    <td>실험3</td>
                                    <td>배송중</td>
                                    <td>경기도부천시</td>
                                    <td>21.12.24</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>57</td>
                                    <td>김민지</td>
                                    <td>배송전</td>
                                    <td>경기도 의정부시</td>
                                    <td>21.12.23</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>55</td>
                                    <td>김가연</td>
                                    <td>배송중</td>
                                    <td>경기도 의정부시</td>
                                    <td>21.12.23</td>
                                </tr>
                            </tbody>
                        </table>
                        <br><br><br><br><br>
                        <!-- 페이징 바 -->
                        <div class="paging-area" align="center">
                            <button> &lt; </button>
                            <button>1</button>
                            <button>2</button>
                            <button>3</button>
                            <button>4</button>
                            <button>5</button>
                            <button> &gt; </button>
                        </div>
                        <script>
                            $(function(){
                                $(".paging-area button").click(function(){
                                    $(this).siblings(".paging-area button").css({background: "", color:"black"});
                                    $(this).css({background: "rgb(247, 198, 4)", color:"black"});
                                })
                            })
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
    </body>
    </html>
   