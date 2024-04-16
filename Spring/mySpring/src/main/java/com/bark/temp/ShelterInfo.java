package com.bark.temp;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.ServletException;

import org.json.JSONArray;
import org.json.JSONObject;

import com.bark.domain.Shelter;


public class ShelterInfo {

	public HashMap<String, Shelter> getShelterInfo() throws IOException, ServletException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Ouj9BCFNFKGY0KPhvdkmt2gfFOc1hflDnudIHe%2FwFlOLb8A%2BvuYzYlXXZnxkkevFd7YG84XjX7uC2jI63m4a4g%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*보호센터등록번호*/
        urlBuilder.append("&" + URLEncoder.encode("care_nm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*동물보호센터명*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("220", "UTF-8")); /*한 페이지 결과 수 (max:220)*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(기본값) 또는 json*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection URLconn = (HttpURLConnection) url.openConnection();
		URLconn.setRequestMethod("GET");
		URLconn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + URLconn.getResponseCode());
		BufferedReader rd;
		if (URLconn.getResponseCode() >= 200 && URLconn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(URLconn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(URLconn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		URLconn.disconnect();
		
		//HashMap에 각 Shelter객체에 담아 저장(중복 피하기 위해)
		JSONObject jsonObject = new JSONObject(sb.toString());
		
		HashMap<String, Shelter> sMap = new HashMap<>();
        jsonObject = jsonObject.getJSONObject("response").getJSONObject("body").getJSONObject("items");
        JSONArray jsonArray = jsonObject.getJSONArray("item");
       
        for(int i = 0 ; i < jsonArray.length(); i++) {
			if (jsonArray.getJSONObject(i).has("lat") && jsonArray.getJSONObject(i).has("lng")
					&& jsonArray.getJSONObject(i).getDouble("lat") != 0
					&& jsonArray.getJSONObject(i).getDouble("lng") != 0) { // x,y좌표가 없거나 0이면 X
				if (jsonArray.getJSONObject(i).getString("careAddr").contains("서울")
						|| jsonArray.getJSONObject(i).getString("careAddr").contains("경기")) {	//서울과 경기만
					if (!sMap.containsKey(Double.toString(jsonArray.getJSONObject(i).getDouble("lat")))) { // 키값이 같으면 넣지
																											// 않음(키값:lat)
																											// -> 중복제거
						sMap.put(Double.toString(jsonArray.getJSONObject(i).getDouble("lat")),
								new Shelter(jsonArray.getJSONObject(i).getString("careNm"),
										jsonArray.getJSONObject(i).getString("careAddr"),
										jsonArray.getJSONObject(i).getDouble("lat"),
										jsonArray.getJSONObject(i).getDouble("lng")));
					}
				}
			}
        }
        return sMap;
	}
}
