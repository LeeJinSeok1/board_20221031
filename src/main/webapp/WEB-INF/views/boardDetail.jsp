<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardDetail.jsp</title>
 <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
 <h2>id: ${bd.id}</h2> <br>
 <h2>작성자: ${bd.boardWriter}</h2> <br>
 <h2>비밀번호: ${bd.boardPass}</h2> <br>
 <h2>제목: ${bd.boardTitle}</h2> <br>
 <h2>내용: ${bd.boardContents}</h2> <br>
 <h2>조회수: ${bd.boardHits}</h2> <br>

<button class="btn btn-primary" onclick="fun4()">목록</button>
<
</body>
<script>
 const fun4 = () => {
  location.href="/DetailPage"
 }
</script>
</html>
