package login.captcha;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

// 네이버 캡차 API 예제 - 캡차 이미지 수신
public class CaptchaImage {
	// 기존의 main() 메소드를
	// 캡차 이미지를 받아오는 getCaptchaImage() 메소드로 교환
	// 1. 반환타입: void
	// 2. 메소드명: getCaptchaImage
	// 3. 매개변수: String key (발급 받은 캡차 키)
    public static String getCaptchaImage(String key, HttpServletRequest request) {
        String clientId = "r2m7E3LE__KB_0JSEyJx"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "pKlQG3nSkm"; //애플리케이션 클라이언트 시크릿값";
        //String key = CaptchaKey.getCaptchaKey(); // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
        String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders, request);

        return "";
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders, HttpServletRequest request){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return getImage(con.getInputStream(), request);
            } else { // 에러 발생
                return error(con.getErrorStream());
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

    private static String getImage(InputStream is, HttpServletRequest request){

        // 타임 스탬프 값으로  파일명 생성
        String filename = Long.valueOf(new Date().getTime()).toString() + ".jpg";
        // captcha_storage 디렉터리의 실제 경로를 알아낸다.
        // realPath를 알아내려면 request 필요
        final String DIR = "captcha_storage";
        String realPath = request.getServletContext().getRealPath(DIR);
        System.out.println(realPath);
        File dir = new File(realPath);
        if(!dir.exists()) { 
        	dir.mkdir();
        }
        
        File f = new File(realPath, filename);
        
        int read;
        byte[] bytes = new byte[1024];
        try(OutputStream outputStream = new FileOutputStream(f)){
            f.createNewFile();
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            // Login.java로부터 받은 request를 사용하기 때문에
            // 여기에서 request에 데이터를 저장하면 Login.java도 저장된 데이터를 사용할 수 있다.
            // 캡챠 이미지 다운로드 성공한 지점
            // 캡챠 이미지 경로 + 파일명을 request에 저장한다.
            request.setAttribute("filename", filename);	
            request.setAttribute("DIR", DIR);			// login.java에서 사용할 수 있도록.
            
            return "이미지 캡차가 생성되었습니다.";
        } catch (IOException e) {
            throw new RuntimeException("이미지 캡차 파일 생성에 실패 했습니다.",e);
        }
    }

    private static String error(InputStream body) {
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