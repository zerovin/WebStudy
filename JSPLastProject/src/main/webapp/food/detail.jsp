<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	replyList(${param.fno}) //detail.do?fno=2&type=1
	$('#writeBtn').on('click',function(){
		let msg=$('#msg').val();
		if(msg.trim()===""){
			$('#msg').focus()
			return
		}
		let cno=$(this).attr("data-cno")
		$.ajax({
			type:'POST',
			url:'../all_reply/insert.do',
			data:{"cno":cno, "type":1, "msg":msg},
			success:function(result){
				if(result=="OK"){
					replyList(cno)
				}else{
					alert(result);
				}
			},
			error:function(request, status, error){
				console.log(error)
			}
		})
	})
	
	//찜하기
	//let bCheck=false;
	$('#jjimBtn').on('click',function(){
		let cno=$(this).attr('data-cno')
		//ajax 이용 type=1
		$.ajax({
			type:'POST',
			url:'../all_jjim/insert.do',
			data:{"cno":cno, "type":1},
			success:function(result){
				if(result==="OK"){
					location.href="../food/detail.do?fno="+cno+"&type=1"
				}else{
					alert(result)
				}
			},
			error:function(request, status, error){
				console.log(error)
			}
		})
	})
})

//삭제
function replyDelete(rno, cno){
	$.ajax({
		type:'POST',
		url:'../all_reply/delete.do',
		data:{"rno":rno},
		success:function(result){
			if(result=="OK"){
				replyList(cno);
			}else{
				alert(result)
			}
		},
		error:function(request, status, error){
			console.log(error)
		}
	})
}

//수정
function replyUpdate(rno){
	$('.updates').hide()
	$('#m'+rno).show()
}
function replyUpdateData(rno, cno){
	let msg=$('#msg'+rno).val()
	if(msg.trim()===""){
		$('#msg'+rno).focus()
		return
	}
	$.ajax({
		type:'POST',
		url:'../all_reply/update.do',
		data:{"rno":rno, "msg":msg},
		success:function(result){
			if(result==="OK"){
				replyList(cno)
			}else{
				alert(result)
			}
			$('#m'+rno).hide()
		},
		error:function(request, status, error){
			console.log(error)
		}
	})
}

