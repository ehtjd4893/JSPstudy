import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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
		
		try {
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("D:\\Spring0303\\JSPSTUDY_DS\\test.txt"));
			byte[] b = responseBody.getBytes();
			bos.write(b);
			bos.flush();
			bos.close();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String readString = "";
		try {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream("D:\\Spring0303\\JSPSTUDY_DS\\test.txt"));
			byte[] b = new byte[512];
			while(true) {
				int r = bis.read(b);
				if(r == -1)
					break;
				readString += new String(b,0,r); 
			}
			bis.close();
			//System.out.println(responseBody);
			System.out.println(readString);
			System.out.println(readString.equals(responseBody));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject)parser.parse(readString);
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
