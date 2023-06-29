<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> Main page </h2>
<table border="1" class="table">
	<tr>
		<th>이름</th> 
		<td><input type="text" id="name"></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="number" id="age"></td>
	</tr>
	<tr>
		<th>점수</th>
		<td><input type="number" id="score"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button id="saveBtn" class="btn btn-primary">저장</button></td>
	</tr>
</table>
<table id="list" border="1" class="table">
	<thead>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>점수</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody id="target" >
	</tbody>
</table>
<style>
	div.outer{
		display: inline-block;
		width: 700px;
		height: 500px;
		background-color: yellow;
	}
	.outer span{
		display: inline-block;
		width: 80px;
		height: 30px;
		margin: 2px;
		padding: 2px;
		background-color: aquamarine;
		text-align: center;
	}
</style>
<input type="text" id="userInput"><br>
<br>
<div class="outer">
	<span>hello</span>
	<span>loooo</span>
</div>


<script src="resources/js/main5.js"></script>