<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pm.common.model.vo.PageInfo, java.util.ArrayList, com.pm.boards.qna.model.vo.Qna" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

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
        width: 1600px;
        margin: auto;
    }

	.inner {
        width: 1300px;
        height: auto;
        margin: auto;
    }

    .inner > div {
        width: 85%;
    }

    .qna {
        margin: auto;
        width: 80%;

    }

    #title {
        font-weight: 900;
        font-size: 45px;
        height: 50px;
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

    #enrollBtn {
        float: right;
        margin-top: 20px;
    }

    .titleBottom {
        margin: 10px;
        margin-bottom: 100px;
        
    }

    #notify {
        float: left;
        margin: 5px;
        
    }

    #search { 
        float: right;
        border: 1px solid lightgray;
        border-radius: 5px;
        height: 40px;
        width: 300px;
        margin-top: 7px;
        padding: 10px;
    }

    #searchImg {
        float: right;
        width: 40px;
        height: 40px;
        margin: 7px;
        cursor: pointer;
    }

    table {
        text-align: center;
    }

    thead {
        background-color: rgb(235, 235, 235);   
    }

    tbody {
        cursor: pointer;
    }
    
    .paging-area {
		margin:auto;
		text-align:center;
		margin-top:30px;
	}

	.paging-area button {
		border:  0;
		background-color: transparent;
		height: 40px;
		width: 40px;
		border-radius: 5px;
	}

</style>
</head>

<body>
	<%@ include file="../../common/menubar.jsp" %>
    
    <div class="outer">
        <%@ include file="../notice/noticeSidebar.jsp" %>
        
        
        <div class="inner">
            
            <div class="qna">

                <div>
                    <p id="title">QnA</p>
                    <span id="title_sm">1:1</span>
                    <% if(loginUser != null) { %>
	                    <button type="button" id="enrollBtn" class="btn btn-sm btn-warning"
	                            onclick="location.href='<%= contextPath %>/enrollForm.qna'">?????????</button>
                    <% } %>
                </div>
                
                <div style="border-bottom: 2px solid lightgray; margin-top: 30px;"></div>
                
                <div class="titleBottom">
                   <p id="notify">???????????? ????????? ?????? FAQ??? ????????? ??????????????? ???????????? ??? ??? ?????? ????????? ????????? ??? ????????????. <br>
                    			    ???????????? ?????? ???????????? ????????? ????????? ??????????????? ????????? ???????????? ????????? ????????????????????????.</p>
                    <img src="resources/img/searchImg.png" id="searchImg">
                    <input type="text" id="search" placeholder="???????????? ??????????????????">
                </div>


                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>??????</th>
                            <th>?????????</th>
                            <th>?????????</th>
                            <th>??????</th>
                        </tr>
    
                    </thead>
    
                    <tbody>
                    
    					<!-- ???????????? ?????? ?????? -->
    					<% if(list.isEmpty()) { %>
	    					<tr>
	    						<td colspan="5">????????? ???????????? ????????????</td>
	    					</tr>
	    				<% } else { %>
    						<% for(Qna q : list) { %>
		                        <tr>
		                            <td class="tdNo"><%= q.getQnaNo() %></td>
		                            <td class="tdTitle"><%= q.getQnaTitle() %> <span class="tdreply">(1)</span></td>
		                            <td class="tdWriter"><%= q.getMemNo() %></td>
		                            <td class="tdDate"><%= q.getQnaDate() %></td>
		                            <td class="tdCount"><%= q.getCount() %></td>
		                        </tr>
		                    <% } %>
	                    <% } %>
    
    
                    </tbody>
                </table>

                <div class="paging-area" align="center">
					<% if(currentPage != 1) { %> <!-- 1??? ????????? ?????? ?????? ??????????????? ???????????? -->
		            	<button onclick="location.href='<%= contextPath %>/main.qna?cpage=<%=currentPage-1%>';"> &lt; </button>
					<% } %> <!-- 1??? ???????????? ?????? ??????????????? ??????  -->
		
					<% for(int p=startPage; p<=endPage; p++) { %>            
		            	<% if(p == currentPage) { %> <!-- ???????????? ?????? ?????? ?????? ??????????????? -->
		            		<button disabled><%= p %></button> <!-- ?????? ????????? ???????????? -->
		            	<% } else { %>
		            		<!-- ?????? ?????? ??? ????????? ?????? -->
		            		<button onclick="location.href='<%= contextPath %>/main.qna?cpage=<%= p %>';"><%= p %></button>
		            	<% } %>
		            <% } %>
		            
		            <% if(currentPage != maxPage) { %> <!-- ????????? ????????? ?????? ?????? ?????? ??????????????? ???????????? -->
		            	<button onclick="location.href='<%= contextPath %>/main.qna?cpage=<%= currentPage+1 %>';"> &gt; </button>
					<% } %> <!-- ????????? ???????????? ?????? ??????????????? ?????? -->
		        </div>
		        
            </div>
            
            <script>
	            $(function(){
	                $("table>tbody>tr").click(function(){
	                location.href= '<%= contextPath %>/detail.qna?qno=' + $(this).children().eq(0).text();
	                })
	            })
	        </script>

    
            <div style="margin-top: 200px;">
                <%@ include file="../../common/footerbar.jsp" %>
            </div>

       </div>
   </div>
</body>
</html>