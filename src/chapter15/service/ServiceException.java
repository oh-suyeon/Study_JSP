package chapter15.service;

public class ServiceException extends RuntimeException {
	
	//오버로딩 : 하나의 클래스에서 같은 이름의 메서드를 여러 개 사용
	
	//생성자. 메시지와 원인 받아 처리
	public ServiceException(String message,Exception cause) {
		super(message, cause);
	}
	
	//생성자. 메시지만 받음
	public ServiceException(String message) {
		super(message);
	}
	
}
