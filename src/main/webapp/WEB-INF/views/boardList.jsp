<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jqurey.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">


</head>
<body>
<table class="table table-striped">
    <tr>
        <th>id</th>
        <th>작성자</th>
        <th>비밀번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>조회수</th>
        <th>글수정</th>
        <th>글삭제</th>
    </tr>

    <c:forEach items="${model}" var="bd">
        <tr>
            <td>${bd.id}</td>
            <td>${bd.boardWriter}</td>
            <td>${bd.boardPass}</td>
            <td><a href="/detail?id=${bd.id}" onclick="fun(${bd.id})">${bd.boardTitle}</a></td>
            <td>${bd.boardContents}</td>
            <td>${bd.boardHits}</td>
            <td><a href="/update?id=${bd.id}">수정하기</a></td>
            <td><a href="/delete?id=${bd.id}">삭제하기</a></td>
        </tr>
    </c:forEach>
</table>

<a href="index">돌아가기</a>

</body>
<script>
    const fun = (id) => {
        location.href="/hits?id="+id;
    }

</script>
</html>
