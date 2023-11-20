<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section class="board">
	<table>
		<tr>
			<td>${row.idx }. ${row.title }</td>			
		</tr>
		<tr>
			<td>${row.writer } | ${row.view_count } | ${row.write_date }</td>
		</tr>
		<tr>
			<td><pre>${row.contents }</pre></td>
		</tr>
	</table>
	
	<c:if test="${user.nick == row.writer }">
	<p>
		<a href="${cpath }/board/update/${row.idx }">
			<button>수정</button>
		</a>
		<a href="${cpath }/board/delete/${row.idx }">
			<button>삭제</button>
		</a>
	</p>
	</c:if>
</section>

<%@ include file="../footer.jsp" %>