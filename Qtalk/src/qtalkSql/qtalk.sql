CREATE DATABASE qtalk;

-- 시험정보 (대중소 분류) table (정부  API)

CREATE TABLE examinfo (
	qualgbcd  VARCHAR(1) , -- 자격구분 ,T:기술자격, S:전문자격
	qualgbnm VARCHAR(50) , -- 자격구분명 국가기술자격
	seriescd VARCHAR(30), -- 계열코드 01
	seriesnm VARCHAR(30), -- 계열명 기술사
	jmcd VARCHAR(4), -- 종목코드
	jmfldnm VARCHAR(200) NOT NULL, -- 종목명
	obligfldcd VARCHAR(2), -- 대직무분야코드
	obligfldnm VARCHAR(200), -- 대직무분야명
	mdobligfldcd VARCHAR(3), -- 중직무분야코드
	mdobligfldnm VARCHAR(200) -- 중직무분야명
);

-- 시험날짜 table (정부  API)

CREATE TABLE examschedule(
	jmfldnm VARCHAR(100) NOT NULL UNIQUE, -- 종목명
	implplannm VARCHAR(200) UNIQUE, -- 회차
	docregstartdt DATE, -- 필기원서접수시작일자
	docregenddt DATE, -- 필기원서접수종료일자
	docexamstartdt DATE, -- 필기시험시작일정
	docexamenddt DATE, -- 필기시험종료일자
	docpassdt DATE, -- 필기시험 합격(예정)자 발표
	docsubmitstartdt DATE, -- 응시자격서류제출시작일자
	docsubmitenddt DATE, -- 응시자격 서류제출종료일자
	pracregstartdt DATE,  -- 실기시험원서접수시작일자
	pracregenddt DATE, -- 실기시험원서접수종료일자
	pracexamstartdt DATE, -- 실기시험시작일자
	pracexamenddt DATE, -- 실기시험종료일자
	pracpassstartdt DATE, -- 합격자발표시작일자
	pracpassenddt DATE, -- 합격자발표종료일자
	obligfldcd VARCHAR(2), -- 대직무분야코드
	obligfldnm VARCHAR(200), -- 대직무분야명
	mdobligfldcd VARCHAR(3), -- 중직무분야코드
	mdobligfldnm VARCHAR(200) -- 중직무분야명
);

-- SELECT * FROM examinfo ei JOIN examschedule es USING(jmfldnm);

-- 멤버(회원가입) table

CREATE TABLE MEMBER( 
	id VARCHAR(100) PRIMARY KEY,
	nickname VARCHAR(100),
	PASSWORD VARCHAR(100),
	email VARCHAR(100),
	address VARCHAR(100)
);

-- 자유게시판 table

CREATE TABLE freeboard(
	num INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(200),
	content VARCHAR(3000),
	writedate DATE, -- jsp 에는 없는 데 필요한거같아서 넣었어요
	commcount INT DEFAULT 0, -- 댓글수
	fileurl VARCHAR(255),
	writer VARCHAR(100) REFERENCES member(id),
	viewcount INT DEFAULT 0,
	commentcount INT  DEFAULT 0
);

-- 자유게시판 댓글

CREATE TABLE IF NOT EXISTS freeboard_comment (
	comment_num INT AUTO_INCREMENT PRIMARY KEY, -- 댓글 번호?
	post_num INT REFERENCES freeboard(num),
	writer VARCHAR(100) REFERENCES member(id),
	content VARCHAR(3000),
	comment_date DATE
);

-- 시험게시판 table

CREATE TABLE testboard (
	num INT AUTO_INCREMENT PRIMARY KEY,
	subject VARCHAR(200) REFERENCES examschedule(jmfldnm), -- 종목명
	round VARCHAR(200) REFERENCES examschedule(implplannm), -- 회차
	title VARCHAR(200),
	content VARCHAR(3000),
	writedate DATE,
	fileurl VARCHAR(255),
	writer VARCHAR(50) REFERENCES member(id),
	viewcount INT DEFAULT 0,
	commentcount INT  DEFAULT 0
);

-- 시험 문제 공유 게시판 덧글

CREATE TABLE IF NOT EXISTS testboard_comment (
	comment_num INT  AUTO_INCREMENT PRIMARY KEY, -- 댓글 번호?
	post_num INT REFERENCES testboard(num),
	writer VARCHAR(100) REFERENCES member(id),
	content VARCHAR(3000),
	comment_date DATE
);

-- 한줄게시판 table

CREATE TABLE onelineboard (
	num int AUTO_INCREMENT PRIMARY KEY,
	subject VARCHAR(200),
	content VARCHAR(1000),
	LEVEL VARCHAR(5),
	writer VARCHAR(100) REFERENCES member(id),
	writedate DATE
);