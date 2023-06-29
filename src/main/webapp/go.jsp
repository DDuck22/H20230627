<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <h3>검색조건</h3>
    시도
    <select id="search">
        
    </select>
    <button id="searchBtn">조회</button>

    <div id="show">
        <table border="1">
            <thead>
                <tr>
                    <th>센터id</th>
                    <th>센터명</th>
                    <th>연락처</th>
                    <th>시도</th>
                    <th>우편번호</th>
                </tr>
            </thead>
            <tbody id="list">

            </tbody>
        </table>
    </div>

    <script>
        let totalData = [];
        let url = `https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=300&serviceKey=1xug4ZsWCJI9Nz1ScyEDT7AH9r%2BRPuLZGKGCcopbeESI3lp4lwHXIJ7x%2BRBvDlf7DQhQspUGBvaCzobpXthBAg%3D%3D
        `;
        let sidoAry = [];
        
        let xhtp = new XMLHttpRequest();
        xhtp.open('get', url);
        xhtp.send();
        
        xhtp.onload = function () {
            let tbody = document.getElementById("list");
            let data = JSON.parse(xhtp.responseText);
            console.log(data.data);
            totalData=data.data;
            for (let i = 0; i < data.data.length; i++) {
                tbody.appendChild(makeRow(data.data[i]));
            }
            for(let data of totalData){
                if(sidoAry.indexOf(data['sido'])==-1){
                    sidoAry.push(data['sido']);
                    console.log(data.sido)
                    let sel = document.getElementById('search');
                    let opt = document.createElement('option');
                    opt.value=data.sido
                    opt.innerText=data.sido
                    sel.appendChild(opt);
                }
            }
            
            console.log(sidoAry);
        }

        // sido정보 => sidoAry


        let fields = ['id', 'centerName', 'phoneNumber', 'sido', 'zipCode'];

        function makeRow(obj = {}) {
            let tr = document.createElement('tr');
            for (let field of fields) {
                let td = document.createElement('td');
                if(field=='centerName'){
                    let ahref = document.createElement('a');
                    ahref.setAttribute('href','map.jsp?lat='+obj.lat+'&lng='+obj.lng+'&centerName='+obj.centerName); // ahref.href = 'map.jsp' 둘다 사용가능
                    ahref.target='_blank';
                    ahref.innerText = obj[field]
                    td.appendChild(ahref);
                } else{
                    td.innerText = obj[field];
                }
                tr.appendChild(td);
            }
            return tr;
        }

        
        document.getElementById('searchBtn').addEventListener('click', findFnc2);
        
        function findFnc2(){
            // console.log(totalData);
            // let ary=[];
            document.getElementById('list').innerHTML="";
            let tbody = document.getElementById("list");
            for(let data of totalData){
                // console.log(data['sido']);
                if(data['sido']==document.getElementById('search').value){
                    // ary.push(data);
                    tbody.appendChild(makeRow(data));
                }
            }
            // console.log(ary)
            // for(let i = 0;i<ary.length;i++){
            //     tbody.appendChild(makeRow(ary[i]));
            // }
            
        }

        function findFnc1() {
            let trs = document.querySelectorAll('tbody tr');
            let ary = [];
            for (let tr of trs) {
                if (tr.children[3].innerText == document.getElementById('search').value) {
                    ary.push(tr);
                }
            }
            document.getElementById('list').innerHTML="";
            
            for(let tr of ary){
                document.getElementById('list').appendChild(tr);
            }
        }
    </script>
</body>

</html>