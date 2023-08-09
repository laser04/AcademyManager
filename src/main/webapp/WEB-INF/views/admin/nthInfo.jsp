<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-08
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body{
            background-color: #F2F3F5;
        }
        .container-table .form-select:focus,
        .container-table .form-control:focus{
           box-shadow: none;
           border-color: #9a9a9a;
        }

        /* 과정 검색 */
        .tableSearch{
            font-weight: 600;
        }

        /* 검색 결과 수 */
        .searchResult .subTitle{
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 0;
        }
        .searchResult .subResult{
            font-size: 14px;
            margin-bottom: 0;
        }
        .searchResult select.form-select{
            padding: 0.2rem 1.25rem 0.2rem 0.75rem;
        }


        /* 과정 정보 테이블 */
        .nthInfoResponsive{
            overflow-x: auto;
        }
        .nthInfoContainer{
            min-width: 1220px;
            cursor: pointer;
        }
        .nthInfoContainer .d-flex{
            border-bottom:1px solid #E1E1E1;
        }
        .nthInfoContainer .d-flex div:nth-child(n+2){
            height: 44px;
            border-left: 1px solid #E1E1E1;
            padding: 10px 0;
        }
        .nthInfoContainer .d-flex .chkBox,
        .nthInfoContainer .d-flex .chkBox input[type='checkbox']{
            height: 44px;
            border:none;
        }

        .nthInfoContainer .th{
            background-color: #EFEFEF;
            font-weight: 600;
        }
        .container-table .tr,
        .nthInfoContainer .d-flex.td:nth-child(even){
            background-color: #fff;
        }
        .nthInfoContainer .d-flex.td:nth-child(odd){
           background-color: rgba(0,0,0,0);
        }
        .nthInfoContainer .d-flex.td:not(.tdBg) :nth-child(n):hover{
            background-color: #D1D1D1;
            font-weight: 600;
            color: #245396;
        }

        /* 체크 박스 선택 시 css */
        .nthInfoContainer .d-flex.tdChk{
            background-color: #D1D1D1 !important;
        }
        /* row 선택 시 focus css */
        .nthInfoContainer .d-flex.tdBg{
            background-color: #F2F7FF !important;
            border: 1px solid #245396 !important;
            font-weight: 600;
            color: #245396;
        }


        /* 페이징 */
        .pagination ul {
            margin: 15px 0;
            border: none;
            padding: 0;
        }
        .pagination ul li{
            display: inline-block;
            border: none;
            width: 25px;
            height: 25px;
            padding: 0;
        }
        .pagination ul li.active{
            background-color: #f5f5f5;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
            color: #245396;
        }
        .pagination ul li:not(.active):hover{
            background-color: #e1e1e1;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
        }
        .pagination .pageLoc {
            margin: 0 10px 0 0;
            color: #797676;
        }

        .table .tableColor{
            background-color: #FAFAFA;
        }
        .table .tableInput{
            background-color: #F4F4F4;
        }

    </style>
