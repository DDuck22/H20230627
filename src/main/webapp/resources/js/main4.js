/* let jsonData =`[
	{"id":1,"first_name":"Quinton","last_name":"Newgrosh","email":"qnewgrosh0@nps.gov","gender":"Male","ip_address":7215},
	{"id":2,"first_name":"Marilyn","last_name":"Fontenot","email":"mfontenot1@tinyurl.com","gender":"Female","ip_address":6215},
	{"id":3,"first_name":"Boniface","last_name":"Pain","email":"bpain2@yelp.com","gender":"Male","ip_address":8798},
	{"id":4,"first_name":"Dorotea","last_name":"Vedeniktov","email":"dvedeniktov3@furl.net","gender":"Female","ip_address":1198},
	{"id":5,"first_name":"Hally","last_name":"Hilliam","email":"hhilliam4@ed.gov","gender":"Female","ip_address":8700},
	{"id":6,"first_name":"Rayshell","last_name":"MacInerney","email":"rmacinerney5@myspace.com","gender":"Female","ip_address":9494},
	{"id":7,"first_name":"Barbi","last_name":"McCully","email":"bmccully6@go.com","gender":"Female","ip_address":4511},
	{"id":8,"first_name":"Tandie","last_name":"Skoggins","email":"tskoggins7@liveinternet.ru","gender":"Polygender","ip_address":4157},
	{"id":9,"first_name":"Rosalynd","last_name":"Wederell","email":"rwederell8@mediafire.com","gender":"Female","ip_address":9311},
	{"id":10,"first_name":"Shanan","last_name":"Firbank","email":"sfirbank9@tinyurl.com","gender":"Male","ip_address":6807},
	{"id":11,"first_name":"Albina","last_name":"Savoury","email":"asavourya@sfgate.com","gender":"Female","ip_address":6743},
	{"id":12,"first_name":"Klarika","last_name":"Bartolomucci","email":"kbartolomuccib@purevolume.com","gender":"Female","ip_address":9658},
	{"id":13,"first_name":"Amberly","last_name":"Carrol","email":"acarrolc@lulu.com","gender":"Female","ip_address":1945},
	{"id":14,"first_name":"Shep","last_name":"Leyshon","email":"sleyshond@webeden.co.uk","gender":"Male","ip_address":7571},
	{"id":15,"first_name":"Alexa","last_name":"Yannikov","email":"ayannikove@wikipedia.org","gender":"Female","ip_address":1441}
]`;
let data = JSON.parse(jsonData);
*/

// console.log(data);

let xhtp = new XMLHttpRequest();
xhtp.open('get','chartData.do');
xhtp.send();
xhtp.onreadystatechange = function() {
	if(xhtp.readyState == 4 && xhtp.status == 200){
		console.log(xhtp.responseText);
		let data = JSON.parse(xhtp.responseText);
		console.log(data);
	}
}