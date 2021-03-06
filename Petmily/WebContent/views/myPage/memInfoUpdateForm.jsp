<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>

    .outer {
        width: 1400px;
        margin: auto;   
    }
    

    .inner {
        width: 650px;
        margin: auto;
    }

    #title {
        font-weight: 900;
        font-size: 20px;
        height: 50px;
    }

    .memDelBtn {
        float: right;
        color: gray;
        text-decoration-line: underline;
    }

    .content { 
        margin-top: 80px;
    }

    .leftText {
        float: left;
        width: 160px;
        font-size: 20px;
        font-weight: bold;
        height: 40px;
        line-height: 40px;
    }

    input[type=text] {
        height: 40px;
        width: 325px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 10px;
    }

    input[type=password] {
        height: 40px;
        width: 325px;
        border: 1px solid lightgray;
        border-radius: 5px;
        padding: 10px;
    }

    select {
        width: 150px;
        height: 40px;
        font-size: 14px;
        border: 1px solid lightgray;
        border-radius: 5px;
    }

    .rightBtn {
        float: right;
        height: 40px;
        width: 140px;
        border: 1px solid lightgray !important;
        border-radius: 5px;
    }

    #updateForm>div {
        padding-bottom: 20px;
    }

    .star {
        color: orange;
    }

    .tip {
        margin-left: 0px;
        font-size: 12px;
    }

    #termsBox {
        margin-left: 160px;
        border-radius: 5px;
        border: 1px solid lightgray; 
        width: 325px;
        height: 180px;
    }

    .termsCheck {
        margin: 20px;
    }

    input[type=checkbox] {
        transform : scale(1.5);
    }

    .checkText {
        padding-left: 10px;
        font-size: 15px;
    }

    .smallSpan {
        font-size: 13px;
    }

    .updateButton {
        margin-left: 160px;
        margin-top: 40px;
        width: 325px;
        height: 50px;
        border-radius: 5px;
        border: none;
        font-size: 15px;
        font-weight: bold;
        color: white;
    }

    .notify {
        font-size: 13px;
        color: mediumseagreen;
        font-weight: bold;
    }

    .notifyRed {
        font-size: 13px;
        color: red;
        font-weight: bold;
    }

</style>
</head>

