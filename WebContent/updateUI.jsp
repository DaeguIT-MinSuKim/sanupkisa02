<%@page import="sanupkisa02.dto.Board"%>
<%@page import="sanupkisa02.dao.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDao boardDao = BoardDao.getInstance();
	int idx = Integer.parseInt(request.getParameter("idx"));
	Board board = boardDao.selectBoardByIdx(idx);
	
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String regDate = sdf.format(board.getRegDate()); 
%>
	<section>
		<article>
			 <form action="./action.jsp?idx=<%= idx %>" method="post">
		        <fieldset><legend>게시물 작성</legend>
		            <input type="hidden" name="action" value="board_update">
		            <ul>
		                <li>
		                    <label>
		                        <span>작성자 :</span>
		                        <input type="text" name="writer" value="<%=board.getWriter() %>" size="20" required>
		                    </label>
		                </li>
		                <li>
		                    <label>
		                        <span>제목 :</span>
		                        <input type="text" name="subject" value="<%=board.getSubject() %>" size="20" required>
		                    </label>
		                </li>
		                <li>
		                    <label>
		                        <span>내용 :</span>
		                        <textarea name="content" cols="80" rows="5" required><%=board.getContent() %></textarea>
		                    </label>
		                </li>
		            </ul>
		            <div class="btn_group">
		                <button type="button" onclick="history.back(); return false;">취소</button>
		                <button type="submit">수정</button>
		            </div>
		        </fieldset>
		    </form>
		</article>
	</section>