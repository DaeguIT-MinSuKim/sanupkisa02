<%@page import="sanupkisa02.dto.Reply"%>
<%@page import="sanupkisa02.dao.ReplyDao"%>
<%@page import="sanupkisa02.dto.Board"%>
<%@page import="sanupkisa02.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	BoardDao boardDao = BoardDao.getInstance();
	int idx = Integer.parseInt(request.getParameter("idx"));
	Board board = boardDao.selectBoardByIdx(idx);
	
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String regDate = sdf.format(board.getRegDate()); 
	
	ReplyDao replyDao = ReplyDao.getInstance();
	List<Reply> replyList = replyDao.selectReplyByIdx(idx);
%>
	<section>
		<h2>게시물 조회</h2>
		<ul>
		    <li>글번호 : <%= idx %></li>
		    <li>작성자 : <%=board.getWriter() %></li>
		    <li>제목 : <%=board.getSubject() %></li>
		    <li>작성일 : <%=regDate %></li>
		    <li>내용 : <%=board.getContent() %></li>
		</ul>

		<h2>댓글 조회</h2>
		<ul>
		<%	
		    if (replyList == null){
		    	out.print("");
		    }else{
		    	for(Reply reply : replyList){   
		%>
		    <li>
		        <%=reply.getWriter() %> / <%=reply.getContent() %> / <%=reply.getRegDate() %> /
		        <a href="./comment_delete.jsp?idx=<%=reply.getIdx() %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
		    </li>
		<%      } 
		   } %>
		</ul>

 		<div>
		    <form action="./action.jsp?idx=<%= idx %>" method="post">
		    	<input type="hidden" name="action" value="comment_insert">
		        <fieldset><legend>댓글작성</legend>
		            <input type="text" name="writer" size="10" placeholder="작성자">
		            <input type="text" name="content" size="80" placeholder="내용">
		            <button type="submit">작성완료</button>
		        </fieldset>
		    </form>
		</div>

		<div class="btn_group">
			<button type="button" onclick="history.back();">목록</button>
		    <button type="button" onclick="location.href='./index.jsp?pp=updateUI&idx=<%= idx %>'">수정</button>
		    <button type="button" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false; location.href = './delete.jsp?idx=<%= idx %>'">삭제</button>
		</div>  
	</section>