<body>
    <%@ include file="../common/menubar.jsp" %>
    
    
    
    <%
    	String postalCode = (loginUser.getPostalCode() == null) ? "" : loginUser.getPostalCode();
    	String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
    	String detailAddress = (loginUser.getDetailAddress() == null) ? "" : loginUser.getDetailAddress();
    %>
    
   
	<div class="outer">
        <%@ include file="../shop/mypage/mypageSidebar.jsp" %>
        

        <div class="inner">
            
            <div>
                <p id="title">???????????? ??????</p>
                <div style="border-bottom: 2px solid lightgray; margin: -30px 0px 5px;"></div>
                <a href="<%= contextPath %>/delForm.my" class="memDelBtn">????????????</a>
            </div>

            <div class="content">


                <form action="<%= contextPath %>/infoUpdate.my" id="updateForm" method="post" enctype="multipart/form-data">
                    
                    <input type="hidden" name="userNo" value="<%= loginUser.getMemNo() %>">
                    <div>
                        <div>
                            <label class="leftText" for="userEmail">?????????<span class="star">*</span></label>
                        </div>
                        

                        <div>
                            <input type="text" name="userEmail" placeholder="?????????" value="<%= loginUser.getMemEmail() %>" style="width: 325px;" readonly>

                        </div>
                        <span class="tip">???????????? ?????????????????? FAQ??? ???????????? ???????????????</span>

                    </div>

                    <div>
                        <div>
                            <label class="leftText" for="userPwd">????????????<span class="star">*</span></label>
                        </div>

                        <div>
                            <input type="password" id="userPwd" name="userPwd" placeholder="????????????" required>
                        </div>
                        <span class="tip">??????, ????????? ????????? 8??? ????????? ??????????????? ??????????????????</span>
                    </div>


                    <div>
                        <div>
                            <label class="leftText" for="userPwd2">???????????? ??????<span class="star">*</span></label>
                        </div>

                        <div>
                            <input type="password" id="userPwd2" name="userPwd2" placeholder="???????????? ??????" required>
                        </div>
                    </div>


                    <div>
                        <div>
                            <label class="leftText" for="userName">??????<span class="star">*</span></label>
                        </div>

                        <div>
                            <input type="text" id="userName" name="userName" placeholder="??????" value="<%= loginUser.getMemName() %>" required>
                        </div>
                        <span class="tip">??????, ??????????????? 2~15?????? ??????????????????</span>
                        <!-- ????????? ???????????? ?????? ??? ????????? ??? -->
                        <!-- <span class="notifyRed">????????? ??????????????????. ?????? ???????????? ??????????????????</span> -->
                    </div>


                    <div>
                        <div>
                            <label class="leftText" for="phone">????????????<span class="star">*</span></label>
                        </div>

                        <div>
                            <input type="text" id="phone" name="phone" maxlength='13' placeholder="????????????" value="<%= loginUser.getMemTel() %>" style="width: 325px">
                        </div>
                        <span class="tip">?????? ??? -(?????????)??? ????????? ??????????????????</span>
                    </div>

                
                    <div>
                        <div>
                            <label class="leftText" for="nickname">?????????<span class="star">*</span></label>
                        </div>

                        <div>
                            <input type="text" id="nickname" name="nickname" placeholder="?????????" value="<%= loginUser.getNickname() %>" required>
                            <button type="button" class="rightBtn btn-sm btn-light">?????? ??????</button>
                        </div>
                        <span class="tip">??????, ??????, ???????????? 2~15?????? ??????????????????</span>
                        
                    </div>


                    <div>
                        <div>
                            <label class="leftText" for="address3">??????</label>
                        </div>

                        <div>
                            <input type="text" id="address1" name="address1" placeholder="????????????" value="<%= postalCode %>">
                            <button type="button" onclick="postCode()" class="rightBtn btn-sm btn-light">???????????? ??????</button>
                        </div>

                        <div style="margin : 10px 160px">
                            <input type="text" id="address2" name="address2" placeholder="??????" value="<%= address %>">
                        </div>

                        <div style="margin : 10px 160px">
                            <input type="text" id="address3" name="address3" placeholder="????????????" value="<%= detailAddress %>">
                        </div>
                    </div>
                    
                    
                    <script>
	                    function postCode() {
	                		//daum.postcode.load(function(){
	                			new daum.Postcode({
	                				oncomplete: function(data) {
	                				
	                				var roadAddr = data.roadAddress;
	                	            var jibunAddr = data.jibunAddress;
	                	            
	                	            document.getElementById("address1").value = data.zonecode;
	                	            if(roadAddr !== ""){
	                	                document.getElementById("address2").value = roadAddr;
	                	            } 
	                	            else if(jibunAddr !== ""){
	                	                document.getElementById("address2").value = jibunAddr;
	                	            }
	                	            
	                	            document.getElementById("address3").focus();
	                	            
	                				}
	                			}).open();
	                		// });
	                	}
                    </script>
                    

                    <div>
                        <div>
                            <label class="leftText" for="imgFile">????????? ?????????</label>
                        </div>

                        <div>
                        	<% if(loginUser.getMemImg() != null){ %>
                            	<img id="imgFile" width="250" height="250" src="<%=contextPath%>/<%=loginUser.getMemImg()%>">
                            <% } else { %>
                            	<img id="imgFile" width="250" height="250">
                            <% } %>
                        </div>
                        
                        <div>
                            <label class="leftText"></label>
                        </div>
                        	<%-- - <% if(at != null) { %>
								<input type="hidden" name="originFileNo" value="<%= at.getAttachmentNo() %>">
							<% } %> --%>
                        	<input type="file" name="userFile" id="file" style="margin-top: 20px;" onchange="loadImg(this);">
                    </div>

                    <script>
                        function loadImg(inputFile) {
                            if(inputFile.files.length == 1) {
                                const reader = new FileReader();
                                reader.readAsDataURL(inputFile.files[0]);

                                reader.onload = function(e) {
                                    $("#imgFile").attr("src", e.target.result);
                                    // const img = document.getElementById("#imgFile");
                                    // img.setAttribute("src", e.target.result);
                                }
                            }
                        }
                    </script>
                        
                        
                    <button type="submit" class="updateButton btn-warning">???????????? ??????</button>
                        
                        
                </form>
                    

            </div>
            
        </div>
    
    <div style="margin-top: 200px;">

        <%@ include file="../common/footerbar.jsp" %>
    </div>
 </div>

</body>
</html>