<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.pm.shop.model.vo.Like" %>
 <%
 	ArrayList<Like> list = (ArrayList<Like>)request.getAttribute("list");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 		div, img, li, a{
		     box-sizing: border-box;
		}
		.oouter{
			width: 1700px;
			height: 1000px;
			margin:auto;
		}     
		.content-area{
			width: 1700px;
			height: 1000px;
			padding:200px;
			padding-top:0px;
			margin:auto;
		}
		
         #outer{
            width:1000px;
            height:600px;
            border: 1px soild black;
            background-color: rgb(235, 235, 235);
            padding: 0px 20px;
            text-align: center;
            margin:auto !important;
        }
        .like-content{
            text-align: center;
            margin:50px 30px;
            font-size: 18px;
        }
        .inline-block{display:inline-block;}
        
        #nullcase{
	       	font-size:20px;
	       	padding-top:50px;
        }
    </style>
</head>
<body>
<%@ include file="../../common/menubar.jsp" %>

<div class="oouter">

<%@ include file="mypageSidebar.jsp" %>

<div class="content-area">

    <img src="resources/img/nullheart.png" width="60px" height="60px" alt="" style="margin-left:150px; margin-bottom:20px;">
    
    <div id="outer">
    
	<input type="hidden" name="memNo" value="<%= loginUser.getMemNo() %>">
	
    <% int a = 0; %>
    <% if(list.isEmpty()) { %>
    	<div align="center" id="nullcase">찜한 상품이 없습니다.</div>
    <% } else { %>
		<% for(Like like : list) { %>
			
	        <div class="inline-block like-content" align="center">
	            <img src="<%= contextPath %>/<%=like.getBasicImg() %>"  id="content-img" width="100px" height="100px" > 
	            <br>
	            	<%= like.getProductName() %>
	            <br>
	            	<%= like.getPrice() %>원
	            <br>
	            <button style="border:none;">
	            <input type="hidden" value="<%= like.getProductNo() %>">
	            <img src="resources/img/likeheart.png" alt="" width="40px" height="40px">
	            </button>
	            
	        </div>

		<!-- 한줄에 5개씩 보여지도록 어떻게 하지 -->
	        <% a++;
	        if(a % 5 ==0) { 
	        	System.out.println();	        
   			}%>
        

		<% } %>
	<% } %>

            
        </div>

    </div>
 </div>
</div> 
<script>
// ajax로 like delete
$(function(){
	
	$("button").click(function(){
		
		var num = $(this).children("input").val(); 
		var $divEl = $(this).parent();
		//속성을 꺼내는 attr함수, 클릭할 때마다 기본키를 받을 수 있도록 
		//console.log(pno);
		console.log(num);
		                
		$.ajax({
			url:"deleteLike.my", //문제
			data:{
				pno:num	
			},
			type:"post",
			success:function(result){
				if(result>0){
					$divEl.remove();
					//$(this).parent().remove();
					//$("#like-content").remove();
				}
			},
			error:function(result){
				console.log("찜 삭제용 ajax 실패")
			}
			
			
		})
		
		
	})
})
/*
function deleteLike(pno){
	
	
}*/
</script>
<%@ include file="../../common/footerbar.jsp" %> 
</body>
</html>