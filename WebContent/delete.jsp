<%@page import="sanupkisa02.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
	BoardDao.getInstance().deleteBoard(idx);
%>
<script>
    alert('완료되었습니다.');
    location.replace('./');
</script>