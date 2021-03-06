<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.pm.boards.ask.model.vo.Ask, com.pm.boards.market.model.vo.Market, com.pm.boards.missing.model.vo.Missing, com.pm.petLog.model.vo.PetLog, com.pm.petLog.model.vo.PetsRoom" %>
<%
	PetsRoom pr = (PetsRoom)request.getAttribute("pr");
	ArrayList<PetLog> mPetLogList = (ArrayList<PetLog>)request.getAttribute("mPetLogList");
	ArrayList<Ask> mAskList = (ArrayList<Ask>)request.getAttribute("mAskList");
	ArrayList<Market> mMarketList = (ArrayList<Market>)request.getAttribute("mMarketList");
	ArrayList<Missing> mMissingList = (ArrayList<Missing>)request.getAttribute("mMissingList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/common/mainPage.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>

    <div class="outer">


        <div class="content-area" align="center">

            <% if(loginUser == null) { %>
	            <div id="petlog">
	                <div class="smallTitle">PETLOG</div>
	                <div id="content1">
	                    <div id="profile">
	                        <div id="profileimg">
	                            <img src="resources/img/dog.png">
	                        </div>
	                        <br>
	                        <div id="login-user">?????????????????????</div>
	
	                    </div>
             <% } else{ %>
	            <div id="petlog">
	                <div class="smallTitle">PETLOG</div>
	                <div id="content1">
	                    <div id="profile">
	                        <div id="profileimg">
	                            <img src="<%=contextPath%>/<%=pr.getpProfileImg()%>">
	                        </div>
	                        <br>
	                        <div id="login-user"><%=pr.getRoomName() %></div>
	
	                    </div>          
              <% } %>      
                    
                    
                    <div id="petlogSummary">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                            <% for(PetLog pl : mPetLogList) { %>
                                <div class="swiper-slide"><img src="<%=contextPath%>/<%= pl.getTitleImg()%>"></div>
                            <% } %>
                            </div>
                        
                            <!-- ??????????????? -->
                            <div class="button-next"><img src="resources/img/right_arrow.png" style="color:pink;"></div><!-- ?????? ?????? (???????????? ?????? ??????) -->
                            <div class="button-prev"><img src="resources/img/left_arrow.png"></div><!-- ?????? ?????? -->

                            <!-- ????????? -->
                            <div class="swiper-pagination"></div>
                        </div>

                    </div>
                </div>



            <div id="store">
                <div class="smallTitle">?????????</div>
                <div>
                    <div class="storecontent">
                        <div class="storecontentimg">
                            <img src="resources/img/store/dog1.png">
                        </div>
                        <br><br> ?????????
                    </div>
                    <div class="storecontent">
                        <div class="storecontentimg">
                            <img src="resources/img/store/cat.png">
                        </div>
                        <br><br> ?????????
                    </div>
                    <div class="storecontent">
                        <div class="storecontentimg">
                            <img src="resources/img/store/hamster.png">
                        </div>
                        <br><br> ?????????
                    </div>
                    <div class="storecontent">
                        <div class="storecontentimg">
                            <img src="resources/img/store/fish.png">
                        </div>
                        <br><br> ?????????
                    </div>
                    <div class="storecontent">
                        <div class="storecontentimg">
                            <img src="resources/img/store/bird2.png">
                        </div>
                        <br><br> ???
                    </div>
                    <div class="storecontent">
                        <div class="storecontentimg">
                            <img src="resources/img/store/go.png">
                        </div>
                        <br><br> ????????????
                    </div>
                </div>
            </div>



            <div id="board">
                <div id="ask">
                    <div class="smallTitle">???????????? </div>
                    
                    <% for(Ask a : mAskList) { %>
                    <div class="ask-contents">
                    	<input type="hidden" value="<%=a.getAskNo() %>">
                    	<% if(a.getTitleImg() == null) { %>
                        	<div class="ask-photo"><img src="resources/img/default-img.png"></div>
                        <% }else{ %>
                        	<div class="ask-photo"><img src="<%=contextPath %>/<%=a.getTitleImg()%>"></div>
                        <% } %>    
                        <div class="ask-texts">
                            <div class="ask-title"><%=a.getAskTitle() %></div>
                            
                            <div class="ask-text" align="left"><%=a.getAskContent() %></div>
  
                        </div>
                     </div>
					<% } %>
                </div>
                <script>
			         $(function(){
			            $(".ask-contents").click(function(){
			               const num = $(this).children("input").val();

			               location.href = '<%=contextPath%>/detail.ask?ano=' + num;
			            })
			         })
			    </script>


                <div id="market">
                    <div class="smallTitle">????????????</div>
                        <div id="market-content-area">
	                    <% for(Market m : mMarketList) { %>
	                            <div class="market-content-box-area">
	                            <input type="hidden" value="<%=m.getMarketNo() %>">
	                            <% if(m.getdCategory().equals("2")) { %>
	                                <span class="badge badge-pill sell-icon">?????????</span>
	                            <% }else { %>
	                                <span class="badge badge-pill buy-icon">?????????</span>
	                            <% } %>
	                            
	                            <% if(m.getTitleImg() == null) { %>
	                                <div class="photo-box"><img src="resources/img/default-img.png"></div>
	                            <% }else{ %>
	                            	<div class="photo-box"><img src="<%=contextPath%>/<%=m.getTitleImg()%>"></div>
	                            <% } %>
	                                <div class="content-title" align="left"><%=m.getMarketTitle() %></div>
	                            <% if(m.getdCategory().equals("2")) { %>
	                                <div class="sell-price" align="right"><%=m.getPrice() %>???</div>
	                            <% }else { %>
	                            	 <div class="buy-price" align="right"><%=m.getPrice() %>???</div>
	                            <% } %>
	                            </div>
	                    <% } %>
                        </div>

                </div>
                <script>
			         $(function(){
			            $(".market-content-box-area").click(function(){
			               const num = $(this).children("input").val();
			               
			               location.href = '<%=contextPath%>/detail.market?mno=' + num;
			            })
			         })
			    </script>
			    
			    
                <div id="missing">
                    <div class="smallTitle">???????????????</div>
                    
                    <div id="missing-content-area">
                    <%for (Missing mi : mMissingList) { %>
                        <div class="missing-content-box-area">
                        <input type="hidden" value="<%=mi.getMissingNo() %>">
                           <div style="border:1px solid darkgray;" class="missing-img">
                              <img src="<%= contextPath %>/<%=mi.getTitleImg() %>" alt="">
                           </div>
                           <div class="missing-content-info-area" align="left">
                           <% if(mi.getdCategory() == 2) { %>
                              <div class="found-title">?????????????????????</div>
                           <% }else { %>
                               <div class="missing-title">???????????????</div>
                           <% } %>
                              <div class="gender-age"><%=mi.getpName() == null ? "" : mi.getpName()%> | <%=mi.getpGender().equals("F") ? "??????" : "??????"%> | ????????????: ??? <%=mi.getpAgeFrom()%>???</div>
                              <div class="dpf-area">
                                 <div>???????????? : <%=mi.getMissingDate() %></div>
                                 <div>???????????? : <%=mi.getLocation() %></div>
                                 <div>???????????? : <%=mi.getFeature() == null ? "" : mi.getFeature()%></div>
                              </div>
                           </div>
                        </div>
                     <% } %>
                </div>
            </div>
			<script>
			         $(function(){
			            $(".missing-content-box-area").click(function(){
			               const num = $(this).children("input").val();
			               
			               location.href = '<%=contextPath%>/detail.missing?miNo=' + num;
			            })
			         })
			</script>





        </div>
        
        
    </div>
</div>
        
         <%@ include file="views/common/footerbar.jsp" %>  <!--????????? ?????? ????????? ???????????????--> 
</div>
   


    <script>
        new Swiper('.swiper-container', {

            slidesPerView : 4, // ????????? ????????? ???????????? ??????
            spaceBetween : 20, // ??????????????? ??????
            slidesPerGroup : 4, // ???????????? ?????? ???, slidesPerView ??? ?????? ?????? ??????????????? ??????

            // ???????????? ?????? ?????? ?????? ???????????? ?????????
            // 3?????? ????????? ????????? 1?????? ????????? 2?????? ???????????? ????????? 3?????? ??????
            loopFillGroupWithBlank : true,

            loop : true, // ?????? ??????

            pagination : { // ?????????
                el : '.swiper-pagination',
                clickable : true, // ???????????? ???????????? ?????? ???????????? ??????, ????????? ????????? ?????? ?????? ??????
            },
            navigation : { // ???????????????
                nextEl : '.button-next', // ?????? ?????? ????????????
                prevEl : '.button-prev', // ?????? ?????? ????????????
            },
        });
    </script>
</body>
</html>