window.onload=()=>{
	/*
	let img=document.createElement("img") //<img>
	img.src="m1.jpg"
	img.width=200
	img.height=300
	img.title="영화명"
	// <img src="m1.jpg" width=200 height=300 title="영화명"
	document.body.appendChild(img)
	
	
	let img2=document.createElement("img") //<img>
	img2.src="m2.jpg"
	img2.width=200
	img2.height=300
	img2.title="영화명"
	document.body.appendChild(img2)
	*/
	
	for(let i=1;i<=7;i++){
		let img=document.createElement("img") // <img> => react
		img.src="m"+i+".jpg"
		img.width=200
		img.height=300
		img.title="영화명"
		document.body.appendChild(img)
	}
}