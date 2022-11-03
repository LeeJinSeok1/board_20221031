<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-01
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jqurey.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.rtl.min.css">
</head>
<body>

<%--<form action="/del2" method="get" name="formDel">--%>
    <input type="text" name="boardPass" placeholder="비밀번호 확인" id="pp">
    <button onclick="fun7()" class="btn btn-danger">체크</button>
<%--</form>--%>

</body>
<script>
    const fun7 = () => {
        const id = "${model.id}"
        const pass = "${model.boardPass}";
        const ckPass = document.getElementById("pp").value;
        if(pass !=ckPass){
            alert("비밀번호가 틀렸습니다.")
        }else{
            location.href="/del2?id="+${model.id}
        }

    }

</script>
</html>
