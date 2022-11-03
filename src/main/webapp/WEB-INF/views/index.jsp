<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오전 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index.jsp</title>
<%--    <script src="/resources/js/jqurey.js"></script>--%>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #a{
            margin-top: 50px;
            text-align: center;
        }
    </style>

</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<%--<a href="/save">글작성하기</a>--%>
<%--<a href="/find">글목록</a> <br>--%>
<div class="container" id="a">
    <a href="paging">페이징목록</a>
    <a href="paging?page=3">페이징목록</a>
<button class="btn btn-primary" onclick="fun1()">글작성하기</button>

<button class="btn btn-primary" onclick="fun2()">글목록조회</button>
<br>
</div>

</body>
<script>

    const fun1 = () =>{
        location.href="/save"
    }
    const fun2 = () => {
        location.href="/find"
    }

</script>
</html>
