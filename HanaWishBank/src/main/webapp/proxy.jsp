<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, java.net.*, java.util.Map, java.util.HashMap"%>

<%
String clientId = "5yKMnO6CXlXzBlfUFymV"; // 네이버 클라이언트 아이디
String clientSecret = "dUZHFI62Vr"; // 네이버 클라이언트 시크릿

String query = request.getParameter("query");
String apiUrl = "https://openapi.naver.com/v1/search/shop.json?query=" + query;

Map<String, String> requestHeaders = new HashMap<>();
requestHeaders.put("X-Naver-Client-Id", clientId);
requestHeaders.put("X-Naver-Client-Secret", clientSecret);

response.addHeader("Access-Control-Allow-Origin", "*"); // CORS 허용 설정
response.addHeader("Access-Control-Allow-Methods", "GET, OPTIONS, HEAD");
response.addHeader("Access-Control-Allow-Headers", "Content-Type");

HttpURLConnection conn = connect(apiUrl);
try {
	conn.setRequestMethod("GET");
	for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
		conn.setRequestProperty(header.getKey(), header.getValue());
	}

	int responseCode = conn.getResponseCode();
	if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
		String responseBody = readBody(conn.getInputStream());
		out.print(responseBody);
	} else { // 오류 발생
		out.print("{\"error\": \"API 호출 에러\"}");
	}
} catch (IOException e) {
	out.print("{\"error\": \"API 호출 에러: " + e.getMessage() + "\"}");
} finally {
	conn.disconnect();
}

// Helper methods (connect, readBody) go here...
%>

<%!private HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
		}
	}%>

