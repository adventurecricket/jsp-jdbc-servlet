<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div">
				<c:if test="${not empty message }">
					<div class="alert alert-${alert}">${message}</div>
				</c:if>
				<form action="<c:url value='/login'/>" id="formLogin" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="username"
							name="username" placeholder="Tên đăng nhập">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Mật khẩu">
					</div>
					<input type="hidden" value="login" name="action" />
					<button type="submit" class="btn btn-primary">Đăng nhập</button>
				</form>
			</div>
			<p class="botto-text">Copyright &copy; Mr Henry</p>
		</div>
	</div>
</body>
</html>