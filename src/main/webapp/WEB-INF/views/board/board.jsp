<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h3>상세화면</h3>

<table class="table">
    <tr>
        <th>글번호</th>
        <td>${board.brdNo }</td>
        <th>작성자</th>
        <td>${board.brdWriter }</td>
    </tr>
    <tr>
        <th>제목</th>
        <td colspan="3">${board.brdTitle }</td>
    </tr>
    <tr>
        <th>내용</th>
        <td colspan="3"><textarea readonly cols="80" rows="5">${board.brdContent }</textarea></td>
    </tr>
    <tr>
        <th>작성일자</th>
        <td>
            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.createDate }" />
        </td>
        <th>조회수</th>
        <td>${board.clickCnt }</td>
    </tr>
</table>

<hr>
<!-- 댓글부분 시작 -->
<div class="row" style="width: 85%; margin: 0 auto 0;">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <!-- head -->
            <div class="panel-heading" style="height: 40px;">
                <i class="fa fa-comments fa-fw"></i>Reply
                <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">
                    New Reply
                </button>
            </div>
            <!-- body -->
            <div class="panel-body">
                <ul class="chat">

                </ul>
            </div>
            <!-- footer -->
            <div class="panel-footer">

            </div>
        </div>
    </div>
</div>
<!-- 댓글부분.종료 -->
<!-- 모달창 시작 -->
<div class="modal fade" id="myModal" style="top: 150px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <button class="close">&times;</button>
                <h4 class="modal-title">Reply Modal</h4>
                <input type="hidden" name="replyNo">
            </div>
            <!-- body -->
            <div class="modal-body">
                <div class="form-group">
                    <label for="">Reply</label>
                    <input class="form-control" name="reply" value="New Reply..">
                </div>
                <div class="form-group">
                    <label for="">Replyer</label>
                    <input class="form-control" name="replyer" value="user01">
                </div>
                <div class="form-group">
                    <label for="">Reply Date</label>
                    <input class="form-control" name="replyDate" readonly value="2023-06-30 11:53">
                </div>
            </div>
            <!-- footer -->
            <div class="modal-footer">
                <button id="modalModBtn" class="btn btn-warning">Modify</button>
                <button id="modalRemoveBtn" class="btn btn-danger">Remove</button>
                <button id="modalRegisterBtn" class="btn btn-primary">Register</button>
                <button id="modalCloseBtn" class="btn btn-secondary">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- 모달창 종료. -->

