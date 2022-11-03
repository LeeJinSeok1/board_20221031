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
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
    <style>
        #b{
            margin-top: 50px;
            width: 1000px;
        }
    </style>
</head>
<body>
<jsp:include page="layout/header.jsp" flush="false"></jsp:include>
<div class="container" id="b">
<form action="/update2" method="post" name="formUp">
    <input type="hidden" value="${bd.id}" name="id" readonly class="form-control"> <br>
   작성자 <input type="text" value="${bd.boardWriter}" readonly class="form-control"> <br>
   비밀번호 <input type="text" name="boardPass" class="form-control" id="aa"> <br>
   제목 <input type="text" value="${bd.boardTitle}" name="boardTitle" class="form-control"> <br>
   내용 <textarea name="boardContents" cols="30" rows="10" class="form-control">${bd.boardContents}</textarea> <br>
</form>
    <button onclick="fun8()" class="btn btn-success">확인</button>
</div>

</body>
<script>
    const fun8 =  () => {
        const pass = "${bd.boardPass}"
        const ckPass = document.getElementById("aa").value
        const form = document.getElementsByName("formUp")
        if (pass == ckPass) {
            document.formUp.submit()
        } else {
            alert("비밀번호가 틀렸습니다.")

        }
    }

</script>
</html>
