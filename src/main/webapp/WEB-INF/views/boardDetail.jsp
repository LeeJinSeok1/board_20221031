<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>boardDetail.jsp</title>
 <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
 <script src="/resources/js/jqurey.js"></script>

 <style>

 </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>



  <h2> 작성자: ${bd.boardWriter} </h2> <br>
  <h2> 제목: ${bd.boardTitle} </h2> <br>
  <h2> 내용: ${bd.boardContents} </h2> <br>
<%--  <h2> 파일:   <img src="${pageContext.request.contextPath}/upload/${bd.storedFileName}"--%>
<%--                  alt="" width="100" height="100"> </h2><br>--%>
  <h2> 조회수: ${bd.boardHits} </h2> <br>



<button class="btn btn-primary" onclick="fun4()">목록</button>
<button class="btn btn-warning" onclick="fun5()">수정</button>
<button class="btn btn-danger" onclick="fun6(${bd.id})">삭제</button>
<%--<td><a href="/update?id=${bd.id}" class="btn btn-warning">수정하기</a></td>--%>
<%--<td><a href="/delete?id=${bd.id}" class="btn btn-danger">삭제하기</a></td>--%>

</body>
<script>
 const fun4 = () => {
  location.href="/DetailPage"
 }
 const fun5 = () => {
  const id ='${bd.id}'
  location.href="/update?id="+id;
 }
 const fun6 = (id) => {
  location.href="/delete?id="+id;
 }
</script>
</html>