<script>
    let modal = document.querySelector('#myModal');

    // 댓글목록
    const bno = '${board.brdNo }';
    console.log(bno);
    const replyUl = document.querySelector('ul.chat');



    fetch('replyList.do?brdNo=' + bno)
        .then(function (response) {
            console.log(response);
            return response.json();
        })
        .then(function (result) {
            console.log(result);
            for (let reply of result) {
                replyUl.innerHTML += makeList(reply)
            }
            searchList();
        })
        .catch(function (err) {
            console.log(err);
        })

    // 조회버튼
    function searchList() {
        document.querySelectorAll('ul.chat li').forEach(function (tag) {
            tag.addEventListener('click', function (e) {
                // 수정 삭제 숨김
                document.querySelector("#modalModBtn").style.display = 'block';
                document.querySelector("#modalRemoveBtn").style.display = 'block';
                document.querySelector("#modalRegisterBtn").style.display = 'none';
                console.log(tag.dataset.rno);

                let rno = tag.dataset.rno;
                fetch('getReply.do?rno=' + rno)
                    .then(response => response.json())
                    .then(function (result) {
                        console.log(result)
                        document.querySelector('#myModal input[name="replyNo"]').value = result
                            .replyNo
                        document.querySelector('#myModal input[name="reply"]').value = result.reply
                        document.querySelector('#myModal input[name="replyer"]').value = result
                            .replyer
                        document.querySelector('#myModal input[name="replyDate"]').value = result
                            .replyDate
                        modal.style.display = 'block';
                        modal.style.opacity = 1;
                    })
                    .catch(function (err) {
                        console.error(err);
                    })
            })
        })
    }

    // 닫기버튼
    document.querySelector('#modalCloseBtn').addEventListener('click', function () {
        modal.style.display = 'none';
        modal.style.opacity = 0;
        document.querySelector('#myModal div.modal-body div.form-group:nth-child(3)').style.display = 'block';
    })

    document.querySelector('.close').addEventListener('click', function () {
        modal.style.display = 'none';
        modal.style.opacity = 0;
        document.querySelector('#myModal div.modal-body div.form-group:nth-child(3)').style.display = 'block';
    })



    // 수정버튼 (id:modalBtn)

    document.querySelector('#modalModBtn').addEventListener('click', function () {
        let rno = document.querySelector('#myModal input[name="replyNo"]').value
        let reply = document.querySelector('#myModal input[name="reply"]').value
        console.log(rno)
        console.log(reply)
        /* post방식으로 사용할때
        fetch('editReply.do',{
            method: 'post',
            headers: {
                'Content-Type':'application/x-www-form-urlencoded'
            },
            body: 'rno='+rno+'&reply='+reply
        })
        */

        fetch('editReply.do?rno=' + rno + '&reply=' + reply)
            .then(resp => resp.json())
            .then(result => {
                let replyNo = result.replyNo;
                let targetLi = document.querySelector('.chat li[data-rno="' + replyNo + '"]');
                targetLi.querySelector('p').innerText = result.reply;
                modal.style.display = 'none';
                modal.style.opacity = 0;
            })
            .catch(err => console.error(err))
    })

    // 삭제버튼
    document.querySelector('#modalRemoveBtn').addEventListener('click', function () {
        let rno = document.querySelector('#myModal input[name="replyNo"]').value
        fetch('delReply.do', {
                method: 'post',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'
                },
                body: 'rno=' + rno
            })
            .then(resp => resp.json())
            .then(result => {
                console.log(result)
                if (result.retCode == 'Success') {
                    let targetLi = document.querySelector('.chat li[data-rno="' + rno + '"]');
                    targetLi.remove();
                    modal.style.display = 'none';
                    modal.style.opacity = 0;
                }
            })
    })

    // 등록버튼
    document.querySelector('#addReplyBtn').addEventListener('click', function () {
        document.querySelector('#myModal input[name="reply"]').value = "";
        document.querySelector('#myModal input[name="replyer"]').value = "";
        modal.style.display = 'block';
        modal.style.opacity = 1;
        // 수정 삭제 숨김
        document.querySelector("#modalModBtn").style.display = 'none';
        document.querySelector("#modalRemoveBtn").style.display = 'none';
        document.querySelector("#modalRegisterBtn").style.display = 'block';
        document.querySelector('#myModal div.modal-body div.form-group:nth-child(3)').style.display = 'none';

    })

    // 댓글 등록
    document.querySelector('#modalRegisterBtn').addEventListener('click', function () {
        let reply = document.querySelector('#myModal input[name="reply"]').value
        let replyer = document.querySelector('#myModal input[name="replyer"]').value
        fetch('addReply.do?bno=' + bno + '&reply=' + reply + '&replyer=' + replyer)
            .then(resp => resp.json())
            .then(result => {
                replyUl.innerHTML += makeList(result);
                searchList();
                modal.style.display = 'none';
                modal.style.opacity = 0;
            })
            .catch(err => console.error(err))
    })



    function makeList(reply = {}) {
        // <li class="left clearfix">
        //   <div>
        //      <div class="header">
        //          <Strong class="primary-font">user02</Strong>
        //          <small class="pull-right text-muted">2023-06-05 15:11</small>
        //      </div>
        //      <p>!</p>
        //   </div>
        // </li>

        let str = '';
        str += '<li class="left clearfix" data-rno=' + reply.replyNo + '><div><div class="header">';
        str += '<Strong class="primary-font">' + reply.replyer + '</Strong>';
        str += '<small class="pull-right text-muted">' + reply.replyDate + '</small>';
        str += '</div><p>' + reply.reply + '</p></div></li>';

        return str;
    }

    // 댓글기준으로 페이지 계산
    let pageNum = 1;

    function showReplyPage(replyCnt) {
        let endPage = Math.ceil(pageNum / 10.0) * 10;
        let startPage = endPage - 9;
        let prev = startPage != 1;
        let next = false;

        if (endPage * 10 > replyCnt) {
            endPage = Math.ceil(replyCnt / 10.0);
        }
        if (endPage * 10 < replyCnt) {
            next = true;
        }

        // 계산한 값으로 페이지 출력.
        let str = '<ul class = "pagination pull-right">';
        if (prev) {
            str += '<li class="page-item"><a href="">' + (startPage - 1) + '</a></li>';
        }
        for (let i = startPage; i <= endPage; i++) {
            str += '<li class="page-item"><a href="">' + i + '</a></li>';
        }
        if (next) {
            str += '<li class="page-item"><a href="">' + (endPage + 1) + '</a></li>';
        }
        str += '</ul>';
    }
</script>