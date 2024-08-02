let httpRequest=null
//브라우저에 내장 => XMLHttpReqeust : 브라우저 => 서버요청 => 결과값을 읽어오는 클래스
function getXMLHttpRequest(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest()
	}else{
		return null
	}
}
function sendRequest(url, params, callback, method){
	httpRequest=getXMLHttpRequest()
	//메소드 방식 지정
	let httpMethod=method?method:'GET'
	if(httpMethod!='GET' && httpMethod!='POST'){
		httpMethod='GET'
	}	
	
	//URL주소 설정
	let httpParams=(params==null || params=='')?null:params
	let httpUrl=url
	if(httpMethod=='GET' && httpParams!=null){ //전송할 값이 있다면
		httpUrl=HttpUrl+"?"+httpParams
	}
	
	//서버 연결 => open
	httpRequest.open(httpMethod, httpUrl, true) //true => 비동기
	
	//한글처리
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
	
	//자동호출 함수지정
	httpRequest.onreadystatechange=callback
	
	//데이터 전송
	httpRequest.send(httpMethod=='POST'?httpParams:null)
	
	/*
		//일반 AJAX
		$.ajax({
			type:GET,
			url:,
			data:,
			success:function(){}
		})
		
		//AJAX 포함
		axios.get('',{
			
		}).then(function(){})
	 */
}