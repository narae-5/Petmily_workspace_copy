<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pm.common.model.vo.PageInfo, java.util.ArrayList, com.pm.admin_Missing.model.vo.Missing, com.pm.admin_Login.model.vo.AdminMember" %>
<%
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<Missing> list = (ArrayList<Missing>)request.getAttribute("list");
 
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Missing List View</title>
<style>
    /* 전체 틀 */
    .outer{
        width:1000px;
        height:auto;
        margin:auto;
    }
    .outer>div{
        float:left;
    }
    /* 상단 회색바 */
    .top{
        width:1000px;
    }
    /* 3개 게시판별 조회 */
    .middle{
        width:1000px;
        height:120px;
    }
    .middle div{
        width:300px;
        float:left;
        text-align:center;
        line-height:35px;
        font-weight:900;
        font-size:15px;
        cursor:pointer;
    }
    .middle>div{
        margin:10px;
        background-color: rgb(247, 198, 4);
    }
    /* 버튼(삭제), 테이블, 페이징바 */
    .tablepaging{
        width:1000px;
        float:center;
        padding-top:20px;
    }
    .tablepaging table tr{
        text-align:center;
    }
    .adminselect{
        text-align:center;
    }
    /* 마우스로 선택한 줄 항목 */
    #missingtable>tbody>tr:hover{
    	background:rgb(220, 220, 220);
    	cursor:pointer;
    }
    /* 페이징바 */
    .paging-area button{
         border:  0;
         background-color: transparent;
         height: 40px;
         width: 40px;
         border-radius: 5px;
    }
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

	<!-- 메뉴바 -->
    <%@ include file="../../common/admin_menubar.jsp" %>
    
    <!-- 사이드바 -->
    <%@ include file="../../common/admin_boardsmainSidebar.jsp" %>

	<!-- 전체 틀 -->
    <div class="outer">

        <!-- 상단바 -->
        <div class="top">
            <br>
            	<h2 style="color:gray">&gt; 관리자 게시판 관리</h2>
            <hr>
            	<h5>찾고있어요</h5>
        </div>

        <!-- 게시판별 알림박스 -->
        <div class="middle">
            <div>
                <div>궁금해요</div>
                <div>157</div>
            </div>
            <div>
                <div>찾고있어요</div>
                <div>23</div>
            </div>
            <div>
                <div>중고거래</div>
                <div>102</div>
            </div>
        </div>

        <!-- 테이블, 검색창, 페이징바 -->
        <div class="tablepaging">

			
			<!-- 조회 테이블 -->
            <div class="table table-bordered">
                <table id ="missingtable">
                    <thead>
                        <tr>
                            <th width="100">글번호</th>
                            <th width="100">아이디</th>
                            <th width="150">동물 분류</th>
                            <th width="200">게시판 분류</th>
                            <th width="400">발견, 발생장소</th>
                            <th width="150">작성일</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    <% if(list.isEmpty()) { %>
                        <!--1. 게시글 없을 경우-->
                        <tr>
                            <td colspan="6">조회된 게시글이 없습니다</td>
                        </tr>
                    <% }else { %>
                        <!--2. 게시글 있을 경우-->
                    <% for (Missing m : list) { %>
                        <tr>
                            <td><%= m.getMissingNo() %></td>
                            <td><%= m.getMissingWriter() %></td>
                            <% 
                        	String category = "";
                        
                        	switch(Integer.parseInt(m.getCategory())) {
                        	case 1: category="강아지"; break;
                        	case 2: category="고양이"; break;
                        	case 3: category="기타"; break;
                        	}
                        	%>
                        	<td><%= category %></td>
                        	<% 
                        	String dcategory = "";
                        
                        	switch(Integer.parseInt(m.getdCategory())) {
                        	case 1: dcategory="찾고있어요"; break;
                        	case 2: dcategory="보호하고있어요"; break;
                        	}
                        	%>
                        	<td><%= dcategory %></td>
                            <td><%= m.getLocation() %></td>
                            <td><%= m.getEnrollDate() %></td>
                        </tr>
                      <% } %>
					<% } %>
                    </tbody>
                </table>
            </div>
            <br><br>

			<!-- 하단 검색창 -->
            <div class="adminselect">
                <select id="boardscategory">
                    <option value="ask">궁금해요</option>
                    <option value="missing">찾고있어요</option>
                    <option value="market">중고거래</option>
                </select>
                <input type="text">
                <button type="button" class="btn btn-light">검색</button>
            </div>
            
    		<!-- 글 클릭시 상세페이지 조회 -->
	    	<script>
	    	$(function(){
	    		$("#missingtable>tbody>tr").click(function(){
	    			location.href = '<%=contextPath%>/adminDetail.miss?num=' + $(this).children().eq(0).text();
	    		})
	    	})
	    	</script>
	    	
	    	<!-- 페이징 바 -->
		    <script>
		        $(function(){
		            $(".paging-area button").click(function(){
		                $(this).siblings(".paging-area button").css({background: "", color:"black"});
		                $(this).css({background: "rgb(247, 198, 4)", color:"black"});
		            })
		        })
		    </script>
		    
		    <br><br><br>

            <!-- 페이징 바 -->
            <div class="paging-area" align="center">
            <% if(currentPage != 1) { %>
                <button onclick="location.href='<%=contextPath%>/adminList.miss?cpage=<%=currentPage-1%>';"> &lt; </button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++) { %>
            	<% if(p== currentPage) { %>
                <button disabled><%= p %></button>
                <% }else { %>
                <button onclick="location.href='<%=contextPath%>/adminList.miss?cpage=<%= p %>';"><%= p %></button>
                <% } %>
			<% } %>
			
			<% if(currentPage != maxPage){ %>
            	<button onclick="location.href='<%=contextPath%>/adminList.miss?cpage=<%=currentPage+1%>';"> &gt; </button>
			<% } %>
		
            </div>
        </div>
    </div>


</body>
</html>