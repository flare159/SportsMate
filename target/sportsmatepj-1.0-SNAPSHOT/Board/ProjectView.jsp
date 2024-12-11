<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파일 첨부형 게시판</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 2rem auto;
            padding: 2rem;
            background: #1e1e1e;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: white;
            margin-bottom: 1rem;
        }

        /* 테이블 스타일 */
        .info-table, .details-table {
            width: 100%;
            border-collapse: collapse;
            background: #2c2c2c; /* 테이블 배경색 */
            border-radius: 10px; /* 테이블 모서리 둥글게 */
            overflow: hidden; /* 둥글게 처리된 모서리 내에 테이블 내용이 넘치지 않도록 설정 */
            margin-bottom: 1rem;
        }

        .info-table th, .details-table th,
        .info-table td, .details-table td {
            padding: 15px;
            text-align: left;
            border: 3px solid #333;
        }

        .info-table th, .details-table th {
            background-color: #007bff;
            color: #fff;
        }

        .info-table td, .details-table td {
            color: #e0e0e0;
        }

        .info-table td a:hover, .details-table td a:hover {
            text-decoration: underline;
        }

        .thumbnail {
            max-width: 400px;
            border-radius: 5px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0; /* 위쪽과 아래쪽 여백 추가 */
        }

        .edit-button, .delete-button, .list-button, .submit-button {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            color: #000; /* 버튼 글자색을 검정색으로 설정 */
            margin: 5px;
            background-color: #fff; /* 버튼 배경색을 하얀색으로 설정 */
            border: none; /* 버튼 테두리 제거 */
            display: inline-block; /* 버튼을 인라인 블록으로 설정하여 수평 정렬 */
        }

        .edit-button:hover, .delete-button:hover, .list-button:hover, .submit-button:hover {
            background-color: #f0f0f0; /* 호버 시 배경색을 연한 회색으로 변경 */
            color: #000; /* 호버 시 글자색을 검정색으로 설정 */
        }

        /* 댓글 섹션 스타일 */
        .comment-section {
            width: 60%;
            margin: 2rem auto;
            padding: 2rem;
            background: #1e1e1e;
            border-radius: 10px;
        }

        .comment-section h3 {
            color: #fff;
            margin-bottom: 1rem;
        }

        .comment-section textarea {

        }
        
        .comment-list {
            list-style: none;
            padding: 0;
        }

        .comment-list li {
            padding: 10px;
            border-bottom: 1px solid #333;
            position: relative; /* 댓글 수정/삭제 버튼 위치 조정을 위해 사용 */
        }

        .comment-list p {
            margin: 0;
        }

        .comment-list strong {
            color: #007bff;
        }

        .reply-form {
            display: flex; /* 입력 폼과 버튼을 가로로 배치 */
            gap: 10px; /* 입력 폼과 버튼 사이의 간격 */
            align-items: center; /* 수직 정렬 */
            width: 100%; /* 전체 너비 사용 */
        }



        .reply-form textarea {
            flex: 1; /* 입력 칸이 남은 공간을 차지하도록 설정 */
            padding: 10px;
            border-radius: 20px; /* 둥글게 처리 */
            border: 1px solid #333;
            background-color: rgba(0, 0, 0, 0.8); /* 불투명한 검은색 배경 */
            color: #e0e0e0;
            resize: none; /* 크기 조절 비활성화 */
            box-sizing: border-box; /* 패딩 포함 전체 너비 조정 */
            font-size: 1rem; /* 글자 크기 조정 */
        }

        .reply-form button {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: #fff;
            color: #000;
            cursor: pointer;
            font-size: 1rem;
        }

        .reply-form button:hover {
            background-color: #f0f0f0;
            color: #000;
        }

        .comment-list li .button-group {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            gap: 5px; /* 버튼 사이의 간격 */
        }

        .comment-list li .button-group a {
            font-size: 0.8rem; /* 버튼 크기 조정 */
            padding: 5px;
            color: #007bff;
        }

        .comment-list li .button-group a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Find your mate</h2>

    <!-- 게시글 정보 테이블 -->
    <table class="info-table">
        <colgroup>
            <col width="15%" />
            <col width="35%" />
            <col width="15%" />
            <col width="*" />
        </colgroup>
        <tr>
            <td style="text-align: center"><b>번호</b></td>
            <td>${dto.num}</td>
            <td style="text-align: center"><b>작성자</b></td>
            <td>${dto.username}</td>
        </tr>
        <tr>
            <td style="text-align: center"><b>작성일</b></td>
            <td>${dto.postdate}</td>
            <td style="text-align: center"><b>조회수</b></td>
            <td>${dto.visitcount}</td>
        </tr>
    </table>

    <!-- 게시글 상세 내용 테이블 -->
    <table class="details-table">
        <colgroup>
            <col width="20%" />
            <col width="80%" />
        </colgroup>
        <tr>
            <td><b>제목</b></td>
            <td>${dto.title}</td>
        </tr>
        <tr>
            <td><b>모집일</b></td>
            <td>${dto.dates}</td>
        </tr>
        <tr>
            <td><b>종목</b></td>
            <td>${dto.sport}</td>
        </tr>
        <tr>
            <td><b>모집 인원</b></td>
            <td>${dto.people}</td>
        </tr>
        <tr>
            <td><b>내용</b></td>
            <td class="content">${dto.detail}</td>
        </tr>
        <tr>
            <td style="text-align: center"><b>사진</b></td>
            <td class="thumbnail-cell">
                <c:if test="${not empty dto.ofile and isImage == true}">
                    <img src="${pageContext.request.contextPath}/resources/img/${dto.sfile}" class="thumbnail" />
                </c:if>
            </td>
        </tr>
    </table>

        <!-- 하단 메뉴(버튼) -->
        <tr>
            <td colspan="2" class="button-group">
                <c:choose>
                    <c:when test="${sessionScope.userid != null}">
                        <c:if test="${sessionScope.role == 'admin'}">
                            <!-- 관리자일 경우: 삭제하기 버튼만 표시 -->
                            <button type="button" class="delete-button" onclick="location.href='${pageContext.request.contextPath}/Board/ProjectDeleteProcess.jsp?num=${param.num}';">
                                삭제하기
                            </button>
                        </c:if>
                        <c:if test="${sessionScope.userid == dto.userid}">
                            <!-- 게시글 작성자일 경우: 수정하기와 삭제하기 버튼 표시 -->
                            <button type="button" class="edit-button" onclick="location.href='${pageContext.request.contextPath}/mvcboard/ProjectEdit.do?num=${param.num}';">
                                수정하기
                            </button>
                            <button type="button" class="delete-button" onclick="location.href='${pageContext.request.contextPath}/Board/ProjectDeleteProcess.jsp?num=${param.num}';">
                                삭제하기
                            </button>
                        </c:if>
                    </c:when>
                </c:choose>
                <button type="button" class="list-button" onclick="location.href='${pageContext.request.contextPath}/mvcboard/MainHome.do';">
                    목록 바로가기
                </button>
            </td>
        </tr>
    </table>
