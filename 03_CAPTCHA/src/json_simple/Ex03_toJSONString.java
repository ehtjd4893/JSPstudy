package json_simple;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex03_toJSONString {

	public static void main(String[] args) {
		
		JSONObject obj1 = new JSONObject();
		
		obj1.put("name", "브레드");
		obj1.put("age", 50);
		
		JSONObject obj2 = new JSONObject();
		
		obj2.put("name", "초코");
		obj2.put("age", 30);
		//System.out.println(obj.get("name"));
		//System.out.println(obj.get("age"));
		//String requestData = obj1.toJSONString();
		//System.out.println(requestData);
		
		JSONArray list = new JSONArray();
		list.add(obj1);
		list.add(obj2);
		String requestData = list.toJSONString();
		System.out.println(requestData);
		
		// 보낼 때는 스트링 변환해서 보내주고,
		// 받아서 사용할 때는 JSONParser를 이용해서 json타입으로 변환하여 사용
		JSONParser parser = new JSONParser();
		
	}
}


