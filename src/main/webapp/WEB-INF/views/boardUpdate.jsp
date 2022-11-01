<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/update" method="post">
   id: <input type="text" value="${bd.id}" name="id" readonly> <br>
   작성자: <input type="text" value="${bd.boardWriter}" readonly> <br>
   비밀번호: <input type="text" value="${bd.boardPass}" readonly> <br>
   제목: <input type="text" value="${bd.boardTitle}" name="boardTitle"> <br>
   내용: <input type="text" value="${bd.boardContents}" name="boardContents"> <br>
    <input type="submit" value="수정완료">

</form>

</body>
</html>
