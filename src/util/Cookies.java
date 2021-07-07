package util;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
	//쿠키를 <쿠키이름(K), 쿠키객체(V)> 쌍 형태로 저장하는 맵을 생성
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	
	//생성자 : Cookies 객체 생성할 때 자동으로 쿠키를 읽을 것이다. 
	//request 안에는 Cookie 파라미터로 전달되고 있는 Cookie들이 있음
	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		//각각의Cookie 객체를 cookieMap에 저장
		if(cookies!=null) {
			for(int i=0; i<cookies.length;i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
				
			}
		}
	}
	
	// 생성자를 통해 만들어진 쿠키 맵에서 지정한 이름의 Cookie 객체를 구함
	// 만약 그런 Cookie가 없으면 null이 리턴된다. (객체니까)
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	// 지정한 이름의 쿠키객체의 값을 반환 
	public String getValue(String name) throws IOException {
		Cookie cookie = cookieMap.get(name);
		if(cookie==null) {
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "UTF-8"); 
	}
	
	// 지정한 쿠키이름의 Cookie가 있을 경우 true 없으면 false 리턴
	public boolean exists(String name) {
		return cookieMap.get(name)!=null; 
	}
	
	//이름이 name이고 값이 value인 Cookie 객체 생성해 리턴
	public static Cookie createCookie(String name, String value) throws IOException {
		return new Cookie(name, URLEncoder.encode(value, "UTF-8"));
	}
	
	//이름이 name이고 값이 value, 요청 경로가 path, 유효시간이 maxAge인 Cookie 객체 생성해 리턴
	//오버로딩
	public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	//이름이 name이고 값이 value, 요청 경로가 path, 유효시간이 maxAge인 Cookie 객체 생성해 리턴
	//오버로딩
	public static Cookie createCookie(String name, String value, String path, String domain, int maxAge) throws IOException {
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
		cookie.setDomain(domain);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	
	
	
	
	
	
	
}
