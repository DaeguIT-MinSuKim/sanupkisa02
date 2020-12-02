<%@page import="sanupkisa02.dao.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
	ReplyDao.getInstance().deleteReply(idx);
%>
<script>
    alert('완료되었습니다.');
    location.replace('./')
</script>