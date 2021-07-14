package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

// 서블릿 클래스를 상속받음
// 웹 어플리케이션이 시작 시 자동으로JDBC 드라이버를 로딩
public class OracleDriverLoader extends HttpServlet{
	
	//Servlet 초기화할 때 호출되는 init() 메서드 구현
	//init() 메서드는 서블릿에서 제공해주는 메서드. 서블릿 초기화 시 최초 1회 실행
	public void init(ServletConfig config) throws ServletException{
		try {
			//오라클 jdbc드라이버를 로딩함
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			throw new ServletException(e);
		}
	}
	
}
