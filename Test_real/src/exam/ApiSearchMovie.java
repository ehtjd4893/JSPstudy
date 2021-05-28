package exam;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;



public class ApiSearchMovie {

    public static void main(String[] args) {
    	
    	Scanner sc = new Scanner(System.in);
    	System.out.print("검색하고자 하는 영화>> ");
    	String query = sc.next();
        String clientId = "ocBmYIsJFqdhZ8d5if5h"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "RuZIIXYW8v"; //애플리케이션 클라이언트 시크릿값"


        String text = null;
        try {
            text = URLEncoder.encode(query, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = null;
        BufferedOutputStream bos = null;
        responseBody = get(apiURL,requestHeaders);

       JSONParser parser = new JSONParser();
       JSONObject obj = null;
       
       
       try {
    	  obj = (JSONObject) parser.parse(responseBody);
    	  JSONArray list = (JSONArray) obj.get("items");
    	  if(list == null) {	// 에러 발생시
    		  bos = new BufferedOutputStream(new FileOutputStream("search_error.txt"));
    		  String err_msg = "[" + obj.get("errorCode") + "] "+ (String)obj.get("errorMessage");
    		  byte[] b = err_msg.getBytes();
    		  bos.write(b);
    		  bos.flush();
    		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a h:mm:ss");
    		  String date = "            " + sdf.format(new Date());
    		  byte[] d = date.getBytes();
    		  bos.write(d);
    		  bos.flush();
    		  bos.close();
    	  }
    	  else {	// 에러 없을시
	    	  bos = new BufferedOutputStream(new FileOutputStream("search_result.txt"));
	    	  for(int i = 0; i < list.size();i++) {
	    		 
	    		 String title = ((JSONObject)list.get(i)).get("title").toString();
	    		 title = title.replace("<b>", "");
	    		 title = title.replace("</b>", "");
	    		 title += "\n";
	    		 byte[] b = title.getBytes();
	    		 bos.write(b);
		       	 bos.flush();    		 
	    	  }
	    	  bos.close();
    	  }
       } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
       } 

    }


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
            	System.out.println(con.getErrorStream());
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
    	
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        } 
        
        
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        } 
    }
}