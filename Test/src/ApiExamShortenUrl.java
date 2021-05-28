// 네이버 검색 API 예제 - 단축 URL - GET
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ApiExamShortenUrl {

    public static void main(String[] args) {
        String clientId = "r2m7E3LE__KB_0JSEyJx"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "pKlQG3nSkm"; //애플리케이션 클라이언트 시크릿값"

        String originalURL = "https://developers.naver.com/notice";
        String apiURL = "https://openapi.naver.com/v1/util/shorturl?url=" + originalURL;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
			obj = (JSONObject) parser.parse(responseBody);
			System.out.println(obj);
			JSONObject list = (JSONObject)obj.get("result");
			System.out.println("orgURL: " + list.get("orgUrl"));
			System.out.println("url: " + list.get("url"));
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream("D://SPRING0303//tmp.txt"));
			byte[] b = obj.toJSONString().getBytes();
			bos.write(b);
			bos.flush();
			bos.close();
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream("D://SPRING0303//tmp.txt"));
			bis.read(b);
			bis.close();
			String read = new String(b,"utf-8");
			obj = (JSONObject) parser.parse(read);
			System.out.println("new_orgURL: " + ((JSONObject)obj.get("result")).get("orgUrl"));
			
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