<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>adminSoppingEnrollPd</title>
    <style>
        
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
        /* cont-wrap */
        .cont-wrap{
            margin-left: 350px;
        }
        .title-box h3{
            font-size: 24px;
            font-weight: bold;
            color: rgb(196, 195, 195);
        }
        .product-reg input{
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 4px;

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

        /* 버튼 박스 */
        .btn-box{
            text-align: right;
        }
        
        /* 표 */
        table {
            text-align: left;
        }
        table tbody td{
            display: flex;
            margin-bottom: 20px;
        }
        table tbody td input{
         margin-right: 20px;
        }
        #spPdUd{
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
        <%@ include file="../../common/admin_shoppingSidebar.jsp" %>
        
        <div class="container" style="max-width:1600px;">
            
            <!-- cont-wrap -->
            <div class="cont-wrap">
                <div class="title-box mt-5 pb-2">
                    <h3 class="mt-2">> 관리자 쇼핑몰</h3>
                </div>
                <div class="content product-reg">
                    <hr>
                    <p class="ct-tit pb-3">상품 수정</p>
                    <table>
                        <tbody>
                            <tr>
                                <th width="130px">*카테고리</th>
                                <td>
                                    <select class="selectpicker show-tick p-2">
                                        <option>1차</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                    <select class="selectpicker show-tick p-2">
                                        <option>1차</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">* 상품명</th>
                                <td>
                                    <input class="form-control" type="text" placeholder="상품명을 입력하세요.">
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">상품 옵션</th>
                                <td>
                                    <input class="form-control" type="text" placeholder="옵션1">
                                    <div class="btn-box">
                                        <button onclick="plus();" class="btn btn-sm material-icons">add</button>
                                        <button onclick="minus();" class="btn btn-sm material-icons">remove</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">* 판매가</th>
                                <td>
                                    <input class="form-control" type="text" placeholder="판매가를 입력해주세요">
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">한줄평</th>
                                <td>
                                    <input class="form-control" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">* 기본이미지</th>
                                <td>
                                    <input class="form-control" type="text" placeholder="상품이미지를 등록하세요.">
                                    <button class="btn btn-sm btn-primary">파일선택</button>
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">세부 이미지1</th>
                                <td>
                                    <input class="form-control" type="text">
                                    <button class="btn btn-sm btn-primary">파일선택</button>
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">세부 이미지2</th>
                                <td>
                                    <input class="form-control" type="text">
                                    <button class="btn btn-sm btn-primary">파일선택</button>
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">상품상세정보</th>
                                <td>
                                    <input class="form-control" type="text">
                                    <button class="btn btn-sm btn-primary">파일선택</button>
                                </td>
                            </tr>
                            <tr>
                                <th width="130px">* 수량</th>
                                <td>
                                    <input class="form-control" type="text" placeholder="수량을 입력해주세요">
                                </td>
                            </tr>
                        </tbody>    
                    </table>
                    <div style="width: 550px; text-align: center;">
                        <br><br>
                        <button class="btn btn-warning mr-3">확인</button>
                        <button class="btn btn-light">취소</button>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
    </body>
    </html>
   