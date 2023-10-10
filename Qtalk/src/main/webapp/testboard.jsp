<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
        @font-face {
            font-family: 'Pretendard-Regular'; 
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff'); 
            font-weight: 400; 
            font-style: normal; 
        }
        *{
            font-family: 'Pretendard-Regular';
        }
        .header{
            height: 100px;
        }
        a{
            text-decoration: none;
            color: black;
        }
        .board-title{
            font-weight: bold;
            text-align: center;
            padding: 10px;
            width: 60%;
            margin: 10px auto;
        }

        .search{ 
        	height: 30px;
            margin-left: 10px;
            margin-right: 10px;
            border: 1px ;
            border-radius: 10px;
            background-color: #D6E6FF;
            padding: 10px;
            color : rgb(116, 111, 111);
            font-family: 'Pretendard-Regular'; 
        }
        #search{
            width:95%;
            min-width: 60%;
            margin: 0px;
            border: 1px ;
            border-radius: 10px;
            padding: 10px;
            color : rgb(116, 111, 111);
            background-color: rgba(0,0,0,0);
        }
        .container{
            padding: 10px;
            margin: 20px;
            border: 1px solid;
            border-color: #e4e4e4;
            width: 60%;
            margin: 0 auto; 
        }

        .write{
            padding: 10px;
            padding-right: 20px;
            text-align: right;
            border-bottom: 3px solid rgb(213, 223, 250);
            color : rgb(179, 177, 177);
            font-weight: bold;
        }

        .post{
            overflow-anchor: auto;
            margin: 13px;
            padding: 30px;
            border: 1px ;
            display: flex;
            border-bottom: 1px solid lightgray;
            

        }
        .subject{
            margin-left: 10px;
            margin-right: 10px;
            width : 15%;
            color: #3B5998;
            font-weight: bold;
            overflow: hidden;
        }


        .title{
            max-width: 60%;
            color : rgb(116, 111, 111);

        }
        .commentcnt{
            margin-left : 10px;
            font-weight: bold;
            overflow: hidden;

        }

        .viewcnt{
            position: absolute;
            right: 23%;
            font-weight: bold;
            float: right;
            overflow: hidden;

        }
        a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="board-title">
        <h1 style="margin-bottom: 50px;">시험문제공유</h1>
        <div class="search" style="position: relative;">
            <input type="text" id="search" style="outline: none;">
            <button class="search-btn"><i class="fas fa-search" style="width:20px; position: absolute; right:25px; top:20%;"></i></button>
            
        </div>
    </div>

    
    <div class="container">
        <div class="write"><a href="../yujin/testboardwrite.html">글쓰기</a></div>
        <div class="post">
            <div class="subject">
                #SUBJECT
            </div>
            <div class="title">titletitle
            </div>
            <div class="commentcnt">(ccnt)</div>
            <div class="viewcnt">조회수(vcnt)</div>
        </div>  
        <div class="post">
            <div class="subject">
                #SUBJECT
            </div>
            <div class="title">titletitle
            </div>
            <div class="commentcnt">(ccnt)</div>
            <div class="viewcnt">조회수(vcnt)</div>
        </div>
        <div class="post">
            <div class="subject">
                #SUBJECT
            </div>
            <div class="title">titletitle
            </div>
            <div class="commentcnt">(ccnt)</div>
            <div class="viewcnt">조회수(vcnt)</div>
        </div>
        <div class="post">
            <div class="subject">
                #SUBJECT
            </div>
            <div class="title">titletitle
            </div>
            <div class="commentcnt">(ccnt)</div>
            <div class="viewcnt">조회수(vcnt)</div>
        </div>
        <div class="post">
            <div class="subject">
                #위험물관리사
            </div>
            <div class="title">위험한물건 4가지 </div>
            <div class="commentcnt">(4)</div>
            <div class="viewcnt">조회수(19)</div>
        </div>
        <div class="post">
            <div class="subject">
                #위험물관리사사
            </div>
            <div class="title">위험한물건 4가지 5가지가지가지가지갖기자깆가지가지ㅏ깆
            </div>
            <div class="commentcnt">(4111)</div>
            <div class="viewcnt">조회수(1911)</div>
        </div>

        <div class="post">
            <div class="subject">
                #정보보안기사 </div>
            <div class="title">어쩌구 저쩌구 배고파배고파......</div>
            <div class="commentcnt">(41111)</div>
            <div class="viewcnt">조회수(19111)</div>
        </div>

        <div class="post">
            <div class="subject">
                #생각보다잘한듯
            </div>
            <div class="title">ㅇㅈ?ㅇㅈ?ㅇㅈ? 재하쿤 ㅇㅈ?</div>
            <div class="commentcnt">(4111)</div>
            <div class="viewcnt">조회수(1911)</div>
        </div>

    </div>
    <script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>
</body>
</html>