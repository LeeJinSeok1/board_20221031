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

            <th>작성자</th>
            <th>제목</th>
            <th>내용</th>
            <th>날짜</th>
            <th>조회수</th>
            <%--        <th>글수정</th>--%>
            <%--        <th>글삭제</th>--%>
        </tr>

        <c:forEach items="${boardList}" var="bd">
            <tr>

                <td>${bd.boardWriter}</td>
                <td><a href="/detail?id=${bd.id}" >${bd.boardTitle}</a></td>
                <td>${bd.boardContents}</td>
                <td>${bd.boardTime}</td>
                <td>${bd.boardHits}</td>
                    <%--            <td><a href="/update?id=${bd.id}" class="btn btn-warning">수정하기</a></td>--%>
                    <%--            <td><a href="/delete?id=${bd.id}" class="btn btn-danger">삭제하기</a></td>--%>
            </tr>
        </c:forEach>
    </table>

</div>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <%--  for(int i=startPage; i<=endPage; i++)      --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>

                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

</body>
<script>



</script>
</html>