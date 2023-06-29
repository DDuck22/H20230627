<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h3>달력보기..</h3>
<select id="year">
    <option value="2021">2021</option>
    <option value="2022">2022</option>
    <option value="2023">2023</option>
    <option value="2024">2024</option>
</select>
<select id="month">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
</select>
<table border="1" class="table">
    <!-- <thead>
        <tr>
            <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
        </tr>
    </thead>
    <tbody>
        <tr>
           <td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td>
        </tr>
        <tr>
           <td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td><td>14</td>
        </tr>
    </tbody> -->
</table>

<script>
    function makeHead() {
        // <thead>~~</thead>
        let days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'];
        let thead = document.createElement('thead');
        let tr = document.createElement('tr');
        for (let day of days) {
            let td = document.createElement('td');
            td.innerText = day;
            tr.appendChild(td);
        }
        thead.appendChild(tr);

        return thead;
    }

    function makeBody(firstDay, lastDate) {
        let tbody = document.createElement('tbody');
        let tr = document.createElement('tr');

        for (let day = 0; day < firstDay; day++) {
            let td = document.createElement('td');
            td.innerText = "";
            tr.appendChild(td);
        }

        for (let day = 1; day <= lastDate; day++) {
            let td = document.createElement('td');
            td.innerText = day;
            tr.appendChild(td);
            td.align = "center"
            td.style.fontSize = "large"
            if ((day + firstDay) % 7 == 1) {
                td.style.color = "red";
            }
            if ((day + firstDay) % 7 == 0) {
                td.style.color = "blue";
                tbody.appendChild(tr);
                tr = document.createElement('tr');
            }
        }
        tbody.appendChild(tr);

        return tbody;
    }

    function makeCalendar(year, month) {
        document.querySelector('table').innerHTML = "";
        let today = new Date(year, month - 1, 1);
        let firstDay = today.getDay();
        today = new Date(year, month, 0)
        let lastDate = today.getDate();
        console.log(firstDay, lastDate);
        let thead = makeHead();
        let tbody = makeBody(firstDay, lastDate);
        document.querySelector('table').appendChild(thead);
        document.querySelector('table').appendChild(tbody);
    }
    makeCalendar(2021, 12);

    document.getElementById('year').addEventListener('change', function (e) {
        let year = document.getElementById('year').value;
        let month = document.getElementById('month').value;
        makeCalendar(year, month);
    })

    document.getElementById('month').addEventListener('change', function (e) {
        let year = document.getElementById('year').value;
        let month = document.getElementById('month').value;
        makeCalendar(year, month);
    })
</script>