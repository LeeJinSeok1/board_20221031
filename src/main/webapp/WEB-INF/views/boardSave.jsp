<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave.jsp</title>
</head>
<body>

 <form action="/save" method="post">
 작성자: <input type="text" name="boardWriter"> <br>
 글비밀번호: <input type="text" name="boardPass"> <br>
 제목: <input type="text" name="boardTitle"> <br>
 내용: <input type="text" name="boardContents"> <br>
     <input type="submit" value="작성완료">
 </form>

</body>
</html>
