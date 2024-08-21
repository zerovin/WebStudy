package com.sist.temp;
import java.io.*;
import java.util.*;
public class RecipeMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			FileReader fr=new FileReader("c:\\WebDev\\RECIPEDETAIL.csv");
			StringBuffer sb=new StringBuffer();
			int i=0;
			while((i=fr.read())!=-1) {
				sb.append((char)i);
			}
			fr.close();
			System.out.println(sb);
		}catch(Exception ex) {}
	}

}
