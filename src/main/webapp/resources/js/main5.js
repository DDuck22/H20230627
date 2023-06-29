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
		let cnt = 0;
		texts.forEach(function (text) {
			if (text.innerHTML == userInput.value) {
				text.remove();
				cnt++
			}
		})
		if (cnt == 0) {
			let span = document.createElement('span')
			span.innerText = userInput.value
			document.querySelector('.outer').appendChild(span);
		}
		userInput.value="";
	}
})