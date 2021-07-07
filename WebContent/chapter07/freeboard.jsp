<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판 목록</title>
</head>
<body>
	
	<!-- body 사이를 document라고 한다. -->
	<table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<jsp:include page="/module/top.jsp" flush="false" />
			</td>
		</tr>
		<tr>
			<td style="width:30%;" valign="top">
				<jsp:include page="/module/left.jsp" flush="false" />
			</td>
			<td>
				<!-- 내용부분 : 시작 -->
				<table border="1" style="width: 100%;">
					<tr> 
						<td colspan="4"><a href="/chapter07/freeboardwrite.jsp">[게시글쓰기]</a></td> 
					</tr>
					<tr>
						<th>번호</th>  
						<th>제목</th>  
						<th>작성자</th>  
						<th>조회수</th>  
					</tr>
				<%
				int currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1":request.getParameter("currentPage"));
				
				// 글, 페이지 전체 개수
				int total = 121;
				int totalPage = 120 / 10;
				if(total%10 > 0){
					totalPage++;
				}
				
				// 시작-종료 페이지
				// [이전]  1  2  3  4  5  [다음] ==> 1과 5
				int modVal = currentPage%5;
				int startPage = currentPage / 5 * 5 + 1;
				if(modVal == 0) startPage -= 5; //보정작업
				int endPage = startPage + 4;
				if(endPage > totalPage)	endPage = totalPage;
				
				// 글 시작-종료 번호
				int startNum = currentPage * 10 - 9;
				int endNum = currentPage * 10;
				if(endNum > total) endNum = total;
				
				for(int i=startNum; i<=endNum; i++){ %>
					<tr>
						<td><%=i%></td>  
						<td>제목<%=i%></td>  
						<td>작성자<%=i%></td>  
						<td>0</td>  
					</tr>
				<%}%>
					<tr style="text-align: center;"> 
						<td colspan="4">
						<%if(startPage>5){ %>
							<a href="/chapter07/freeboard.jsp?currentPage=<%=startPage-5%>">[이전]</a>
						<%} %>
							&nbsp;
						<%for(int j=startPage; j<=endPage; j++){%> 
							<a href="/chapter07/freeboard.jsp?currentPage=<%=(j)%>"><%=(j)%></a>&nbsp;
						<%} %>
						<%if(endPage<totalPage){ %>
							<a href="/chapter07/freeboard.jsp?currentPage=<%=startPage+5%>">[다음]</a>
						<%} %>
						</td> 
					</tr>
				</table>
				<!-- 내용부분 : 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="/module/bottom.jsp" />
			</td>
		</tr>
	</table>
	
</body>
</html>