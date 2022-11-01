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
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #writer{
            margin-top: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="writer">
 <form action="/save" method="post">
 작성자 <input type="text" name="boardWriter" class="form-control"> <br>
 글비밀번호 <input type="text" name="boardPass" class="form-control"> <br>
 제목 <input type="text" name="boardTitle" class="form-control"> <br>
 내용<textarea name="boardContents" cols="30" rows="10" class="form-control"></textarea> <br>
     <input type="submit" value="작성완료" class="btn btn-success">
 </form>
</div>
</body>
</html>
