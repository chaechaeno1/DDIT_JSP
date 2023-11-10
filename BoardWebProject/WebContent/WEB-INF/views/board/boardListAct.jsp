<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");

	out.print(new Gson().toJson(boardList));

%>