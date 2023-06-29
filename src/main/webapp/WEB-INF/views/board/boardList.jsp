<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="table">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody id="boardList">

    </tbody>
</table>

<script>
    let data = [];
    let xhtp = new XMLHttpRequest();
    xhtp.open('get', 'getBoardList.do?page=3');
    xhtp.send();
    xhtp.onload = function () {
        data = JSON.parse(xhtp.responseText);
        console.log(data);
        let tbody = document.getElementById('boardList');
        data.forEach(element => {
            let tr = document.createElement('tr');
            for (let ele in element) {
                if (ele != 'brdContent') {
                    let td = document.createElement('td');
                    td.innerText=element[ele];
                    tr.appendChild(td)
                }
            }
            tbody.appendChild(tr)
        });
    }
</script>