/**
 * 
 */

const str = 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Praesentium facere culpa dignissimos vero et saepe asperiores, ipsa minus excepturi, tempore corrupti deleniti itaque incidunt cumque aspernatur accusantium at nihil aliquid!';

const strAry = str.split(' ');

let outer = document.querySelector('div.outer');

strAry.forEach(function (word) {
   let span = document.createElement('span');
   span.innerText = word;
   outer.appendChild(span);
})

let tables = document.querySelectorAll('#page-content-wrapper table');
console.log(tables);

tables.forEach(function (tbl) {
   tbl.innerHTML = "";
});

document.querySelectorAll('#page-content-wrapper h2').forEach(function (elem) {
   elem.remove();
})


const array1 = ['a', 'b', 'c'];

// array1.forEach(element => console.log(element)); // 람다표현식

array1.forEach(function (element, idx, ary) {
   console.log(element, idx, ary);
});


// texts.forEach(function(a){
// 	console.log(a.innerHTML)
// });

let userInput = document.getElementById('userInput');

userInput.addEventListener('change', function () {
   if (userInput.value != null) {
      let texts = document.querySelectorAll('.outer span')
      // let cnt = 0;
      texts.forEach(function (text) {
         if (text.innerHTML == userInput.value) {
            text.remove();
            // cnt++
         }
      })
      // if (cnt == 0) {
      // 	let span = document.createElement('span')
      // 	span.innerText = userInput.value
      // 	document.querySelector('.outer').appendChild(span);
      // }
      userInput.value = "";
      texts = document.querySelectorAll('.outer span')
      console.log(texts.length)
      if (texts.length == 0) {
         alert('성공')
      }
   }
})

let secs = 10;
document.getElementById('time').innerText = secs;
let clearTime = setInterval(function () {
   // document.getElementById('time').innerText = new Date();
   document.getElementById('time').innerText = secs--;
   if (document.getElementById('time').innerText == 0) {
      alert('실패')
      clearInterval(clearTime);
   }

}, 1000)