</div>

<!-- 댓글 입력 폼 -->
<div class="comment-section">
    <h3>댓글 작성</h3>
    <c:choose>
        <c:when test="${sessionScope.userid != null}">
            <form action="${pageContext.request.contextPath}/mvcboard/CommentAdd.do" method="post">
                <input type="hidden" name="postnum" value="${dto.num}" />
                <input type="hidden" name="parent_id" value="" /> <!-- 기본값 빈 문자열 -->
                <div>
                    <textarea id="commentContent" name="content" rows="2" cols="50" required></textarea>
                </div>
                <button type="submit" class="submit-button">댓글 작성</button>
            </form>
        </c:when>
        <c:otherwise>
            <p>댓글을 작성하려면 <a href="${pageContext.request.contextPath}/Home/Login.jsp">로그인</a>하세요.</p>
        </c:otherwise>
    </c:choose>
</div>

<!-- 댓글 목록 -->
<div class="comment-section">
    <h3>댓글 목록</h3>
    <c:if test="${not empty comments}">
        <ul class="comment-list">
            <c:forEach items="${comments}" var="comment">
                <li>
                    <p><strong>${comment.username}</strong>: ${comment.content}</p>
                    <p><small>${comment.postdate}</small></p>

                    <!-- 댓글 작성자가 본인의 댓글일 경우만 수정 및 삭제 버튼 표시 -->
                    <c:if test="${sessionScope.username == comment.username}">
                        <a href="${pageContext.request.contextPath}/mvcboard/CommentEdit.do?id=${comment.id}&postnum=${dto.num}" class="edit-button">수정</a>
                        <a href="${pageContext.request.contextPath}/mvcboard/CommentDelete.do?id=${comment.id}&postnum=${dto.num}" class="delete-button" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </c:if>

                    <!-- 대댓글 목록 -->
                    <c:if test="${not empty comment.replies}">
                        <ul class="comment-reply-list">
                            <c:forEach items="${comment.replies}" var="reply">
                                <li>
                                    <p><strong>${reply.username}</strong>: ${reply.content}</p>
                                    <p><small>${reply.postdate}</small></p>
                                    <!-- 대댓글 작성자가 본인의 대댓글일 경우만 수정 및 삭제 버튼 표시 -->
                                    <c:if test="${sessionScope.username == reply.username}">
                                        <a href="${pageContext.request.contextPath}/mvcboard/CommentEdit.do?id=${reply.id}&postnum=${dto.num}" class="edit-button">수정</a>
                                        <a href="${pageContext.request.contextPath}/mvcboard/CommentDelete.do?id=${reply.id}&postnum=${dto.num}" class="delete-button" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>

                    <!-- 대댓글 작성 폼 -->
                    <c:if test="${sessionScope.userid != null}">
                        <div class="reply-form">
                            <form action="${pageContext.request.contextPath}/mvcboard/CommentAdd.do" method="post">
                                <input type="hidden" name="postnum" value="${dto.num}" />
                                <input type="hidden" name="parent_id" value="${comment.id}" />
                                <div>
                                    <label for="replyContent">대댓글 내용:</label>
                                    <textarea id="replyContent" name="content" rows="2" cols="50" required></textarea>
                                </div>
                                <button type="submit" class="submit-button">대댓글 작성</button>
                            </form>
                        </div>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty comments}">
        <p>댓글이 없습니다.</p>
    </c:if>
</div>
</body>
</html>
