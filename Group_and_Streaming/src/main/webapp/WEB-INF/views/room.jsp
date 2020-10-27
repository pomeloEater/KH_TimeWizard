<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅 서비스</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>


</head>
<body>
<input id="rid" type="hidden" value="${room.roomid}">
<input type="text" id="nickname" class="form-inline" placeholder="닉네임을 입력해주세요" required autofocus>
<button class="btn btn-primary" id="name">확인</button>
<br>

<label id="roomName" class="form-inline">${room.name }</label>

<div id="chatroom" style="width:400px; height: 600px; border:1px solid; background-color : gray">
</div>

<input type="text" id="message" style="height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
<button class = "btn btn-primary" id="send">전송</button>
<script>

</script>
</body>
<script type="text/javascript">
    var webSocket;
    var nickname;
    var rid = document.getElementById("rid").value;
    document.getElementById("name").addEventListener("click",function(){
        nickname = document.getElementById("nickname").value;
        document.getElementById("nickname").style.display = "none";
        document.getElementById("name").style.display = "none";
        connect();
    })
    document.getElementById("send").addEventListener("click",function(){
        send();
    })
    function connect(){
        webSocket = new SockJS("/timewizard/webserver");
        webSocket.onopen = onOpen;
        webSocket.onclose = onClose;
        webSocket.onmessage = onMessage;
    }
    function disconnect(){
        webSocket.send(JSON.stringify({roomid :rid, type:'LEAVE', writer:nickname}));
        webSocket.close();
    }
    function send(){
        msg = document.getElementById("message").value;
        webSocket.send(JSON.stringify({roomid :rid, type:'CHAT', writer:nickname, message : msg}));
        document.getElementById("message").value = "";
    }
    function onOpen(){
        webSocket.send(JSON.stringify({roomid :rid, type:'ENTER', writer:nickname}));
    }
    function onMessage(e){
        data = e.data;
        chatroom = document.getElementById("chatroom");
        chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
    }
    function onClose(){
        disconnect();
    }

</script>
</html>