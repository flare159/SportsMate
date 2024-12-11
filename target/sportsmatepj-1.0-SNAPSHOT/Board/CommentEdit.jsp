<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>댓글 수정</title>
</head>
<body>
<h2>댓글 수정</h2>
<form action="${pageContext.request.contextPath}/mvcboard/CommentEdit.do" method="post">
    <input type="hidden" name="id" value="${comment.id}" />
    <input type="hidden" name="postnum" value="${postnum}" />
    <div>
        <label for="commentContent">댓글 내용:</label>
        <textarea id="commentContent" name="content" rows="4" cols="50" required>${comment.content}</textarea>
    </div>
    <button type="submit">댓글 수정</button>
</form>
<a href="${pageContext.request.contextPath}/mvcboard/ProjectView.do?num=${postnum}">돌아가기</a>
</body>
</html>
