<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pm.common.model.vo.PageInfo, java.util.ArrayList, com.pm.admin_Shopping.model.vo.AdminShopping" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<AdminShopping> aslist = (ArrayList<AdminShopping>)request.getAttribute("aslist");
	AdminShopping as = (AdminShopping)request.getAttribute("as");
	
	System.out.println(pi);
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>adminSoppingPdUd</title>
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
        
        #spPdUd{
            background: rgb(247, 198, 4);
            color: white;
        }



    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>\
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>

        <%@ include file="../../common/admin_menubar.jsp" %>
        <script>
        	console.log(<%= as %>);
        </script>
        <div class="container" style="max-width:1600px;">
            <%@ include file="../../common/admin_shoppingSidebar.jsp" %>
            
            <!-- cont-wrap -->
            <div class="cont-wrap">
                <div class="title-box mt-1 pb-2">
                    <h3>> 관리자 쇼핑몰</h3>
                </div>
                <div class="content">
                    <hr>
                    <p class="ct-tit pb-3">상품관리 (수정,삭제)</p>
                    <!-- 회원 조회 -->
                    <div class="search-box pb-5">
                        <select class="selectpicker show-tick p-2">
                            <option>상품명</option>
                            <option>상품 코드</option>
                            <option>업체명</option>
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

                    <!-- table -->
                    <div class="table">
                        <div align="left">
                            <select name="orderBy" id="orderBy">
                               <option value="date">수량순</option>
                               <option value="count">가격순</option>
                               <option value="reply">번호순</option>
                            </select>
                         </div>
                         
                        <div class="btn-box">
                            <!-- <p style="margin-right: 25%; background: rgb(247, 198, 4); margin-top: 33px; font-weight: bold; font-size: 18px;">상품코드:A-전체/C-고양이/D-강아지/M-기타</p>-->
                            <!-- btn-box -->
                            <div class="pb-5">
                                <button onclick="location.href='<%= contextPath %>/spPdUd2.ad?pno='+pno2;" class="btn btn-sm btn-warning mr-2" id="updateBtn" data-toggle="modal" data-target="#myModal">수정</button>
                            </div>
                            
                            <div class="pb-5">
                                <button onclick="location.href='<%= contextPath %>/spDelete.ad?pno='+pno2;" id="deleteBtn" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal">삭제</button>
                            </div>
                            <!-- 삭제모달 -->
                            <div class="modal fade" id="deleteModal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content" style="width: 400px;">
                        
                                        <!-- Modal body -->
                                        <div class="modal-body" align="center">
                                            <div class="modalMsg-area">
                                                                	정말 삭제하시겠습니까?
                                            </div>
                                            <div id="deletebtn-area">
                                              <a type="button" class="btn" id="confirm-btn" data-dismiss="modal" data-toggle="modal" href="#deleteCompleted">확인</a>
                                              <button type="button" class="btn" data-dismiss="modal" id="closebtn">닫기</button>
                                            </div>              
                                        </div>
                                
                                    </div>
                                </div>
                            </div>
                            <!-- 게시글 삭제완료 Modal -->
                            <div class="modal fade" id="deleteCompleted">
                                <div class="modal-dialog modal-sm modal-dialog-centered">
                                    <div class="modal-content">

                                        <!-- Modal body -->
                                        <div class="modal-body" align="center" style="text-align: center;">
                                            <div class="modalMsg-area">
                                                	정상적으로 삭제되었습니다.
                                            </div>
                                            <div>
                                            <button type="button" class="btn" data-dismiss="modal" id="deleteCompletedclosebtn">닫기</button>
                                            </div>              
                                        </div>
                                
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <table style="width: 100%;" class="table table-striped">
                            <thead>
                                <tr>
                                    <th width="30px"><input type="checkbox" name="allCheck" id="allCheck" value=""></th>
                                    <th width="50px">No.</th>
                                    <th width="150px">상품 코드</th>
                                    <th width="150px">카테고리</th>
                                    <th width="450px">상품명</th>
                                    <th width="200px">가격</th>
                                    <th width="100px">수량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--1. 게시글 없을 경우-->
                            	<% if(aslist.isEmpty()) { %>
                                <tr style="display:none">
                                    <td colspan="6">조회된 게시글이 없습니다</td>
                                </tr>
                                <!--2. 게시글 있을 경우-->
                                <% }else { %>
                                <% for(int i=0; i<aslist.size(); i++) {%>
                                <tr>
                                    <td><input type="checkbox" name="selectCheck" id="selectCheck" value=""></td>
                                    <td><%= i+1 %></td>
                                    <td id="pno"><%= aslist.get(i).getProductNo() %></td>
                                    <td><%= aslist.get(i).getCategory() %></td>
                                    <td><%= aslist.get(i).getProductName() %></td>
                                    <td><%= aslist.get(i).getPrice() %></td>
                                    <td><%= aslist.get(i).getAmount() %></td>
                                </tr>
                               <% } %>
							<% } %>
                            </tbody>
                        </table>
                        <script>
                            $(function(){
                                $('input:checkbox[name="selectCheck"]').click(function(){
                                    if($('input:checkbox[name="selectCheck"]').is(':checked')){
                                        console.log("확인");
                                        clickEvent(event);
                                    }else{
                                        console.log("체크해제확인");
                                    }
                                })
                            });

                            function clickEvent(event) {
                                console.log('target ::', $(event.target));

                                var row = $(event.target).closest('tr');

                                var columns = row.find('#pno');

                                console.log('row::', row);
                                console.log('columns::', columns);

                                var values = "";

                                //var value = $('columns').val();
                                $.each(columns, function(idx, item){
                                   pno2 = item.innerHTML;
                                 //let link = "/PM/adSpUdfin.ad?pno="+pno2;
                                });
                                console.log(pno2);
                              //$("#update-form").attr("action", link);
                            }

                        </script>
                         <!--<script>
                            $('#deleteBtn').click(function(){
                                if($("input:checkbox[name='selectCheck']:checked").length === 0){
                                    alert("수정할 버튼을 선택하세요.");
                                    return;
                                }
                                $("input:checkbox[name='selectCheck']:checked").each(function(k,kVal){
                                    
                            });
                        </script>
                        <script>
                            $(function(){
                                $("input:checkbox[name='selectCheck']:checked").click(function(){
                                    alert("버튼한개클릭");
                                })
                            })
                        </script> -->
                        <br><br><br><br><br>
                        <!-- 페이징 바 -->
                        <div class="paging-area" align="center">
                            <% if(currentPage != 1) {%>
                            <button onclick="location.href='<%=contextPath%>/spPdUd.ad?cpage=<%=currentPage-1%>';"> &lt; </button>
                            <% } %>
                            
                        <% for(int p=startPage; p<=endPage; p++) {%>
			            	<% if(p == currentPage) { %>
			            	<button disabled><%= p %></button>
			            	<% }else { %>
								<button onclick="location.href='<%= contextPath %>/spPdUd.ad?cpage=<%= p %>';"><%= p %></button>
			            	<% } %>
			            <% } %>
			            
			            <% if(currentPage != maxPage) {%>
			            	<button onclick="location.href='<%=contextPath%>/spPdUd.ad?cpage=<%=currentPage+1%>';">&gt; </button>
						<% } %>
			
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
   