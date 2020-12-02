<%@page import="sanupkisa02.dto.Board"%>
<%@page import="sanupkisa02.dao.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDao boardDao = BoardDao.getInstance();
	List<Board> list = boardDao.selectBoardByAll();
	int total = boardDao.total();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
	<section>
		<article>
			총 <%=total %>개의 게시물이 있습니다.
			<table border="1">
				<colgroup>
						<col width="10%"><col width="15%"><col width="55%"><col width="20%">
					</colgroup>
					<thead>
						<tr>
						    <td>번호</td><td>작성자</td><td>제목</td><td>직성일</td>
						</tr>
					</thead>
					<tbody>
					<% for(Board board : list){ %>
					<tr>
							<td><%=board.getIdx() %></td>
							<td><%=board.getWriter() %></td>
							<td><a href="./index.jsp?pp=readUI&idx=<%=board.getIdx() %>"><%=board.getSubject() %> </a></td>
							<td><%=sdf.format(board.getRegDate()) %></td>
						</tr>
					<%} %>
					</tbody>
			</table>
			<div class="btn_group right">
		    	<button type="button" onclick="location.href = './write.jsp'">작성</button>
			</div>
		</article>
	</section>