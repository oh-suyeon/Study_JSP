package chapter15.service;

import java.util.List;

import chapter15.vo.Message;

public class MessageListView {
	
	private int messageTotalCount; 		// 전체 레코드 개수(카디널리티 개수)
	private int currentPageNumber; 		// 현재 페이지 번호
	private List<Message> messageList;  // select 결과 리스트
	private int pageTotalCount; 		// 페이지의 전체 개수
	private int messageCountPerPage; 	// 페이지 별 행의 개수 
	private int firstRow;				// 현재 페이지 목록의 시작 행 번호 
	private int endRow;					// 현재 페이지 목록의 끝 행 번호 
	
	//생성자 (pageTotalCount는 계산을 해서 나오는 값이니까 빼기)
	//객체를 생성하는 시점에 페이징 처리가 된다. 
	public MessageListView(int messageTotalCount, int currentPageNumber, List<Message> messageList
						  ,int messageCountPerPage, int firstRow, int endRow) {
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		
		// 전체 페이지 수 구하기
		calculatePageTotalCount();
	}
	
	private void calculatePageTotalCount() {
		//만약 select 결과가 없다면 messageTotalCount = 0
		if(messageTotalCount==0) {
			pageTotalCount = 0;
		}else{
			//전체 페이지 수 = 전체 행의 수 / 1페이지 당화면에 출력하는 행의 수
			pageTotalCount = messageTotalCount / messageCountPerPage;
			// 나머지가 존재하면 1페이지 추가한다.
			if(messageTotalCount % messageCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}
	
	//getter 메서드만 만들기
	public int getMessageTotalCount() {
		return messageTotalCount;
	}
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public List<Message> getMessageList() {
		return messageList;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public int getEndRow() {
		return endRow;
	}
	
	//select 결과가 있는지 체크
	public boolean isEmpty() {
		return messageTotalCount == 0;
	}
	
	
	
	
}