</head>
<body>
    <div class="container-table m-2">
        <div class="col-12">
            <div class="d-flex flex-row justify-content-end mb-1">
                <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
                <button id="insertBtn" class="btn btn-sm btn-light me-1">신규</button>
                <button id="saveBtn" class="btn btn-sm btn-light me-1">저장</button>
                <button id="deleteBtn" class="btn btn-sm btn-light me-1">삭제</button>
            </div>

            <div class="d-flex flex-row py-3 px-5 border border-gray-100 rounded-2 align-items-center tr">
                <div class="col-2 align-middle tableSearch">수강년도/분기</div>
                <div class="col-1 me-1"><input type="text" class="form-control"></div>
                <div class="col-1 me-2">
                    <select class="form-select">
                        <option selected>1분기</option>
                        <option>2분기</option>
                        <option>3분기</option>
                        <option>4분기</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정구분</div>
                <div class="col-2 me-2">
                    <select class="form-select">
                        <option selected>Java</option>
                        <option>Python</option>
                        <option>C++</option>
                    </select>
                </div>

                <div class="col-2 tableSearch">과정명</div>
                <div class="col-2"><input type="text" class="form-control"></div>
            </div>
        </div>

        <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
            <div class="col-3 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">모집기수정보</p>
                <p class="subResult text-secondary me-2">검색결과:00건</p>
                <div>
                    <select class="form-select">
                        <option selected>5</option>
                        <option>30</option>
                        <option>50</option>
                        <option>70</option>
                        <option>100</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div class="nthInfoResponsive">
                <div class="nthInfoContainer">
                    <div class="d-flex flex-row align-items-center th">
                        <div class="col-1 chkBox"><input type="checkbox" id="chkAll"></div>
                        <div class="col-2">과정명</div>
                        <div class="col-1">과정구분</div>
                        <div class="col-1">기수</div>
                        <div class="col-1">수강년도</div>
                        <div class="col-1">분기</div>
                        <div class="col-2">교육기간</div>
                        <div class="col-1">발표일자</div>
                        <div class="col-1">수업개월수</div>
                        <div class="col-1">비고</div>
                    </div>
                    <div class="d-flex flex-row align-items-center td tdBg" onclick="test(this);">
                        <div class="col-1 chkBox"><input type="checkbox" name="checkBox" onclick="check(this);"></div>
                        <div class="col-2">자바기반 풀스택</div>
                        <div class="col-1">JAVA</div>
                        <div class="col-1">3</div>
                        <div class="col-1">2023</div>
                        <div class="col-1">1</div>
                        <div class="col-2">2022-12-10 ~ 2023-05-15</div>
                        <div class="col-1">2022-12-02</div>
                        <div class="col-1">6</div>
                        <div class="col-1"></div>
                    </div>


                    <div class="d-flex flex-row align-items-center td" onclick="test(this);">
                        <div class="col-1 chkBox"><input type="checkbox" name="checkBox" onclick="check(this);"></div>
                        <div class="col-2">파이썬</div>
                        <div class="col-1">Python</div>
                        <div class="col-1">1</div>
                        <div class="col-1">2022</div>
                        <div class="col-1">2</div>
                        <div class="col-2">2022-05-10 ~ 2022-08-20</div>
                        <div class="col-1">2022-05-01</div>
                        <div class="col-1">3</div>
                        <div class="col-1">비고비고</div>
                    </div>
                    <div class="d-flex flex-row align-items-center td" onclick="test(this);">
                        <div class="col-1 chkBox"><input type="checkbox" name="checkBox" onclick="check(this);"></div>
                        <div class="col-2">C++ 코딩테스트</div>
                        <div class="col-1">C++</div>
                        <div class="col-1">2</div>
                        <div class="col-1">2023</div>
                        <div class="col-1">4</div>
                        <div class="col-2">2023-10-10 ~ 2022-11-10</div>
                        <div class="col-1">2022-09-20</div>
                        <div class="col-1">2</div>
                        <div class="col-1"></div>
                    </div>
                </div>
            </div>

            <%-- 페이징 --%>
            <div class="pagination d-flex flex-row justify-content-center text-center position-relative tr">
                <ul>
                    <li class="active">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>7</li>
                    <li>8</li>
                    <li>9</li>
                    <li>10</li>
                    <li>></li>
                    <li>>></li>
                </ul>

                <div class="position-absolute top-50 end-0 translate-middle-y">
                    <p class="pageLoc">현재:1/전체:14(1~5)</p>
                </div>
            </div>
        </div>

        <table id="inputTable" class="table border fw-bold align-middle mt-4">
            <tr>
                <td class="col-2 tableColor">과정구분<span class="text-danger">*</span></td>
                <td class="col-2">
                    <select class="form-select tableInput" aria-label="Default select">
                        <option>[S] CORS_DIV [LM0010]</option>
                        <option selected>[S] CORS_DIV [LM0010] 2</option>
                    </select>
                </td>
                <td class="col-2 tableColor">수강년도<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="ENT_YR"></td>
                <td class="col-2 tableColor">분기구분<span class="text-danger">*</span></td>
                <td class="col-2">
                    <select class="form-select tableInput" aria-label="Default select">
                        <option selected>[S] TERM_DIV [CO0005]</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="col-2 tableColor">기수코드</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NTH_CD" readonly></td>
                <td class="col-2 tableColor">교육시작일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="[CAL] EDU_ST_DT"></td>
                <td class="col-2 tableColor">교육종료일<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="[CAL] EDU_END_DT"></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">과정명</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NTH_NM"></td>
                <td class="col-2 tableColor">발표일자</td>
                <td class="col-2"><input class="form-control tableInput" type="date" value="2020-10-10"></td>
                <td class="col-2 tableColor">수업개월수<span class="text-danger">*</span></td>
                <td class="col-2"><input class="form-control tableInput" type="number" value="YR_CNT" id="entInput"></td>
            </tr>
            <tr>
                <td class="col-2 tableColor">비고</td>
                <td class="col-2"><input class="form-control tableInput" type="text" value="NOTE"></td>
                <td class="col-2 tableColor"></td>
                <td class="col-2"></td>
                <td class="col-2 tableColor"></td>
                <td class="col-2"></td>
            </tr>
        </table>
    </div>


    <script>

        // 체크박스 전체 선택
        var chkAll = document.getElementById("chkAll");
        var chkBox = document.getElementsByName("checkBox");
        chkAll.addEventListener("click", function(){
            chkBox.forEach((chk) => {
                chk.checked = chkAll.checked;
                check(chk);
            });
        })

        // 체크박스 선택 시 css
        function check(e){
            var td = e.parentElement.parentElement;
            if(e.checked) td.classList.add("tdChk");
            else td.classList.remove("tdChk");
        }

        // row 클릭 시 focus
        function test(e){
            var tdBg = document.getElementsByClassName("tdBg");

            tdBg[0].classList.remove("tdBg");
            e.classList.add("tdBg");

            // 하단 input에 값 넣기
            var datas = document.querySelectorAll(".tdBg div");
            var inputs = document.querySelectorAll("#inputTable input");

            for(var i=0; i<datas.length-1; i++){
                inputs[i].value = datas[i+1].innerText;
            }
        }

        // 신규 btn 클릭 이벤트
        var insertBtn = document.getElementById("insertBtn");
        insertBtn.addEventListener("click", function () {

            // 테이블에 새로운 행 추가
            var tdBg = document.getElementsByClassName("tdBg");

            var td = document.createElement("div");
            td.setAttribute("class", "d-flex flex-row align-items-center td tdBg");
            td.setAttribute("onclick", "test(this);");

            for(var i=0; i<10; i++){
                var div = document.createElement("div");
                var clazz = "";
                if(i===0) {
                    clazz = "col-1 chkBox";
                    var input = document.createElement("input");
                    input.setAttribute("type", "checkbox");
                    input.setAttribute("name", "checkBox");
                    input.setAttribute("onclick", "check(this);");

                    div.setAttribute("class", clazz);
                    div.append(input);
                    td.append(div);
                    continue;
                }
                else if(i===1 || i===6) clazz = "col-2";
                else clazz = "col-1";

                div.setAttribute("class", clazz);
                td.append(div);
            }
            tdBg[0].after(td);
            tdBg[0].classList.remove("tdBg");


            // 아래 input 초기화
            var inputs = document.querySelectorAll("#inputTable input");
            var selects = document.querySelectorAll("#inputTable select");
            var dates = document.querySelectorAll("#inputTable input[type='date']");

            var idx = 0;
            inputs.forEach((input) => {
                input.value = "";
                if(idx > 2) return;
                else {
                    if(idx < 2) selects[idx].firstElementChild.setAttribute("selected", "selected");
                    dates[idx].value = "null";
                }
                idx++;
            });
        });


        // input number 음수 막기
        var entInput = document.getElementById("entInput");
        entInput.addEventListener("click", function () {
            if(this.value < 0){
                this.value = 0;
                alert("음수값은 설정할 수 없습니다.");
            }
        });
        entInput.addEventListener("keydown", function () {
            if(this.value < 0){
                this.value = 0;
                alert("음수값은 설정할 수 없습니다.");
            }
        });
    </script>
</body>
</html>