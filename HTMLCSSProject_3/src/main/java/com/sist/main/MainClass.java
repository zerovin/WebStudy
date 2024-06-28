package com.sist.main;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.*;
/*
 *  <div class="a">
 *  	<div class="b">
 *  		<h1>Hello</h1>
 * 			<img src="">
 * 			<a href="">
 *  	</div>
 *  	<div class="c">
 *  		<h1>Hello</h1>
 * 			<img src="">
 * 			<a href="">
 *  	</div>
 *  </div>
 *  <div class="d">
 *  	<div class="b">
 *  		<h1>Hello</h1>
 * 			<img src="">
 * 			<a href="">
 *  	</div>
 *  	<div class="c">
 *  		<h1>Hello</h1>
 * 			<img src="">
 * 			<a href="">
 *  	</div>
 *  </div>  
 */
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MainClass mc=new MainClass();
		mc.foodData();
	}
	public void foodData() {
		FoodDAO dao=FoodDAO.newInstance();
		try {
			int k=1;
			for(int i=1;i<=347;i++) {
				Document doc=Jsoup.connect("https://www.menupan.com/restaurant/bestrest/bestrest.asp?page="+i+"&trec=8674&pt=rt").get();
				Elements link=doc.select("ul.list p.listName a");
				for(int j=0;j<link.size();j++) {
					
					try { //조건에 맞지않는 부분있을시 멈추는 현상 방지
						System.out.println(link.get(j).attr("href"));
						System.out.println("업체번호:"+k++);
						String url="https://www.menupan.com"+link.get(j).attr("href");
						
						//상세보기로 이동
						Document doc2=Jsoup.connect(url).get();
						Element poster=doc2.selectFirst(".areaThumbnail #id_restphoto_list_src #restphoto_img_0");
						System.out.println(poster.attr("src"));
						Element name=doc2.selectFirst(".areaBasic dd.name");
						System.out.println(name.text().substring(0, name.text().indexOf("[")));
						Element type=doc2.selectFirst(".areaBasic dd.type");
						System.out.println(type.text());
						Element phone=doc2.selectFirst(".areaBasic dd.tel1");
						System.out.println(phone.text());
						Element address=doc2.selectFirst(".areaBasic dd.add1");
						System.out.println(address.text());
						Element score=doc2.selectFirst(".areaBasic dd.rate .total");
						System.out.println(score.text());
						Element theme=doc2.selectFirst(".areaBasic dd.Theme");
						System.out.println(theme.text());
						Element content=doc2.selectFirst(".article #info_ps_f");
						System.out.println(content.text());
						System.out.println("========================================");
						
						FoodVO vo=new FoodVO();
						vo.setName(name.text().substring(0, name.text().indexOf("[")));
						vo.setPhone(phone.text());
						vo.setType(type.text());
						vo.setAddress(address.text());
						vo.setTheme(theme.text());
						vo.setPoster(poster.attr("src"));
						vo.setContent(content.text());
						vo.setScore(Double.parseDouble(score.text()));
						dao.foodInsert(vo);
					}catch(Exception ex) {}
				}
			}
			System.out.println("저장완료");
		}catch(Exception ex) {}
	}
}
