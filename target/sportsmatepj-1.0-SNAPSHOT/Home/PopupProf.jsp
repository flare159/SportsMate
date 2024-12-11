<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        .profile { margin: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
<div class="profile">
    <h2>User Profile</h2>
    <p>Username: <c:out value="${user.username}" /></p>
    <p>Score: <c:out value="${user.userpt}" /></p>

    <h3>Recent Posts:</h3>
    <table>
        <thead>
        <tr>
            <th>Title</th>
            <th>User ID</th>
            <th>Post Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="post" items="${userPosts}">
            <tr>
                <td><c:out value="${post.title}" /></td>
                <td><c:out value="${post.username}" /></td>
                <td><c:out value="${post.postdate}" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="javascript:history.back()">Close</a>
</div>
</body>
</html>