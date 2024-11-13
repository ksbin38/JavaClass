package com.example.demo.commonController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DataController {
	
	@GetMapping("/getDataList")
	public void getDataList() throws URISyntaxException, IOException {
		// API URL
		String urlValue = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
		// http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=4DZSEbzLD3WjnkTQHQVb9tlYmV7VfbkoUVXy14Jt6TGi9OkV%2BUQyKMMlUQpBdQKYRZ0P4brtfdkrN7z74ksZZQ%3D%3D&sidoName=서울&returnType=json
		String serviceKey = "4DZSEbzLD3WjnkTQHQVb9tlYmV7VfbkoUVXy14Jt6TGi9OkV%2BUQyKMMlUQpBdQKYRZ0P4brtfdkrN7z74ksZZQ%3D%3D";
		
		StringBuilder urlBuilder = new StringBuilder(urlValue);
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "+" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("sidoName", "UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		
		// 데이터 URL 생성
		URI uri = new URI(urlValue);
		URL url = uri.toURL();
		// 아래처럼 축약 가능
		// URL url = new URI(urlValue).toURL();
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		BufferedReader bufferedReader;
		
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			// 통신 오류 시
			bufferedReader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		while((line = bufferedReader.readLine()) != null) {
			stringBuilder.append(line);
		}
	}

}
