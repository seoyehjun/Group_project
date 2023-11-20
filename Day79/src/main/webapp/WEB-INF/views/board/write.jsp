<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- Place the first <script> tag in your HTML's <head> -->
<script src="https://cdn.tiny.cloud/1/bmpz83s4yqa4fgfuozripnlgp9hjdztmwwmpnqkfnjhs8r39/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

<!-- Place the following <script> and <textarea> tags your HTML's <body> -->
<script>
  tinymce.init({
    selector: 'textarea',
    plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
    toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
  });
</script>

<form method="POST">
	<section class="board noborder">
		<table>
			<tr>
				<th>제목</th>
				<td><input name="title" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="contents"></textarea>
				</td>
			</tr>
		</table>
		
		<br>
		
		<input name="writer" type="hidden" value="${user.nick }">
		
		<button>작성</button>
	</section>
</form>

<%@ include file="../footer.jsp" %>