//목록
function replyList(cno){
	$.ajax({
		type:'POST',
		url:'../all_reply/list.do',
		data:{"cno":cno, "type":1},
		success:function(json){
			json=JSON.parse(json)
			let html='';
			json.map(function(reply){
				html+='<table class="table">'
				html+='<tr>'
				html+='<td class="text-left">◑'+reply.name+'('+reply.dbday+')</td>'
				html+='<td class="text-right">'
					if(reply.id===reply.sessionId){
						html+='<span class="btn btn-xs btn-success ups" onclick="replyUpdate('+reply.rno+')">수정</span>&nbsp;'
						html+='<input type="button" class="btn btn-xs btn-warning" value="삭제" onclick="replyDelete('+reply.rno+','+reply.cno+')">'
					}
				html+='</td>'
				html+='</tr>'
				html+='<tr>'
				html+='<td colspan="2">'
				html+='<pre style="white-space:wrap;border:none;background:white">'+reply.msg+'</pre>'
				html+='</td>'
				html+='</tr>'
				html+='<tr class="updates" id="m'+reply.rno+'" style="display:none;">'
				html+='<td>'
				html+='<textarea rows="4" cols="70" id="msg'+reply.rno+'" style="float:left">'+reply.msg+'</textarea>'
				html+='<input type="button" value="댓글수정" onclick="replyUpdateData('+reply.rno+','+reply.cno+')" style="width:100px;height:85px;background-color:green;color:black;">'
				html+='</td>'
				html+='</tr>'
				html+='</table>'
			})
			$('#reply').html(html)
			$('#msg').val("")
		},
		error:function(request, status, error){
			console.log(error)
		}
	})
}
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
	  	    <h2 class="sectiontitle">상세보기</h2>
	  	    <div class="flexslider carousel basiccarousel btmspace-80">
		      <ul class="slides">
		       	<c:forTokens items="${vo.images}" delims="^" var="image">
			        <li>
			          <figure>
			          	<img class="radius-10 btmspace-10" src="http://menupan.com${image}" style="width:320px;height:185px;">
			          </figure>
			        </li>	      		
		      	</c:forTokens>
		      </ul>
		    </div>
		    <!-- 상세보기 / 댓글 -->
	    	<table class="table">
	    		<tr>
	    			<td width="30%" class="text-center" rowspan="7">
	    				<img src="http://menupan.com${vo.poster}" style="width:100%">
	    			</td>
	    			<td colspan="2">
	    				<h3>${vo.name}&nbsp;<span style="color:orange;">${vo.score}</span></h3>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="text-right" style="color:gray;" width="5%">업종</td>
	    			<td width="65%">${vo.type}</td>
	    		</tr>
	    		<tr>
	    			<td class="text-right" style="color:gray;" width="5%">전화</td>
	    			<td width="65%">${vo.phone}</td>
	    		</tr>
	    		<tr>
	    			<td class="text-right" style="color:gray;" width="5%">주소</td>
	    			<td width="65%">${vo.address}</td>
	    		</tr>
	    		<tr>
	    			<td class="text-right" style="color:gray;" width="5%">테마</td>
	    			<td width="65%">${vo.theme}</td>
	    		</tr>
	    		<tr>
	    			<td class="text-right" style="color:gray;" width="5%">주차</td>
	    			<td width="65%">${vo.parking}</td>
	    		</tr>
	    		<tr>
	    			<td colspan="3" class="text-right">
	    				<c:if test="${sessionScope.id!=null}">
		    				<a href="" class="btn btn-xs btn-success">좋아요</a>
		    				<c:if test="${check==false}">
		    					<input type="button" class="btn btn-xs btn-warning" value="찜하기" id="jjimBtn" data-cno="${vo.fno}">
		    				</c:if>
		    				<c:if test="${check==true}">
		    					<span type="button" class="btn btn-xs btn-default">찜하기</span>
		    				</c:if>
		    				<a href="" class="btn btn-xs btn-info">예약하기</a>
	    				</c:if>	
	    				<input type="button" class="btn btn-xs btn-danger" value="목록" onclick="javascript:history.back()">
	    			</td>
	    		</tr>
	    	</table>
	    	<table class="table">
	    		<tr>
	    			<td>${vo.content}</td>
	    		</tr>
	    	</table>
	    	<div style="height:10px;"></div>
	    	<div id="map" style="width:100%;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dee4629f5156da2c49e694161e31a96a&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${vo.address}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
			<div style="height:20px;"></div>
			<h2 class="sectiontitle">인근 맛집</h2>
		    <div class="flexslider carousel basiccarousel btmspace-80">
		      <ul class="slides">
		        <c:forEach var="rvo" items="${rList}">
			        <li>
			          <figure><img class="radius-10 btmspace-10" src="http://menupan.com${rvo.poster}" style="width:320px;height:185px;" title="${rvo.address}">
			            <figcaption><a href="#">${rvo.name}</a></figcaption>
			          </figure>
			        </li>	      		
		      	</c:forEach>
		      </ul>
		    </div>
		    <div style="height:20px;"></div>
		    <h2 class="sectiontitle">댓글</h2>
		    <table class="table" id="reply_table">
		    	<tbody>
		    		<%-- 댓글출력 --%>
		    		<tr>
		    			<td id="reply">
		    		</tr>
		    	</tbody>
		    </table>
		    <c:if test="${sessionScope.id!=null}">
		    	<table class="table">
	  	    		<tr>
	  	    			<td>
	  	    				<textarea rows="4" cols="70" id="msg" style="float:left"></textarea>
	  	    				<input type="button" value="댓글쓰기" style="width:100px;height:85px;background-color:green;color:black;" id="writeBtn" data-cno="${vo.fno}">
	  	    			</td>
	  	    		</tr>
	  	    	</table>
		    </c:if>
	  	</main>
	</div>
</body>
</html>