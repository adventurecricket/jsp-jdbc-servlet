<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
</head>
<body>
	<div class="main-content">
		<form action="<c:url value='/admin-user'/>" id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i><a href="#">Trang chủ</a></li>
					</ul>
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<a flag="info"
											class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
											data-toggle="tooltip" title='Thêm acount'
											href='<c:url value="/admin-user?type=edit"/>'><span>
												<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
										</a>
										<button id="btnDelete" type="button" disabled
											class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
											data-toggle="tooltip" title='Xóa acount'>
											<span> <i class="fa fa-trash-o bigger-110 pink"></i></span>
										</button>
									</div>
								</div>
							</div>
							<div class="row">
							<div class="col-xs-12">
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<th><input type="checkbox" id="checkAll" class="check-box-element" /></th>
										<th>User Name</th>
										<th>FulL Name</th>
										<th>Status</th>
										<th>Ngày tạo</th>
										<th>Ngày update</th>
										<th>Quyền</th>
										<th>Thao tác</th>
									</thead>
									<tbody>
										<c:forEach var="item" items="${model.listResult }">
											<tr>
												<td><input type="checkbox" id="check_${item.id }" name="ids" class="check-box-element" value="${item.id }"/></td>
												<td>${item.username }</td>
												<td>${item.fullname }</td>
												<td>${item.status }</td>
												<td>${item.createdDate }</td>
												<td>${item.modifiedDate }</td>
												<td>${item.role.name }</td>
												<td>
													<c:url var="editURL" value="/admin-user">
														<c:param name="type" value="edit" />
														<c:param name="id" value="${item.id }" />
													</c:url>
													<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																	 title="Cập nhật" href='${editURL }'><i class="fa fa-pencil-square-o"
																	 aria-hiden="true"></i></a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<ul class="pagination" id="pagination"></ul>
								<input type="hidden" value="" id="page" name="page" />
								<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
								<input type="hidden" value="" id="sortName" name="sortName" />
								<input type="hidden" value="" id="sortBy" name="sortBy" />
								<input type="hidden" value="list" id="type" name="type" />
							</div>
						</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		var visiblePages = ${model.maxPageItem}
		var limit = 3;
		$(function () {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages: totalPages,
				visiblePages: 10,
				startPage: currentPage,
				onPageClick: function (event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#sortName').val('username');
						$('#sortBy').val('desc');
						$('#type').val('list');
						$('#formSubmit').submit();
					}
				}
			});
		});
		$('#btnDelete').click(function(e){
			e.preventDefault();
			var data={};
			ids = [];
			$.each($('input[name="ids"]:checked'),function(){
				ids.push($(this).val());
			});
			data[""+'ids'+""] = ids;
			deleteUser(data);
		});
		
		function deleteUser(data) {
			$.ajax ({
				url: '${APIurl}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function(result){
					console.log(result);
				},
				error: function(error){
					console.log(error);
				},
			});
			
		}
	</script>
</body>
</html>