package chapter12.vo;

public class MemberVO {
	
	private String memNo;
	private String memName;
	
	// 객체 생성 시 회원 id, 회원 명 입력 필수
	public MemberVO(String memNo, String memName) {
		this.memNo = memNo;
		this.memName = memName;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}
	
	//나중에 어떤 값이 들어갔는지 확인하기 좋다
	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", memName=" + memName + "]";
	}
	
	
}
