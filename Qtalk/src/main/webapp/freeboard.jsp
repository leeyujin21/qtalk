<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>freeboard</title>
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
            font-family: 'Pretendard-Regular';
            padding: 10px;
            width: 60%;
            margin: 10px auto;
            margin-bottom: 30px;
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
    </style>
</head>
<body>
    <%@ include file="header.jsp"%>
    <div class="board-title">
        <h1 style="margin-bottom: 50px;">자유게시판</h1>
        <div class="search" style="position: relative;">
            <input type="text" id="search" style="outline: none;">
            <!-- <input type="image" src="https://cdn-icons-png.flaticon.com/128/4443/4443098.png" alt="검색"
                name="submitButton" width="20px" style="margin-top: 8px; position: absolute;  right: 23%;"> -->
            <button class="search-btn"><i class="fas fa-search" style="width:20px; position: absolute; right:25px; top:20%;"></i></button>
            
        </div>
    </div>

    
    <div class="container">
        <div class="write"><a href="../yujin/freeboardwrite.html">글쓰기</a></div>
        <div class="post">
            <div class="title">자유게시판 글1
            </div>
            <div class="commentcnt">(44)</div>
            <div class="viewcnt">조회수(55)</div>
        </div>  
        <div class="post">
            <div class="title">자유게시판 글2
            </div>
            <div class="commentcnt">(55)</div>
            <div class="viewcnt">조회수(66)</div>
        </div>  
        <div class="post">
            <div class="title">자유게시판 글3
            </div>
            <div class="commentcnt">(123)</div>
            <div class="viewcnt">조회수(123123)</div>
        </div>  
        <div class="post">
            <div class="title">자유게시판 글4
            </div>
            <div class="commentcnt">(333)</div>
            <div class="viewcnt">조회수(3)</div>
        </div>  
        <div class="post">
            <div class="title">자유게시판 글5
            </div>
            <div class="commentcnt">(44)</div>
            <div class="viewcnt">조회수(55)</div>
        </div>  
        <div class="post">
            <div class="title">자유게시판 글6
            </div>
            <div class="commentcnt">(44)</div>
            <div class="viewcnt">조회수(55)</div>
        </div>  
        <div class="post">
            <div class="title">자유게시판 글7
            </div>
            <div class="commentcnt">(44)</div>
            <div class="viewcnt">조회수(55)</div>
        </div>  
        <div class="post">
            <div class="title">자유게시판 글8
            </div>
            <div class="commentcnt">(44)</div>
            <div class="viewcnt">조회수(55)</div>
        </div>  



    </div>
    <script src="https://kit.fontawesome.com/ad2be14d60.js" crossorigin="anonymous"></script>    
</body>
</html>