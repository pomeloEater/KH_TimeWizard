DROP TABLE CHAT;
DROP SEQUENCE CHAT_SEQ;

CREATE SEQUENCE CHAT_SEQ;
CREATE TABLE CHAT( -- STREAMING과 맞추는 것이 나을 것 같음 CHAT/STRAM OR CHATTING/STREAMING
	CHAT_NO NUMBER,
	GROUP_NO NUMBER NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	CHAT_CONTENT VARCHAR2(4000) NOT NULL
	--CONSTRAINT CHAT_GN_FK FOREIGN KEY(GROUP_NO) REFERENCES GROUP_INFO(GROUP_NO),
	--CONSTRAINT CHAT_UI_FK FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
);

INSERT INTO CHAT VALUES(CHAT_SEQ.NEXTVAL, 2, 'DDD', 'DDD');
SELECT * FROM CHAT

DROP TABLE TEST;
DROP SEQUENCE TEST_SEQ;

CREATE SEQUENCE TEST_SEQ;
CREATE TABLE TEST( -- STREAMING과 맞추는 것이 나을 것 같음 CHAT/STRAM OR CHATTING/STREAMING
	ROOMID NUMBER NOT NULL,
	NAME VARCHAR2(500) NOT NULL
);
INSERT INTO TEST VALUES(TEST_SEQ.NEXTVAL, 'ㅇㅇㅇ');

SELECT * FROM TEST
