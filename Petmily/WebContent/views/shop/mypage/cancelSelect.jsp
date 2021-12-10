<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
         div, img, li, a{
		     box-sizing: border-box;
		}
		     
		.content-area{
			width: 1400px;
			height: 1000px;
			padding:200px;
			padding-top:0px;
		}
        .title{ 
            color:rgb(94,94,94); /* 색상 바꾸기 */
            font-size: 30px;
            font-weight: 900;
            margin:20px;
            margin-left:10px;
        } 

		.outer{
		margin-left:150px;
		width:1400px;
		}
        /*기간 버튼 클릭시 색 변경*/
        .div2 {
        width: 70px;
        height: 30px;
        padding-top:5px;
        padding-left:17px;
        border-radius: 5px;
        margin:10px;
        background-color: rgb(213,213,213); /* 색상 바꾸기 */
      }

      .clicked {
        background-color: gold; /* 색상 바꾸기 */
      }

      /*내역 테이블*/
      #cancel-content{
          width:700px;
          border:1px solid #444444;
          border-collapse: collapse;
          text-align: center;
          margin:10px;
          padding-top: 30px;
      }

      th, td {
         border: 1px solid #444444;
         padding:5px;
      }

      #process1, #process2, #process3, #process4 {
          font-size: 20px;
          text-align: center;
          color:orangered;
          font-weight: 700;
          margin-top:30px;
          height:150px;
          vertical-align: middle;
      }

      .process-content{
          font-size: 12px;
          color:gray;
          margin:20px 20px
      }





      
      .inline-block{display:inline-block;}
    </style>
</head>
<body>
<%@ include file="../../common/menubar.jsp" %>
<%@ include file="mypageSidebar.jsp" %>
	
    <div class="content-area">
    <div class="outer">
    	 <div class="title">취소/환불 내역 조회</div>
         <hr>

         <div class="div1">
            <div class="div2 inline-block">1주일</div>
            <div class="div2 inline-block">1개월</div>
            <div class="div2 inline-block">3개월</div>
            <div class="div2 inline-block">6개월</div>
          </div>

          <table id="cancel-content" style="border-spacing: 10px;">
            <tr style="background-color: rgb(213,213,213);">
                <th>주문번호/주문일 </th>
                <th>상품정보</th>
                <th>진행상태</th>
            </tr>
            <tr>
                <td>주문번호 : A-13124954 
                    <br> 주문일 : 21.11.15
                </td>
                <td>
                    상품명 <br>
                    1개 / 블루 / 20,000원 <br>
                    결제수단 : 신용카드
                </td>
                <td>
                    취소완료
                </td>
            </tr>
    
        </table>

        <table id="cancel-content" style="border-spacing: 10px;">
            <tr style="background-color: rgb(213,213,213);">
                <th>주문번호/주문일 </th>
                <th>상품정보</th>
                <th>진행상태</th>
            </tr>
            <tr>
                <td>주문번호 : A-13124954 
                    <br> 주문일 : 21.11.15
                </td>
                <td>
                    상품명 <br>
                    1개 / 블루 / 20,000원 <br>
                    결제수단 : 신용카드
                </td>
                <td>
                    취소완료
                </td>
            </tr>
    
        </table>

        <div class="paging-area" align="center">
            <button class="pagging inline-block">&lt</button>
            <button class="pagging inline-block">1</button>
            <button class="pagging inline-block">2</button>
            <button class="pagging inline-block">3</button>
            <button class="pagging inline-block">4</button>
            <button class="pagging inline-block">&gt</button>
        </div>

        <br><br>

        <div class="title">취소/환불 과정</div>
        <hr>
        <div id="process">
            <div class="inline-block" id="process1">
                즉시취소
                <p class="process-content">주문이 결제 완료 상태이면,<br>
                즉시 취소 가능합니다.</p>
            </div>
            <img src="" alt="" width="50px" height="50">
            <div class="inline-block" id="process2">
                반품신청
                <p class="process-content">주문이 배송중, 배송완료 상태이면,<br>
                     반품신청 가능합니다.</p>
            </div>
            <img src="" alt="" width="50px" height="50">
            <div class="inline-block" id="process3">
                반품처리중
                <p class="process-content">반품 신청이 완료되면 고객 <br>
                     센터에서 처리하게 됩니다.</p>
            </div>
            <img src="" alt="" width="50px" height="50">
            <div class="inline-block" id="process4">
                취소/환불 완료
                <p class="process-content">주문 건은 취소/반품 완료 후 <br>
                     환불 처리 해드리고있습니다. <br>
                      영업일 기준 3~5일 소요될 수 <br>
                      있습니다.</p>
            </div>
        </div>
    </div>
       
        








    </div>

    <script>
        var div2 = document.getElementsByClassName("div2");

        function handleClick(event) {
        console.log(event.target);
        // console.log(this);
        // 콘솔창을 보면 둘다 동일한 값이 나온다

        console.log(event.target.classList);

        if (event.target.classList[1] === "clicked") {
            event.target.classList.remove("clicked");
        } else {
            for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
            }

            event.target.classList.add("clicked");
        }
        }

        function init() {
        for (var i = 0; i < div2.length; i++) {
            div2[i].addEventListener("click", handleClick);
        }
        }

        init();
    </script>
    

<%@ include file="../../common/footerbar.jsp" %>
</body>
</html>