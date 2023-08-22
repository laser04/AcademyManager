<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-08-09
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <style>
        body {
            font-size: 15px !important;
            font-weight: bolder !important;
        }

        ul > li > ul {
            cursor: pointer;
            padding: 5px;
        }
    </style>
    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, caption, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;

        }

        .div_wrap_title {
            display: flex;
        }

        .align_right {
            text-align: right !important;
        }
    </style>
    <!-- JQuery -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>
        * {
            padding: 0;
            margin: 0;
        }

        body {
            background-color: #F2F3F5;
        }

        .container-table .form-select:focus,
        .container-table .form-control:focus {
            box-shadow: none;
            border-color: #9a9a9a;
        }

        /* 과정 검색 */
        .tableSearch {
            font-weight: 600;
        }

        /* 검색 결과 수 */
        .searchResult .subTitle {
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 0;
        }

        .searchResult .subResult {
            font-size: 14px;
            margin-bottom: 0;
        }

        .searchResult select.form-select {
            padding: 0.2rem 1.25rem 0.2rem 0.75rem;
        }

        .nthInfoContainer .d-flex div:nth-child(n+2) {
            height: 44px;
            border-left: 1px solid #E1E1E1;
            padding: 10px 0;
        }

        .nthInfoContainer .d-flex .chkBox,
        .nthInfoContainer .d-flex .chkBox input[type='checkbox'] {
            height: 44px;
            border: none;
        }

        .nthInfoContainer .th {
            background-color: #EFEFEF;
            font-weight: 600;
        }

        .container-table .tr,
        .nthInfoContainer .d-flex.td:nth-child(even) {
            background-color: #fff;
        }

        .nthInfoContainer .d-flex.td:nth-child(odd) {
            background-color: rgba(0, 0, 0, 0);
        }

        .nthInfoContainer .d-flex.td:not(.tdBg) :nth-child(n):hover {
            background-color: #D1D1D1;
            font-weight: 600;
            color: #245396;
        }

        /* 체크 박스 선택 시 css */
        .nthInfoContainer .d-flex.tdChk {
            background-color: #D1D1D1 !important;
        }

        /* row 선택 시 focus css */
        .nthInfoContainer .d-flex.tdBg {
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

        .pagination ul li {
            display: inline-block;
            border: none;
            width: 25px;
            height: 25px;
            padding: 0;
        }

        .pagination ul li.active {
            background-color: #f5f5f5;
            border-radius: 5px;
            width: 25px;
            height: 25px;
            font-weight: 600;
            color: #245396;
        }

        .pagination ul li:not(.active):hover {
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

        .table .tableColor {
            background-color: #FAFAFA;
        }

        .table .tableInput {
            background-color: #F4F4F4;
        }

        .divBtn{
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;

            color: #9E9FA8 !important;
            background-color: #C2C2C4 !important;

            cursor: pointer;
        }

        .nav-tabs > .nav-item > .active {
            color: #224FA8 !important;
            background-color: white !important;
        }

        .table>tbody>tr>td:nth-child(odd) {
            background-color: #F5F5F5;
        }
    </style>
</head>
<body>
<div class="container-table m-2">
    <div class="col-12">
        <div class="d-flex flex-row justify-content-end mb-1">
            <button id="selectBtn" class="btn btn-sm btn-secondary me-1">조회</button>
        </div>
        <div class="py-3 px-5 border border-gray-100 rounded-2 tr">
            <div class="row mb-2">
                <div class="col-4 d-flex align-items-center">
                    <div class="align-middle me-5">
                        <label for="sugang">수강년도/분기</label>
                    </div>
                    <div class="ms-5 col">
                        <input type="text" id="sugang" class="form-control">
                    </div>
                    <div class="ms-2 col">
                        <select class="form-select">
                            <option selected>1분기</option>
                            <option>2분기</option>
                            <option>3분기</option>
                            <option>4분기</option>
                        </select>
                    </div>
                </div>
                <div class="col-4 d-flex align-items-center">
                    <div class="tableSearch me-5">
                        <label for="courseSelect">과정구분</label>
                    </div>
                    <div class="ms-5 col">
                        <select id="courseSelect" class="form-select">
                            <option selected>(전체)</option>
                            <option>JAVA</option>
                            <option>Python</option>
                            <option>C++</option>
                        </select>
                    </div>
                </div>
                <div class="col-4 d-flex align-items-center">
                    <div class="tableSearch me-5">
                        <label for="registrationCourseName">모집과정명</label>
                    </div>
                    <div class="ms-5 col">
                        <input id="registrationCourseName" type="text" class="form-control">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="d-flex col-4 align-items-center">
                    <div class="tableSearch me-5 col-2">
                        <label for="studentName">성명</label>
                    </div>
                    <div class="ms-5 col">
                        <input id="studentName" type="text" class="form-control">
                    </div>
                </div>
                <div class="d-flex col-4 align-items-center">
                    <div class="tableSearch me-5">
                        <label for="registrationStatus">상태구분</label>
                    </div>
                    <div class="ms-5 col">
                        <select id="registrationStatus" class="form-select">
                            <option selected>(전체)</option>
                            <option>작성중</option>
                            <option>작성완료</option>
                        </select>
                    </div>
                </div>
                <div class="col-4">
                </div>
            </div>
        </div>

        <div class="col-12 d-flex flex-row searchResult mt-4 mb-2">
            <div class="col-3 d-flex flex-row align-items-center">
                <p class="subTitle fw-bold me-2">모집기수정보</p>
                <p class="subResult text-secondary me-2">검색결과: 00건</p>
            </div>
        </div>

        <div class="nthInfoTable text-center border border-gray-100 rounded-2">
            <div id="nthTable"></div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-5">
            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center">
                    <div>
                        <span class="fw-bold me-2">지원자목록</span>
                    </div>
                    <div>
                        <span class="text-secondary me-2">검색결과 : 0건</span>
                    </div>
                    <div>
                        <select class="form-select-sm">
                            <option value="5">5</option>
                            <option value="30" selected="">30</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                            <option value="500">500</option>
                        </select>
                    </div>
                </div>
                <div>
                    <button id="btn_grid2_excel_export" class="btn btn-sm btn-secondary me-1">
                        엑셀내보내기(전체)
                    </button>
                </div>
            </div>
            <div class="mt-2">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex">
                        <div class="me-4">
                            <label for="slt_arg2_aply_sts_div" class="form-label">상태구분</label>
                        </div>
                        <div>
                            <select id="slt_arg2_aply_sts_div" class="form-select-sm me-3">
                                <option value="10">작성중</option>
                                <option value="30">제출완료</option>
                            </select>
                        </div>
                        <div>
                            <button id="btn_arg2_change_all" class="btn btn-sm btn-secondary me-1"
                                    onclick="fn_grid2_change_all_onclick()">
                                일괄변경
                            </button>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end">
                        <div>
                            <button id="btn_aply_cfm" class="btn btn-sm btn-secondary me-1"
                                    onclick="fn_aply_cfm_onclick()" disabled>접수취소
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="peopleListGrid" class="mt-2"></div>
        </div>
        <!-- 탭 아이디 'mainTab' -->
        <div id="mainTab" class="col-7">
            <ul role="tablist" class="nav nav-tabs col-9" id="tabList">
                <li role="presentation" class="nav-item me-1 col-2">
                    <button class="nav-link active divBtn w-100" id="btn_tab1" data-bs-toggle="tab" data-bs-target="#tab1"
                            type="button" role="tab" aria-controls="tab1" aria-selected="true">기본정보
                    </button>
                </li>
                <li role="presentation" class="nav-item me-1 col-2">
                    <button class="nav-link divBtn w-100" id="btn_tab2" data-bs-toggle="tab" data-bs-target="#tab2" type="button"
                            role="tab" aria-controls="tab2" aria-selected="false">학력사항
                    </button>
                </li>
                <li role="presentation" class="nav-item me-1 col-2">
                    <button class="nav-link divBtn w-100" id="btn_tab3" data-bs-toggle="tab" data-bs-target="#tab3" type="button"
                            role="tab" aria-controls="tab3" aria-selected="false">활동이력
                    </button>
                </li>
                <li role="presentation" class="nav-item me-1 col-2">
                    <button class="nav-link divBtn w-100" id="btn_tab4" data-bs-toggle="tab" data-bs-target="#tab4" type="button"
                            role="tab" aria-controls="tab4" aria-selected="false">자기소개서
                    </button>
                </li>
                <li role="presentation" class="nav-item me-1 col-2">
                    <button class="nav-link divBtn w-100" id="btn_tab5" data-bs-toggle="tab" data-bs-target="#tab5" type="button"
                            role="tab" aria-controls="tab5" aria-selected="false">제출서류
                    </button>
                </li>
            </ul>
            <div class="tab-content text-bg-light bg-white" id="myTabContent">
                <div id="tab1" aria-labelledby="btn_tab1" role="tabpanel"
                     class="tab-pane fade show active" tabindex="0">
                    <div class="wrap_contents" style="height: 700px;">
                        <div class="contents">
                            <div class="container">
                                <div class="d-flex justify-content-between py-3 align-items-center">
                                    <div>기본정보</div>
                                    <div>
                                        <button id="btn_tab1_modify" class="btn btn-sm btn-secondary me-1"
                                                title="Modify"
                                                onclick="fn_btn_tab1_modify_onclick()" disabled="">수정
                                        </button>
                                        <button id="btn_tab1_save" class="btn btn-sm btn-secondary me-1"
                                                title="Save"
                                                onclick="fn_btn_tab1_save_onclick()" disabled="">저장
                                        </button>
                                    </div>
                                </div>
                                <div class="form-basic">
                                    <div class="border-top border-3 border-dark">
                                        <table class="table">
                                            <thead></thead>
                                            <tbody>
                                                <tr>
                                                    <td class="align-middle">모집과정명</td>
                                                    <td class="align-middle">
                                                        <select id="slt_cors_div" class="form-select"
                                                                disabled="">
                                                            <option value="10">정규과정</option>
                                                            <option value="21">야간과정</option>
                                                            <option value="30">번역아틀리에</option>
                                                            <option value="40">문화콘텐츠 번역실무 고급과정</option>
                                                        </select>
                                                    </td>
                                                    <td class="align-middle">성별</td>
                                                    <td class="align-middle">
                                                        <select id="slt_gen_div"
                                                                class="form-select"
                                                                style="">
                                                            <option value=" ">(미선택)</option>
                                                            <option value="10">남자</option>
                                                            <option value="20">여자</option>
                                                            <option value="30">기타</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="align-middle">이메일</td>
                                                    <td class="align-middle">
                                                        <div class="input-group">
                                                            <input type="text" id="txt_transcript_email"
                                                                   class="form-control" disabled="disabled">
                                                            <!-- <button class="btn_email btn_slt button_sm noShrink" title="이메일인증" onclick="location.href='./EN0220P.html'">이메일인증</button> -->
                                                        </div>
                                                    </td>
                                                    <td rowspan="7" class="align-middle">사진</td>
                                                    <td rowspan="7" class="align-middle">
                                                        <div class="profile-pic dp_inlineblk"
                                                             style="vertical-align: bottom;">
                                                            <img id="img_preview" class="profile-pic" src="/일본어_김현진.jpg">
                                                        </div>
                                                        <!-- <div class="div_top_gap_06 dp_inlineblk" style="vertical-align: bottom;">
                                                            <button class="btn_slt button_sm" title="업로드">업로드</button>
                                                            <button class="btn_slt button_sm" title="삭제">삭제</button>
                                                        </div> -->
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="align-middle">성명(한글)</td>
                                                    <td class="align-middle"><input type="text" id="txt_inp1_nm_kor" value=""
                                                               class="form-control " maxlength="50"
                                                               disabled="disabled"></td>

                                                </tr>
                                                <tr>
                                                    <td class="fake_th lbl_chk align-middle">성명(영어)</td>
                                                    <td class="align-middle"><input type="text" id="txt_inp1_nm_eng" value=""
                                                               class="form-control" maxlength="50"
                                                               disabled="disabled"></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-middle">생년월일</td>
                                                    <!-- <td>
                                                        <span class="bg-icon_calendar div_top_gap_04">
                                                            <input type="date" id="cal_brdt" class="cal_brdt width_100 ">
                                                        </span>
                                                    </td> -->
                                                    <td class="align-middle">
                                                        <div class="multi_inputs">
                                                            <input type="text" id="cal_brdt"
                                                                   class="cal_brdt txt_default cal_format_kr hasDatepicker"
                                                                   maxlength="10" autocomplete="off"
                                                                   disabled="disabled"><img
                                                                class="ui-datepicker-trigger"
                                                                src="/images/icon-calendar.svg"
                                                                alt="..." title="...">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="align-middle">우편번호</td>
                                                    <td class="align-middle">
                                                        <div class="d-flex">
                                                            <input type="text" placeholder="" id="txt_inp1_zip_cd"
                                                                   class="form-control"
                                                                   disabled="disabled">
                                                            <button id="btn_zip_cd"
                                                                    class="btn btn-outline-secondary btn-sm me-2" title="검색"
                                                                    onclick="fn_inp1_zipcode_onclick()" disabled="disabled">
                                                                검색
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fake_th align-middle">주소(기본)</td>
                                                    <td colspan="3" class="align-middle"><input type="text" id="txt_inp1_addr_local"
                                                                           class="form-control" maxlength="200"
                                                                           disabled="disabled"></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-middle">주소(상세)</td>
                                                    <td colspan="3" class="align-middle"><input type="text" id="txt_inp1_addr_natv"
                                                                           class="form-control" maxlength="200"
                                                                           disabled="disabled"></td>
                                                </tr>
                                                <tr>
                                                    <td class="align-middle">전화번호</td>
                                                    <td class="align-middle"><input type="text" id="txt_inp1_tel_local"
                                                               class="form-control" maxlength="20"
                                                               oninput="fn_numSign(this)" disabled="disabled"></td>
                                                    <td class="align-middle">휴대전화</td>
                                                    <td class="align-middle"><input type="text" id="txt_inp1_tel_natv"
                                                               class="form-control" maxlength="20"
                                                               oninput="fn_numSign(this)" disabled="disabled"></td>
                                                </tr>
                                                <tr hidden="">
                                                    <td>
                                                        <div id="txt_aply_no"></div>
                                                    </td>
                                                    <td>
                                                        <div id="txt_mem_id"></div>
                                                    </td>
                                                    <td>
                                                        <div id="txt_tab1_sel_cd"></div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab2" aria-labelledby="btn_tab2" role="tabpanel"
                     class="tab-pane fade" tabindex="0">
                    <!-- 탭2 그리드1 -->
                    <div style="height: 700px;">
                        <div class="contents">
                            <div class="container">
                                <div class="d-flex justify-content-between py-3 align-items-center">
                                    <div class="grid_title grid_title_arrange">
                                        <div id="lbl_tab2_grid1_title">학력사항</div>
                                    </div>
                                    <div>
                                        <button id="btn_tab2_grid1_modify" class="btn btn-sm btn-secondary me-1"
                                                onclick="fn_tab2_grid1_modify_onclick()">수정
                                        </button>
                                        <button id="btn_tab2_grid1_save" class="btn btn-sm btn-secondary me-1"
                                                disabled=""
                                                onclick="fn_tab2_grid1_save_onclick()">저장
                                        </button>
                                    </div>
                                </div>
                                <div id="tab2Grid" style="width: 99%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab3" aria-labelledby="btn_tab3" role="tabpanel"
                     class="tab-pane fade" aria-hidden="true">
                    <!-- 탭3 그리드1 -->
                    <div style="height: 700px;">
                        <div class="contents">
                            <div class="container">
                                <div class="d-flex justify-content-between py-3 align-items-center">
                                    <div class="grid_title grid_title_arrange">
                                        <div id="lbl_tab3_grid1_title">활동이력</div>
                                    </div>
                                    <div class="align_right">
                                        <button id="btn_tab3_grid_modify" class="btn btn-sm btn-secondary me-1"
                                                onclick="fn_tab3_grid1_modify_onclick()">수정
                                        </button>
                                        <button id="btn_tab3_grid_save" class="btn btn-sm btn-secondary me-1"
                                                disabled=""
                                                onclick="fn_tab3_grid1_save_onclick()">저장
                                        </button>
                                    </div>
                                </div>
                                <div id="tab3Grid" style="width: 99%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab4" aria-labelledby="btn_tab4" role="tabpanel"
                     class="tab-pane fade" aria-hidden="true">
                    <div style="height: 700px;">
                        <div class="contents">
                            <div class="container">
                                <div class="div_wrap_title d-flex justify-content-between py-3 align-items-center">
                                    <div class="grid_title grid_title_arrange">자기소개서</div>
                                </div>
                                <div id="wrap_div">
                                    <div id="div_tab4_inp1">
                                        <div id="item_no_0" class="form-basic div_top_gap_20" item_no="1" item_expl="">
                                            <div>
                                                <td>▶ 지원동기 [글자 제한 : 2000자]</td>
                                            </div>
                                            <div>
                                                <textarea name="ans"
                                                          style="height:175px; overflow-y:scroll;"
                                                          class="form-control"
                                                          onkeyup="fn_answer_keyup(this)"
                                                          onkeydown="fn_answer_keydown(this)"
                                                ></textarea></div>
                                            <div class="div_top_gap_10"><p class="inp_limit align_right div_top_gap_04">(2107 /
                                                2000 자)</p></div>
                                        </div>

                                        <div id="item_no_2" class="form-basic div_top_gap_20" item_no="3" item_expl="">
                                            <div class="div_top_gap_10">
                                                <td class="align_left bdr_bottom_unset">▶ 과정 중 수학 계획 [글자 제한 :
                                                    2000자]
                                                </td>
                                            </div>
                                            <div class="div_top_gap_10">
                                                <td class="align_left div_pd_all_gap_unset bdr_bottom_unset subtxt"></td>
                                            </div>
                                            <div class="div_top_gap_10"><textarea name="ans"
                                                                                  style="height:175px; overflow-y:scroll;"
                                                                                  class="form-control"
                                                                                  onkeyup="fn_answer_keyup(this)"
                                                                                  onkeydown="fn_answer_keydown(this)"
                                                                                  disabled="disabled"></textarea></div>
                                            <div class="div_top_gap_10"><p class="inp_limit align_right div_top_gap_04">(44 /
                                                2000 자)</p></div>
                                        </div>
                                        <div id="item_no_3" class="form-basic div_top_gap_20" item_no="4" item_expl="">
                                            <div class="div_top_gap_10">
                                                <td class="align_left bdr_bottom_unset">▶ 수료 후 계획 [글자 제한 : 2000자]
                                                </td>
                                            </div>
                                            <div class="div_top_gap_10">
                                                <td class="align_left div_pd_all_gap_unset bdr_bottom_unset subtxt"></td>
                                            </div>
                                            <div class="div_top_gap_10"><textarea name="ans"
                                                                                  style="height:175px; overflow-y:scroll;"
                                                                                  class="form-control"
                                                                                  onkeyup="fn_answer_keyup(this)"
                                                                                  onkeydown="fn_answer_keydown(this)"
                                                                                  disabled="disabled"></textarea></div>
                                            <div class="div_top_gap_10"><p class="inp_limit align_right div_top_gap_04">(19 /
                                                2000 자)</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab5" aria-labelledby="btn_tab5" role="tabpanel"
                     class="tab-pane fade" aria-hidden="true">
                    <!-- 탭5  -->
                    <div style="height: 700px;">
                        <div class="contents">
                            <div class="container">
                                <div class="d-flex justify-content-between py-3 align-items-center">
                                    <div class="grid_title grid_title_arrange">
                                        <div id="lbl_tab5_grid1_title">제출서류</div>
                                    </div>
                                    <div class="align_right">
                                        <!-- <button id="btn_tab6_modify" class="btn-default" onclick="fn_btn_tab6_modify_onclick()">수정</button> -->
                                        <button id="btn_tab5_new" class="btn btn-sm btn-secondary me-1"
                                                onclick="fn_tab6_new_onclick()">신규
                                        </button>
                                        <button id="btn_tab5_save" class="btn btn-sm btn-secondary me-1"
                                                onclick="fn_btn_tab6_save_onclick()">저장
                                        </button>
                                    </div>
                                </div>
                                <div id="tab5Grid" style="width: 99%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
    class RowNumberRenderer {
        constructor(props) {
            const el = document.createElement('span');
            el.innerHTML = props.formattedValue;
            this.el = el;
        }

        getElement() {
            return this.el;
        }

        render(props) {
            this.el.innerHTML = props.formattedValue;
        }
    }

    const gridTheme = new tui.Grid.applyTheme('default', {
        cell: {
            normal: {
                background: '#fff',
                border: '#E1E1E1',
                showVerticalBorder: true
            },
            header: {
                background: '#EFEFEF',
                border: '#E1E1E1'
            },
            rowHeader: {
                background: '#EFEFEF',
                border: '#E1E1E1'
            }
            ,
            evenRow: {
                background: '#F2F3F5',
                border: '#000'
            },
            oddRow: {
                background: '#FFF',
                border: '#000'
            }
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        const data = [
            {
                APLY_NO: 'EE2232',
                NM_KOR: '까이멍',
                APLY_STS_DIV: '접수중',
                APLY_DT: '2023-08-01 15:32'
            },
            {
                APLY_NO: 'FQ2232',
                NM_KOR: '가갑손',
                APLY_STS_DIV: '접수중',
                APLY_DT: '2023-07-12 15:32'
            },
            {
                APLY_NO: '3E2232',
                NM_KOR: '가갑순',
                APLY_STS_DIV: '접수중',
                APLY_DT: '2023-08-02 15:32'
            },
            {
                APLY_NO: 'EQZ2232',
                NM_KOR: '뭔갑손',
                APLY_STS_DIV: '접수중',
                APLY_DT: '2023-08-01 15:32'
            }
        ];
        const data2 = [
            {
                CORS_DIV: 'JAVA',
                SEL_NM: '자바과정 풀스택',
                NTH_NM: '3',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01 15:32',
                EDU_END_DT: '2023-08-01 15:32',
                발표일자: '2023-08-01 15:32',
                NOTE: '장사때려침'
            },
            {
                CORS_DIV: 'Python',
                SEL_NM: '파이썬',
                NTH_NM: '2',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01 15:32',
                EDU_END_DT: '2023-08-01 15:32',
                발표일자: '2023-08-01 15:32',
                NOTE: '장사때려침'
            },
            {
                CORS_DIV: 'C++',
                SEL_NM: 'C++ 코딩테스트',
                NTH_NM: '4',
                ENT_YR: '2023',
                TERM_DIV: '1',
                수업개월수: '6',
                EDU_ST_DT: '2023-08-01 15:32',
                EDU_END_DT: '2023-08-01 15:32',
                발표일자: '2023-08-01 15:32',
                NOTE: '장사때려침'
            }
        ];
        const data3 = [
            {
                gigwan: "블라블라대학",
                jeongong: "블라블라학과",
                iphak: "2023 / 08",
                joloep: "2023 / 09",
                joloepstatus: "제적"
            }
        ];
        const data4 = [
            {
                기관명: "블라블라기관",
                활동내역: "블라블라활동",
                비고: "놀았음",
                활동시작년월: "2020 / 12",
                활동종료년월: "2021 / 01"
            }
        ];
        const data5 = [
            {
                제출서류: "학위증명서",
                기관명: "2019년 09월 ~ 2023년 08월",
                첨부파일: "",
                파일관리: "",
                미리보기: ""
            },
            {
                제출서류: "기타",
                기관명: "",
                첨부파일: "",
                파일관리: "",
                미리보기: ""
            }
        ]

        function educationPeriodFormatter({row}) {
            const startDate = row.EDU_ST_DT;
            const endDate = row.EDU_END_DT;
            return startDate + "~" + endDate;
        }

        const peopleListGrid = new tui.Grid({
            el: document.getElementById('peopleListGrid'),
            data: data,
            rowHeaders: [
                {
                    type: 'rowNum',
                    renderer: {
                        type: RowNumberRenderer
                    }
                },
                {
                    type: 'checkbox'
                }
            ],
            scrollX: true,
            scrollY: true,
            columns: [
                {
                    header: '지원서번호',
                    name: 'APLY_NO',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '성명',
                    name: 'NM_KOR',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '상태',
                    name: 'APLY_STS_DIV',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '제출일시',
                    name: 'APLY_DT',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                }
            ],
            columnOptions: {
                resizable: true
            },
            draggable: true,
        });
        peopleListGrid.on('check', function (ev) {
            console.log('check', ev);
        });

        peopleListGrid.on('uncheck', function (ev) {
            console.log('uncheck', ev);
        });
        document.querySelector('#btn_grid2_excel_export').addEventListener('click',() => {
            peopleListGrid.export('xlsx');
        });
        const grid2 = new tui.Grid({
            el: document.getElementById('grid2'),
            data: data2,
            scrollX: true,
            scrollY: true,
            columns: [
                {
                    header: '과정구분',
                    name: 'CORS_DIV',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '과정명',
                    name: 'SEL_NM',
                    sortingType: 'asc',
                    sortable: true,
                    align: 'center'
                },
                {
                    header: '기수',
                    name: 'NTH_NM',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수강년도',
                    name: 'ENT_YR',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '분기',
                    name: 'TERM_DIV',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '수업개월수',
                    name: '수업개월수',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '교육기간',
                    sortingType: 'asc',
                    sortable: true, align: 'center',
                    formatter: educationPeriodFormatter
                },
                {
                    header: '발표일자',
                    name: '발표일자',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                },
                {
                    header: '비고',
                    name: 'NOTE',
                    sortingType: 'asc',
                    sortable: true, align: 'center'
                }
            ],
            columnOptions: {
                resizable: true
            },

            draggable: true,
            pagination: {
                page: 1,
                count: 10,
                useClient: true,
                useDefault: true
            }

        });
        grid2.on('check', function (ev) {
            console.log('check', ev);
        });

        grid2.on('uncheck', function (ev) {
            console.log('uncheck', ev);
        });
        grid2.on('drag', function (ev) {
            console.log('drag', ev);
        });

        document.querySelectorAll('#tabList > li > button').forEach((e, i) => {
            e.addEventListener('click', () => {
                tabContent(e);
            })
        })

        let tab2Grid, tab3Grid, tab5Grid;

        function tabContent(e) {
            //display 지우기
            const elements = document.querySelectorAll('#myTabContent > div');
            elements.forEach((a, i) => {
                console.log(a)
                a.style.display = 'none';
            })
            if (e.id === "btn_tab1") {
                elements[0].style.display = 'block';
            } else if (e.id === "btn_tab2") {
                if (!tab2Grid) {
                    const personData = [
                        {
                            gigwan: "블라블라대학",
                            jeongong: "블라블라학과",
                            iphak: "2023 / 08",
                            joloep: "2023 / 09",
                            joloepstatus: "제적"
                        }
                    ];
                    tab2Grid = new tui.Grid({
                        el: document.getElementById('tab2Grid'),
                        data: personData,
                        rowHeaders: ['checkbox'],
                        scrollX: false,
                        scrollY: false,
                        columns: [
                            {
                                header: '기관명',
                                name: 'gigwan'
                            },
                            {
                                header: '전공',
                                name: 'jeongong'
                            },
                            {
                                header: '입학년월',
                                name: 'iphak'
                            },
                            {
                                header: '졸업년월',
                                name: 'joloep'
                            },
                            {
                                header: '졸업상태',
                                name: 'joloepstatus'
                            }
                        ],
                        columnOptions: {
                            resizable: true
                        },

                        draggable: true,

                    });
                }
                elements[1].style.display = 'block';
            } else if (e.id === "btn_tab3") {
                if (!tab3Grid) {
                    const data3 = [
                        {
                            gigwan: "블라블라대학",
                            jeongong: "블라블라학과",
                            iphak: "2023 / 08",
                            joloep: "2023 / 09",
                            joloepstatus: "제적"
                        }
                    ];
                    tab3Grid = new tui.Grid({
                        el: document.getElementById('tab3Grid'),
                        data: data3,
                        rowHeaders: ['checkbox'],
                        pagination: true,
                        scrollX: true,
                        scrollY: true,
                        columns: [
                            {
                                header: '기관명',
                                name: 'gigwan'
                            },
                            {
                                header: '활동내역',
                                name: 'jeongong'
                            }
                        ],
                        columnOptions: {
                            resizable: true,
                        },

                        draggable: false,

                    });
                }
                elements[2].style.display = 'block';
            } else if (e.id === "btn_tab4") {
                elements[3].style.display = 'block';
            } else if (e.id === "btn_tab5") {
                if (!tab5Grid) {
                    const fileData = [
                        {
                            APLY_NO: 'E12341234',
                            NM_KOR: '홍길동',
                            EV_SCORE: '86.6',
                            PREL_ORD: '1',
                            RSLT_DIV: '1'
                        },
                        {
                            APLY_NO: 'E98769876',
                            NM_KOR: '이길동',
                            EV_SCORE: '50.4',
                            PREL_ORD: '2',
                            RSLT_DIV: '2'
                        }
                    ];
                    tab5Grid = new tui.Grid({
                        el: document.getElementById('tab5Grid'),
                        data: fileData,
                        rowHeaders: ['checkbox'],
                        pagination: true,
                        scrollX: true,
                        scrollY: true,
                        columns: [
                            {
                                header: '제출서류',
                                name: '제출서류',
                                sortingType: 'asc',
                                sortable: true,
                                align: 'center',
                                formatter: 'listItemText',
                                editor: {
                                    type: 'select',
                                    options: {
                                        listItems: [
                                            {text: '', value: '0'},
                                            {text: '학위증명서', value: '1'},
                                            {text: '활동이력증명', value: '2'},
                                            {text: '기타', value: '9'}
                                        ]
                                    }
                                }
                            },
                            {
                                header: '기관명',
                                name: '기관명',
                                sortingType: 'asc',
                                sortable: true,
                                align: 'center'
                            },
                            {
                                header: '첨부파일',
                                name: '첨부파일',
                                sortingType: 'asc',
                                sortable: true,
                                align: 'center'
                            },
                            {
                                header: '파일관리',
                                name: '파일관리',
                                sortingType: 'asc',
                                sortable: true,
                                align: 'center'
                            },
                            {
                                header: '미리보기',
                                name: '미리보기',
                                sortingType: 'asc',
                                sortable: true,
                                align: 'center'
                            }
                        ],
                        columnOptions: {
                            resizable: true,
                        },

                        draggable: false,

                    });
                }
                elements[4].style.display = 'block';
            }
        }
    });
</script>
<script>
    // 01. 폼 변수 정의 및 그리드 초기화 ----------------------------------------------------------- /
    const ls_pgmId = "CO0141P";

    // 팝업 제목
    const title = $(document).find("title").text();

    const ls_keyword = document.getElementById("keyword");		// 검색주소
    const ls_currentPage = document.getElementById("currentPage");

    let ls_total_cnt;
    let ls_page_no;
    let ls_line;
    let xml_to_json;

    let selectedItems;

    // 팝업 변수 선언
    let ls_CO0141P_address = "";


    // 02. 폼 로드 ----------------------------------------------------------------- /
    function fn_onload(ev) {
        // 팝업 제목 설정
        $('#title', parent.document).text(title);

        // 팝업 변수 받아오기
        gfn_popupSet();

        // 팝업 변수 설정
        if (_Parent) {

            ls_CO0141P_address = gfn_str(_Parent.CO0141P_address);
        }

        // 초기값 설정
        ls_keyword.value = !gfn_isNull(ls_CO0141P_address) ? ls_CO0141P_address : "";	// 주소

        var addrKeyword = gfn_str(ls_keyword.value)

        if (addrKeyword != "") {
            fn_getAddrList();
        }
    }

    // 05. 조회 함수 선언  -------------------------------------------------------- /
    // 검색버튼 클릭 이벤트
    function fn_btn_grid1_search_onclick(pageNum) {
        $("#currentPage").val(pageNum);
        fn_getAddrList();
    }

    ls_total_cnt = 0;
    ls_page_no = 0;
    ls_line = 0;

    // 주소목록조회
    function fn_getAddrList() {
        var addrKeyword = gfn_str(ls_keyword.value);
        if (addrKeyword == "") {
            return;
        }
        var currentPage = gfn_str(ls_currentPage.value);				// 요청 변수 설정 (현재 페이지. currentPage : n > 0)
        var countPerPage = "10";										// 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
        // var confmKey = "devU01TX0FVVEgyMDIzMDMxNjEzMjI0NjExMzYwMDE=";	// 요청 변수 설정 (승인키)(개발용)
        //var confmKey = "U01TX0FVVEgyMDIzMDMxNjEzMTQxMDExMzU5OTg=";		// 요청 변수 설정 (승인키)(운영용)
        var confmKey = "devU01TX0FVVEgyMDIzMDcwMzE3NTIxNDExMzg5NzQ=";	// 요청 변수 설정 (승인키)

        $.ajax({
            url: "https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do?confmKey=" + encodeURIComponent(confmKey)
                + "&currentPage=" + encodeURIComponent(currentPage)
                + "&countPerPage=" + encodeURIComponent(countPerPage)
                + "&keyword=" + encodeURIComponent(addrKeyword),
            type: "post",
            data: {},
            dataType: "jsonp",
            crossDomain: true,
            success: function (xmlStr) {
                if (navigator.appName.indexOf("Microsoft") > -1) {
                    var xmlData = new ActiveXObject("Microsoft.XMLDOM");
                    xmlData.loadXML(xmlStr.returnXml)
                } else {
                    var xmlData = xmlStr.returnXml;
                }
                $("#list").html("");
                var errCode = $(xmlData).find("errorCode").text();
                var errDesc = $(xmlData).find("errorMessage").text();
                var totalCount = $(xmlData).find("totalCount").text();
                var currentPage = $(xmlData).find("currentPage").text();

                if (parseInt(totalCount) > 9000) {
                    alert("검색 범위를 초과하였습니다.(" + totalCount + "건)\n검색어 예를 참조하여 검색하시기 바랍니다.");
                    fn_makePage(xmlStr);
                    return;
                }
                if (errCode != "0") {
                    alert(errCode + "=" + errDesc);
                } else {
                    if (xmlStr != null) {
                        fn_makeList(xmlData);
                    }
                }

            },
            error: function (xhr, status, error) {
                alert("검색에 실패하였습니다 \n 다시 검색하시기 바랍니다.");
            }
        });
    }

    // 10. 그리드 이벤트  --------------------------------------------------------- /
    // 결과 목록 생성
    function fn_makeList(xmlStr) {

        var ls_total_cnt = $(xmlStr).find('totalCount').text();
        var ls_list_div = document.getElementById('list');

        if (ls_total_cnt == '0') {
            $("#list *").remove();

            var ls_result_div = document.createElement('div');
            ls_result_div.classList.add('div_top_gap_10', 'div_side_gap_10');
            ls_result_div.innerText = '검색된 내용이 없습니다.';

            ls_list_div.append(ls_result_div);

        } else {
            $("#list *").remove();


            var ls_curr_page = parseInt($(xmlStr).find('currentPage').text());
            var ls_cnt_per_page = parseInt($(xmlStr).find('countPerPage').text());
            var ls_list_num = (ls_curr_page * ls_cnt_per_page) - (--ls_cnt_per_page);
            var num = 0;

            var ls_result_div = document.createElement('div');
            var ls_result_str = document.createElement('div');
            var ls_list_table = document.createElement('table');
            var ls_list_caption = document.createElement('caption');
            var ls_list_colgroup = document.createElement('colgroup');
            var ls_list_col1 = document.createElement('col');
            var ls_list_col2 = document.createElement('col');
            var ls_list_col3 = document.createElement('col');
            var ls_list_thead = document.createElement('thead');
            var ls_list_headtr = document.createElement('tr');
            var ls_list_headtd1 = document.createElement('th');
            var ls_list_headtd2 = document.createElement('th');
            var ls_list_headtd3 = document.createElement('th');
            var ls_list_tbody = document.createElement('tbody');

            ls_result_div.classList.add('div_top_gap_10', 'div_side_gap_10');

            ls_result_div.append(ls_result_str);
            ls_result_str.classList.add('div_top_gap_10');
            ls_result_str.innerText = '도로명주소 검색 결과 (' + $(xmlStr).find("totalCount").text() + '건)';

            ls_result_div.append(ls_list_table);

            ls_list_table.append(ls_list_caption);
            ls_list_table.append(ls_list_colgroup);
            ls_list_table.append(ls_list_thead);

            ls_list_caption.innerText = '검색 결과';

            ls_list_colgroup.append(ls_list_col1);
            ls_list_colgroup.append(ls_list_col2);
            ls_list_colgroup.append(ls_list_col3);
            ls_list_col1.setAttribute('style', 'width:8%');
            ls_list_col2.setAttribute('style', 'width:80%');
            ls_list_col3.setAttribute('style', 'width:12%');

            ls_list_thead.append(ls_list_headtd1);
            ls_list_thead.append(ls_list_headtd2);
            ls_list_thead.append(ls_list_headtd3);
            ls_list_headtd1.setAttribute('scope', 'col');
            ls_list_headtd2.setAttribute('scope', 'col');
            ls_list_headtd3.setAttribute('scope', 'col');
            ls_list_headtd1.innerText = 'No.';
            ls_list_headtd2.innerText = '도로명주소';
            ls_list_headtd3.innerText = '우편번호';

            ls_list_table.append(ls_list_tbody);

            $(xmlStr).find("juso").each(function () {

                num++;

                var ls_list_tbody_tr = document.createElement('tr');
                var ls_list_tbody_td1 = document.createElement('td');
                var ls_list_tbody_td2 = document.createElement('td');
                var ls_list_tbody_td2_1 = document.createElement('div');
                var ls_list_tbody_td2_2 = document.createElement('span');
                var ls_list_tbody_td3 = document.createElement('td');
                var ls_list_hidden_item01 = document.createElement('input');
                var ls_list_hidden_item02 = document.createElement('input');
                var ls_list_hidden_item03 = document.createElement('input');
                var ls_list_hidden_item04 = document.createElement('input');
                var ls_list_hidden_item05 = document.createElement('input');
                var ls_list_hidden_item06 = document.createElement('input');
                var ls_list_hidden_item07 = document.createElement('input');
                var ls_list_hidden_item08 = document.createElement('input');
                var ls_list_hidden_item09 = document.createElement('input');
                var ls_list_hidden_item10 = document.createElement('input');
                var ls_list_hidden_item11 = document.createElement('input');
                var ls_list_hidden_item12 = document.createElement('input');
                var ls_list_hidden_item13 = document.createElement('input');
                var ls_list_hidden_item14 = document.createElement('input');
                var ls_list_hidden_item15 = document.createElement('input');
                var ls_list_hidden_item16 = document.createElement('input');
                var ls_list_hidden_item17 = document.createElement('input');
                var ls_list_hidden_item18 = document.createElement('input');
                var ls_list_hidden_item19 = document.createElement('input');
                var ls_list_hidden_item20 = document.createElement('input');
                var ls_list_hidden_item21 = document.createElement('input');
                var ls_list_hidden_item22 = document.createElement('input');
                var ls_list_hidden_item23 = document.createElement('input');
                var ls_list_hidden_item24 = document.createElement('input');

                ls_list_tbody_tr.setAttribute('id', 'rowNum' + num);
                ls_list_tbody_tr.setAttribute('onclick', 'fn_select_row(' + num + ')');
            });
        }
    }

</script>
</body>
</html>