<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Item - Start Bootstrap Template</title>

           <style> 
      
        .modalMsg-area{
    font-weight: bolder;
    font-size: 17px;
    margin-top: 20px;
    height: 70px;
}
#cart-area>*{
    color: white;
    font-weight: bolder;
    font-size: 15px;
    height: 35px;
    line-height: 5px;
    width: 100px;
    margin-top: -10px;
}
#confirm-btn{
    background-color: gray;
    margin-right: 2px;
    line-height: 22px;
}
#closebtn{
    background-color: orange;
    margin-left: 2px;
}
#deleteCompletedclosebtn{
    background-color: orange;
    width: 250px;
    color: white;
    font-weight: bolder;
}

.outer { 
    width: 1600px;
    height: auto;
    margin: auto;
}

.content-area {
	width: 1400px;
	height: auto;
	padding: 200px;
	padding-top: 5px;
    margin: auto;
}

.accordion { 
        margin-bottom: 20px;
    }

    .accordion-head {
        height: 50px;
        text-align: left;
        cursor: pointer;
        font-size: 20px;
        font-weight: bold;
    }

    .down-arrow {
        float: right;
        width: 20px;
        height: 20px;
    }

    .accordion-body {
        background-color: rgb(235, 235, 235);
        border-radius: 5px;
        margin-top: 5px;
        padding: 20px;
        display: none;
    }

    .accordion.show i.fa-chevron-down {
      transform: rotate(180deg);
    }


    </style>

    <!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- Favicon-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                 <!-- Core theme CSS (includes Bootstrap)-->
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>

    <!-- ????????? -->
	<%@ include file="../../common/menubar.jsp"%>

	<!-- ????????????  -->
	<%@ include file="shoppingsidebar.jsp"%>
 
                    <form class="d-flex">
                     
                    </form>
                </div>
            </div>
        </nav>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-4"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-5">
                          <h4 class="display- fw-bolder">???????????? ???????????? ?????? 5kg</h4>
                        
                                                     <span><b>10,000???</b></span>
                                                     <p><span>???????????? ???????????? ????????? ????????? ???????????? ??????</span></p> <hr>
                                                   
                                             <p><span data-ke-size="size23"><b><span style="color: #f3c000;">?????????</span></b></span> 2500??? (20,000??? ?????? ????????????)</p>
                                            <hr>
                                             <tr>
                                                <th width="130px">?????? ??????</th>
                                                <td>
                                                    <select class="selectpicker show-tick p-1">
                                                        <option>???????????? ???????????? ?????? 5kg</option>
                                                        <option>?????? ??????) ?????????</option>  </select>
                                                        <br> <br> 
                                                        <body onload="init();">
                                                            <script language="JavaScript">
                                                            <!--
                                                            var sell_price;
                                                            var amount;
                                                            
                                                            function init () {
                                                                sell_price = document.form.sell_price.value;
                                                                amount = document.form.amount.value;
                                                                document.form.sum.value = sell_price;
                                                                change();
                                                            }
                                                            
                                                            function add () {
                                                                hm = document.form.amount;
                                                                sum = document.form.sum;
                                                                hm.value ++ ;
                                                            
                                                                sum.value = parseInt(hm.value) * sell_price;
                                                            }
                                                            
                                                            function del () {
                                                                hm = document.form.amount;
                                                                sum = document.form.sum;
                                                                    if (hm.value > 1) {
                                                                        hm.value -- ;
                                                                        sum.value = parseInt(hm.value) * sell_price;
                                                                    }
                                                            }
                                                            
                                                            function change () {
                                                                hm = document.form.amount;
                                                                sum = document.form.sum;
                                                            
                                                                    if (hm.value < 0) {
                                                                        hm.value = 0;
                                                                    }
                                                                sum.value = parseInt(hm.value) * sell_price;
                                                            }  
                                                            //-->
                                                            </script>
                                                            
                                                            <form name="form" method="get">
                                                            <input type=hidden name="sell_price" value="10000">
                                                            <input type="text" name="amount" value="1" size="1" onchange="change();">
                                                            <input type="button" value="+" onclick="add();"> <input type="button" value="-" onclick="del();">
                                                            
                                                            ??? <input type="text" name="sum" size="5" readonly>???
                                                            <hr>
                                                     <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#likeModal">???</button>&nbsp
                                                     <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#cartModal">????????????</button>
                                                                                                     
                                                     <button type="button" class="btn btn-warning" onclick="location.href='<%= contextPathas %>/shop.order'">????????????</button>
                        </div>
                    </div>
                    
                </div>
                <div class="outer">
                    <div class="content-area">
                        
            <hr style="border: solid 1px rgb(179, 178, 178);">
           <button type="button" class="btn"">
            <a href="#tag1">?????? ??????</a>
            </button>
            <button type="button" class="btn" onclick="location.href='<%= contextPathas %>/shop.rev'">?????? ??????</button>
            <button type="button" class="btn" onclick="location.href='<%= contextPathas %>/shop.qna'">?????? ??????</button>
       
            <br> <br>

        <div style="text-align : center;">

            <img src="resources/img/sp_product.jpg"> </div>
            <br>

            <div class="accordion">
            <div class="accordion-head">
                <a name="#tag1">???????????? ?????? ??????</a>	 
                <img src="resources/img/down-arrow.png" class="down-arrow">
                
            </div>
            <p class="accordion-body">
                <b>?????????</b> ??????/?????????, ?????????, ??? <br>
                <b>??????</b> ????????????, ????????????/?????????, ???????????????, ???????????? <br>
                <b>??????</b> 5kg <br>
                <b>?????? ??????</b> ?????????, ?????????, ?????? <br>
            </p>                
        </div>
            <div class="accordion">
                <div class="accordion-head">
                    ?????? ????????? ?????? ??????
                    <img src="resources/img/down-arrow.png" class="down-arrow">
                    
                </div>
                <p class="accordion-body">
                    ????????????????????????????????????????????????????????? ?????? ?????? ????????? ?????? ?????? ????????? ????????? ?????? ??????????????? ???????????? ?????? ?????? ??? 3?????? ??????, 
                    ??? ????????? ??? ??? ?????? ??? ??? ????????? ???????????? 30??? ????????? ??????????????? ??? ??? ?????????, ?????? ????????? ????????????????????? ???????????????.
                    <br> <br>
                    ???????????????????????? ??????, ???????????? ?????? ?????? ?????? ??? ???????????? ????????? ????????? ??????????????? ?????? ?????????
                    ???????????????????????????(????????????????????? ??????) ??? ??????????????? ????????????.
                </p>                
            </div>


            <%@ include file="../../common/footerbar.jsp" %>
  
  
       <!-- ???????????? Modal -->
       <div class="modal fade" id="cartModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-area">
                                        ??????????????? ?????????????????????.
                    </div>
                    <div id="cart-area">
                      <button type="button" class="btn" data-dismiss="modal" id="closebtn" onclick="location.href='<%= contextPathas %>/cart.my'">??????</button>
                      <button type="button" class="btn" data-dismiss="modal" id="closebtn">??????</button>
                    </div>              
                </div>

            </div>
        </div>
    </div>

 <!-- ??? Modal -->
       <!-- ??? Modal -->
       <div class="modal fade" id="likeModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-area">
                                       ??? ????????? ?????????????????????.
                    </div>
                    <div id="like-area">
                      <button type="button" class="btn" data-dismiss="modal" id="closebtn" onclick="location.href='<%= contextPathas %>/like.my'">??????</button>
                      <button type="button" class="btn" data-dismiss="modal" id="closebtn">??????</button>
                    </div>              
                </div>
   

      <script>
        $(function(){
            $(".accordion-head").click(function(){  
                
                const $p = $(this).next(); 
                // var img = document.getElementsByClassName("down-arrow");

                if($p.css("display") == "none"){
                    
                    // $(this).siblings("p").slideUp();
                    
                    $p.slideDown();
                    // img.style.transform = 'rotate()';
                } else {
                    
                    $p.slideUp();
                    // img.style.transform = 'rotate(180deg)';
                }
                
            })
        })
        </script>

    
     
</body>

</html>