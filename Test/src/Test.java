import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Test {

	public static void main(String[] args) {
		
		String responseBody = "{\r\n" + 
				"  \"startDate\": \"2017-01-01\",\r\n" + 
				"  \"endDate\": \"2017-04-30\",\r\n" + 
				"  \"timeUnit\": \"month\",\r\n" + 
				"  \"results\": [\r\n" + 
				"    {\r\n" + 
				"      \"title\": \"한글\",\r\n" + 
				"      \"keywords\": [\r\n" + 
				"        \"한글\",\r\n" + 
				"        \"korean\"\r\n" + 
				"      ],\r\n" + 
				"      \"data\": [\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-01-01\",\r\n" + 
				"          \"ratio\": 47.0\r\n" + 
				"        },\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-02-01\",\r\n" + 
				"          \"ratio\": 53.23\r\n" + 
				"        },\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-03-01\",\r\n" + 
				"          \"ratio\": 100.0\r\n" + 
				"        },\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-04-01\",\r\n" + 
				"          \"ratio\": 85.32\r\n" + 
				"        }\r\n" + 
				"      ]\r\n" + 
				"    },\r\n" + 
				"    {\r\n" + 
				"      \"title\": \"영어\",\r\n" + 
				"      \"keywords\": [\r\n" + 
				"        \"영어\",\r\n" + 
				"        \"english\"\r\n" + 
				"      ],\r\n" + 
				"      \"data\": [\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-01-01\",\r\n" + 
				"          \"ratio\": 40.08\r\n" + 
				"        },\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-02-01\",\r\n" + 
				"          \"ratio\": 36.69\r\n" + 
				"        },\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-03-01\",\r\n" + 
				"          \"ratio\": 52.11\r\n" + 
				"        },\r\n" + 
				"        {\r\n" + 
				"          \"period\": \"2017-04-01\",\r\n" + 
				"          \"ratio\": 44.45\r\n" + 
				"        }\r\n" + 
				"      ]\r\n" + 
				"    }\r\n" + 
				"  ]\r\n" + 
				"}";
		
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject)parser.parse(responseBody);
			JSONObject obj2 = null;
			
			JSONArray list = (JSONArray) obj.get("results");
			for(int i = 0; i < list.size();i++) {
				System.out.println(  ((JSONArray)(((JSONObject)list.get(i)).get("data"))).get(1)     );
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(obj.get("endDate"));


	}
}
