<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8' />
  <script src='fullcalendar-6.1.8/dist/index.global.js'></script>
  <script>
    let data = [];
    document.addEventListener('DOMContentLoaded', function () {

      let xhtp = new XMLHttpRequest();
      xhtp.open('get', 'eventList.do');
      xhtp.send();
      xhtp.onload = function () {
        let result = JSON.parse(xhtp.responseText);
        for (let cal of result) {
          let obj = {
            title: cal.title,
            start: cal.startDate,
            end: cal.endDate
          }
          data.push(obj);
        }
        console.log(data)


        var calendarEl = document.getElementById('calendar');


        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          initialDate: '2023-01-12',
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true,
          select: function (arg) {
            var title = prompt('일정을 등록하세요');
            if (title) {
              console.log(arg)
              let addXhtp = new XMLHttpRequest();
              addXhtp.open('post', 'addEvent.do');
              addXhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=utf-8');
              addXhtp.send('title=' + title + '&start=' + arg.startStr + '&end=' + arg.endStr);
              addXhtp.onload = function () {
                let result = JSON.parse(addXhtp.responseText);
                if (result.retCode == 'Success') {
                  calendar.addEvent({
                    title: title,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay
                  })
                } else {
                  alert('처리 실패.');
                }
              }

            }
            calendar.unselect()
          },

          eventClick: function (arg) {
            if (confirm('일정을 삭제하겠습니까?')) {
              let startD = getYmd(arg.event._instance.range.start);
              let endD = getYmd(arg.event._instance.range.end)
              console.log(arg.event);
              let removeXhtp = new XMLHttpRequest();
              removeXhtp.open('post', 'removeEvent.do');
              removeXhtp.setRequestHeader('Content-Type',
                'application/x-www-form-urlencoded; charset=utf-8');
              removeXhtp.send('title=' + arg.event._def.title+'&start='+startD+'&end='+endD)
              removeXhtp.onload = function () {
                let result = JSON.parse(removeXhtp.responseText);
                if (result.retCode == 'Success') {
                  arg.event.remove()
                  alert('일정이 삭제되었습니다.')
                } else {
                  alert('처리실패.')
                }
              }
            }
          },
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: data
        });

        calendar.render();
      }
      function getYmd(d) {
        //yyyy-mm-dd 포맷 날짜 생성
        return d.getFullYear() + "-" + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() +
          1)) + "-" + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
      }
    });

  </script>
  <style>
    body {
      margin: 40px 10px;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1100px;
      margin: 0 auto;
    }
  </style>
</head>

<body>

  <div id='calendar'></div>

</body>

</html>