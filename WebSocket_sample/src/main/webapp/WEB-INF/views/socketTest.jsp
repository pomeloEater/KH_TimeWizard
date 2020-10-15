<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<h1>웹소켓 채팅 샘플</h1>
<body>
<!-- onkeyup: 키가 눌렀을때 나오는 이벤트(해당 태그를 선택한 상태여야함) -->
	<input type="text" id="message" onkeyup="enterkey()"/>
	<input type="button" id="sendBtn" value="submit"/>
	<div id="messageArea"></div>
</body>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	let sock = new SockJS("http://localhost:8787/web/echo/"); 
	//아이피 부분을 자기 아이피로 바꾸거나 localhost로 지정해야함
	
	// sock의 이벤트 = 뒤에 지정한 함수
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
		$('#message').val('')
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
	function enterkey() {
		//keyCode: 입력한 코드(13번이 enter)
        if (window.event.keyCode == 13) {
        	sendMessage();
        }
    }
</script>
</html>