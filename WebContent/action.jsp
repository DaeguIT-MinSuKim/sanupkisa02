<%@page import="sanupkisa02.dao.BoardDao"%>
<%@page import="sanupkisa02.dao.ReplyDao"%>
<%@page import="sanupkisa02.dto.Reply"%>
<%@page import="sanupkisa02.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String action = request.getParameter("action");
	int idx= -1;
	int bIdx = -1;
	String content = null;
	String writer = null;
	String subject = null;
	Board board = null;
	
	switch (action) {
		case "comment_insert" :
			bIdx = Integer.parseInt(request.getParameter("idx"));
			content = request.getParameter("content");
			writer = request.getParameter("writer");
			Reply reply = new Reply(bIdx, writer, content);
			ReplyDao.getInstance().insertReply(reply);
		    break;
		case "board_update":
			writer = request.getParameter("writer");
		    subject = request.getParameter("subject");
		    content = request.getParameter("content");
		    idx = Integer.parseInt(request.getParameter("idx"));
		    board = new Board(idx, writer, subject, content);
		    BoardDao.getInstance().updateBoard(board);
		    break;
		case "board_insert":
			writer = request.getParameter("writer");
		    subject = request.getParameter("subject");
		    content = request.getParameter("content");
		    board = new Board(writer, subject, content);
		    System.out.println("Board Insert > " + board);
		    BoardDao.getInstance().insertBoard(board);
			break;
	}
%>
<script>
    alert('완료되었습니다.');
    location.replace('./');
</script>