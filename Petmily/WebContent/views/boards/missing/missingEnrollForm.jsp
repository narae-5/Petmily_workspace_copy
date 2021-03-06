<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/boards/missing/missingEnrollUpdateForm.css" rel="stylesheet">

<%@ include file="../../common/links.jsp" %>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
    
    <div id="outer">
	    <%@ include file="missingSidebar.jsp" %>
	    <div class="content-area" align="center">
		    <div id="top">
				<div id="list-btn" align="right">
					<button type="button" class="btn btn-secondary" id="list" onclick="location.href='<%=contextPath%>/main.missing?page=1'">목록</button>
				</div>
				<hr style="border: solid 1px rgb(179, 178, 178);">
			</div>
	
	        <div id="photo-area">
	            <div id="demo" class="carousel" data-ride="carousel" data-interval="false">
	              
	                <!-- The slideshow -->
	                <div class="carousel-inner">
	                	<div class='carousel-item active'>
                           		
                        </div>
	                </div>
	              
	                <!-- Left and right controls -->
	                <a class="carousel-control-prev" href="#demo" data-slide="prev">
	                  <span class="carousel-control-prev-icon"></span>
	                </a>
	                <a class="carousel-control-next" href="#demo" data-slide="next">
	                  <span class="carousel-control-next-icon"></span>
	                </a>
	              
	            </div>
	        <form action="<%=contextPath%>/enroll.missing?uno=<%=loginUser.getMemNo() %>" method="post" enctype="multipart/form-data">
	            <div id="file-upload-area">
	                <p>사진<br>첨부</p>
	                <div id="add-area">
                        <input name="file1" class="file" type="file" onchange="loadImg(this);" required>
                    </div>
                    <input type="hidden" id="file-count" name="file-count"  value="1">
	            </div>
	            <button id="add-btn" type="button">+</button>
	        </div>
	
		        <div id="missing-area">
		            <div class="input-area">
		                <div class="select-ddcategory">
		                    <span>구분</span>
		                    <select name="d-category" class="select-dcategory">
		                    <option value="1">찾고있어요</option>
		                    <option value="2">보호하고있어요</option>
		                    </select>
		                </div>
		                <div class="category-select-area">
		                    <span>대상</span>
		                    <div class="form-check-inline">
		                    <label class="form-check-label">
		                        <input type="radio" class="form-check-input" name="category" value="1" checked>강아지
		                    </label>
		                    </div>
		                    <div class="form-check-inline">
		                    <label class="form-check-label">
		                        <input type="radio" class="form-check-input" name="category" value="2">고양이
		                    </label>
		                    </div>
		                    <div class="form-check-inline">
		                    <label class="form-check-label">
		                        <input type="radio" class="form-check-input" name="category" value="3">기타
		                    </label>
		                    </div>
		                </div>
		                <div class="gender-select-area">
		                    <span>성별</span>
		                    <div class="form-check-inline">
		                    <label class="form-check-label">
		                        <input type="radio" class="form-check-input" name="gender" value="F" checked>암컷
		                    </label>
		                    </div>
		                    <div class="form-check-inline">
		                    <label class="form-check-label">
		                        <input type="radio" class="form-check-input" name="gender" value="M">수컷
		                    </label>
		                    </div>
		                </div>
		                <div class="name-area">
		                    <span>이름</span>
		                    <input type="text" name="mpName">
		                </div>
		                <div class="age-area">
		                    <span style="margin-right: 49px;">나이</span>
		                    <input type="number" min="0" name="mpAgeFrom" required>
		                    <span>세 ~</span>
		                    <input type="number" min="1" name="mpAgeTo" id="mpAgeTo" required>
		                    <span>세</span>
		                </div>
		                <div class="missing-date-area">
		                    <span class="missing-t">발생일</span>
		                    <span class="found-t" style="display:none;">발견일</span>
		                    <input type="date" name="miDate" required>
		                </div>
		                <div class="missing-place-area">
		                    <span class="missing-t">발생장소</span>
		                    <span class="found-t" style="display:none;">발견장소</span>
		                    <input type="text" name="mpPlace" id="mpPlace" placeholder="50자 내외로 입력" required>
		                    <div>
		                    ex) 서울시 용산구 갈월동 놀이터 앞
		                    <br>상세주소로 검색이 가능합니다.
		                    </div>
		                </div>
		                <div class="feature-area">
		                    <span>신체특징</span>
		                    <textarea name="feature" id="features" placeholder="300자 내외"></textarea>
		                    <div>
		                    ex)'시츄', '파란색 눈', '초록색 줄무늬 옷'
		                    <br>키워드로 검색이 가능합니다.
		                    </div>
		                </div>
		            </div>    
		            <div align="right" class="enroll-btn-area"><button class= "btn">올리기</button></div>
		        </div>
	        </form>
		
	    </div>
    	
    </div>
    
    <!-- 선택한 카테고리에 따라 입력 양식 뜨도록 -->
    <script>
    	$(function(){
    		$(".select-dcategory").on("change", function(){
	    		var option = $(".select-dcategory option:selected").val();
	    		
	    		if(option == 2){
	    			$(".missing-t").hide();
	    			$(".found-t").show();
	    		}else{
	    			$(".missing-t").show();
	    			$(".found-t").hide();
	    		}    		    			
    		})
    	})
    </script>

	<script>
      $(function(){
         let maxAppend = 1;
         
         $("#add-btn").click(function (){
            if(maxAppend >= 5){
               alert("사진은 5개까지 업로드가 가능합니다.");
               return;
            }
            let $num = ($("#add-area").children("input").last().attr('name')).substring(4);
            let result = Number($num)+1;
            $("#add-area").append("<input class='file' type='file' onchange='loadImg(this);'>");
            $("#add-area").children("input").last().attr('name', 'file' + result);
            maxAppend++;
            $("#file-count").val(maxAppend);
         });                  
      })
   </script>
   <script>      
          function loadImg(inputFile){
                var num = inputFile.getAttribute('name').substring(4);
                console.log(num);
                var curNo = $(this).parent().find(".carousel-item").index(this);
                console.log(curNo);
                if(inputFile.files.length == 1){
                    
                    const reader = new FileReader();
                    
                    reader.readAsDataURL(inputFile.files[0]);
                    
                    reader.onload = function(e){
                       if(num == 1){
                    	  //$(".carousel-item [name=file1]").remove();
                          //$(".carousel-inner").append("<div class='carousel-item active'><img src='' alt=''></div>");
                          //$(".carousel-inner").insertAdjacentElement('beforeend', $(".carousel-inner").firstElementChild);
                          $(".carousel-item").first().children("img").remove();
                          $(".carousel-item").first().append("<img src='' alt=''>");
                          $(".carousel-item").first().children("img").attr("src", e.target.result);
                          $(".carousel-item").first().attr('name', 'file1');
                       }else{
                    	  //$(".carousel-item:nth-child(" + num + ")").remove();
                    	  $(".carousel-item [name=file" + num + "]").remove();//여기가 작동하면 될텐데.. 2->2번을 변경할경우에도 last로 간다는게 문제!
                          $(".carousel-inner").append("<div class='carousel-item'><img src='' alt=''></div>");
                          $(".carousel-item").last().children("img").attr("src", e.target.result);
                          $(".carousel-item").last().attr('name', 'file'+num);
                       }
                       
                    }
                 }else{
                     if(num == 1){
                    	 $(".carousel-item").first().children("img").remove();                          
                      }else{                           
                         $(".carousel-item [name=file" + num+ "]").children("img").attr("src", null);
                      }
                   }

          }
             
   </script>
   
   <script>
 
    $(document).ready(function() {
        $('#mpPlace').on('keyup', function() {
 
            if($(this).val().length > 50) {
                $(this).val($(this).val().substring(0, 50));
            }
        });
    });
    
    $(document).ready(function() {
        $('#features').on('keyup', function() {
 
            if($(this).val().length > 300) {
                $(this).val($(this).val().substring(0, 300));
            }
        });
    });
        
    </script>

	<%@ include file="../../common/footerbar.jsp" %>
</body>
</html>