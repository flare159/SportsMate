<%@ page import="com.example.main.UserDTO" %>
<%@ page import="com.example.main.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<%
  UserDTO user = (UserDTO) request.getAttribute("user");
  session.setAttribute("userId", user.getUserid());
  session.setAttribute("userPic", user.getUserpic());
  String profilepic = (String)session.getAttribute("userpic");

%>

<html>
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>

  <link rel="stylesheet" href="../resources/static/css/MyPage.css">
</head>

<body>
<div class="Mypage">
  <div class="mypagedata" style="text-align: center">
    <form action="UpdateUser.jsp" method="post">
      <div class="mypage-container">
        <div class="mypage-form">

          <h1 style="line-height: 60px;">마 이 페 이 지</h1>

          <div>
            <!-- 프로필 사진 표시 -->
            <%
              String userId = (String)session.getAttribute("userId");
              String userpic = (String)session.getAttribute("userPic"); // DB에서 가져온 프로필 사진 경로
              System.out.println(profilepic);


              if (userpic != null) {
            %>
            <img src="<%= request.getContextPath() + "../uploads/"+userId+"propic.jpg"  %>" alt="프로필 사진" style="width: 200px; text-align: center" />
            <%
            } else {
            %>
            <img src="<%= request.getContextPath() + "../resources/img/profile.png" %>" alt="기본 프로필 사진" width="150" height="150" />
            <%
              }
            %>
          </div>

          <form action="UpdateUser.jsp" method="post">
            <div class="form-group">
              <label>회원님의 ID</label> <input type="text" name="USERID" value="<%= user.getUserid() %>" readonly>
              <br><br>
              <label>변경할 비밀번호</label> <input type="password" name="USERPWD" value="<%= user.getUserpwd() %>">
              <br><br>
              <label>변경할 닉네임</label> <input type="text" name="USERNAME" placeholder="<%= user.getUsername() %>">
              <br><br>
              <button type="submit" class="edit_btn">수정완료</button>
              <button type="button" class="edit_btn" onclick="history.back()">돌아가기</button>

            </div>

            </form>
              <h2>프로필 사진 변경 </h2>
              <form action="../MyPageContent.do" method="post" enctype="multipart/form-data">
                <input type="file" class="upload_btn" name="USERPIC" />
                <input type="submit" class="upload_btn" value="변경완료" />
              </form>

          <form action="${pageContext.request.contextPath}/DeleteUserServlet" method="post">
            <input type="hidden" name="userId" value="${sessionScope.user.userId}">
            <button type="submit" onclick="return confirm('정말로 탈퇴하시겠습니까?')">회원 탈퇴</button>
          </form>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>

