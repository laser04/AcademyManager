<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-11
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../user/header.jsp" %>
<html>
<head>
    <title>등록서약/포기</title>
    <style>
        .page-title {
            font-size: 36px;
            font-weight: 600;
        }
        #radioBox{
            display: inline-block;
        }
        #noticeBox{
            text-align: center;
            padding: 20px;
        }
        #save_btn{
            background: #003A78;
        }
        #giveupReason{
            height: 150px;
            border-style: none;
            resize: none;
        }
    </style>
</head>
<body>
<div class="my-5 container">
    <div class="container-sub-header">
        <div class="d-flex flex-row justify-content-between px-3">
            <p class="page-title">등록 서약/포기</p>
        </div>
    </div>
</div>
<img id="img1"  src="https://i.ibb.co/TbKqDg1/keyboard-5017973-1920.jpg" alt="keyboard-5017973-1920" >

<div class="container-lg mt-5">
    <div>
        <form>
            <div id="noticeBox" class="row border border-1 m-1">
                <div class="pledgeNotice">
                    '자바기반 풀스택 개발자 과정'을 수강하겠습니다.
                    <%--모집전형명 불러오기--%>
                </div>
                <div class="pledgeNotice">
                    [교육기간 : 2023.09.01~2024.02.01(예정)]
                    <%--모집전형정보테이블에서 교육기간 불러오기--%>
                </div>
            </div>

            <%--라디오버튼--%>
            <div id="radioBox" class="d-flex justify-content-center">
                <label><input type="radio" id="radio_yes" name="pledge" value="Y">예(YES)</label>
                <label><input type="radio" id="radio_no" class="ms-5" name="pledge" value="N">아니오(NO)</label>
            </div>

            <%--등록포기 선택시, 보여지는 div--%>
            <div id="select_no" style="display: none">
                <div class="border border-1 p-3 mt-3 mb-3 text-center">
                    등록을 포기하고자하는 사유를 제출하며 불합격 처리에 대한 이의를 제기하지 아니할 것을 서약합니다.
                </div>
                <div id="text_box" class="form-floating border border-1 p-3 mt-3 mb-3 text-center">
                    <textarea id="giveupReason" class="form-control" placeholder="Leave a comment here"></textarea>
                </div>
            </div>

            <%--버튼--%>
            <div class="d-flex justify-content-center m-5">
                <button type="submit" id="save_btn" class="btn btn-dark">제출</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(function (){
        $('input:radio[id=radio_no]').on('click', function(){
            if($('input:radio[id=radio_no]:checked')){
                $('#select_no').show();
            }
        });
        $('input:radio[id=radio_yes]').on('click', function(){
            if($('input:radio[id=radio_yes]:checked')){
                $('#select_no').hide();
            }
        });
    });
</script>
<%@include file="../user/footer.jsp" %>
</body>
</html>
