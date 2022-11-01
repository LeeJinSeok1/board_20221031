<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jqurey.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #List{
            width: 1000px;
            margin-top: 50px;
        }
    </style>


</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="List">
<table class="table table-striped table-hover text-center">
    <tr>
        <th>id</th>
        <th>작성자</th>
        <th>제목</th>
        <th>내용</th>
        <th>날짜</th>
        <th>조회수</th>
        <th>글수정</th>
        <th>글삭제</th>
    </tr>

    <c:forEach items="${model}" var="bd">
        <tr>
            <td>${bd.id}</td>
            <td>${bd.boardWriter}</td>
            <td><a href="/detail?id=${bd.id}" >${bd.boardTitle}</a></td>
            <td>${bd.boardContents}</td>
            <td>${bd.boardTime}</td>
            <td>${bd.boardHits}</td>
            <td><a href="/update?id=${bd.id}" class="btn btn-warning">수정하기</a></td>
            <td><a href="/delete?id=${bd.id}" class="btn btn-danger">삭제하기</a></td>
        </tr>
    </c:forEach>
</table>
    <a href="index">돌아가기</a>
</div>


</body>
<script>



</script>
</html>
