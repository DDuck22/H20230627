<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
  .center {
    text-align: center;
  }

  .pagination {
    display: inline-block;
  }

  .pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
  }

  .pagination a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
  }

  .pagination a:hover:not(.active) {
    background-color: #ddd;
  }
</style>
<h3>글목록</h3>

<table class="table">
    <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="board" items="${list }">
            <tr>
                <td><a href="board.do?bno=${board.brdNo }">${board.brdNo }</a></td>
                <td>${board.brdTitle }</td>
                <td>${board.brdWriter }</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board.createDate }"/></td>
                <td>${board.clickCnt }</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<hr>

<div class="center">
    <div class="pagination">
        <c:if test="${page.prev }">
            <a href="boardList.do?page=${page.startPage - 1 }"> Prev </a>
        </c:if>

        <c:forEach begin="${page.startPage }" end="${page.endPage }" var="pg">
            <a href="boardList.do?page=${pg }" class="${page.curPage == pg ? 'active' : '' }">${pg }</a>
        </c:forEach>

        <c:if test="${page.next }">
            <a href="boardList.do?page=${page.endPage + 1 }"> Next </a>
        </c:if>
    </div>
</div>