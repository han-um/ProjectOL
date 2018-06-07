<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<!-- //////////// common.jsp //////////// -->
<%@include file="common.jsp"%>
<!-- //////////// 로그인 검증 //////////// -->
<%@include file="checkSign.jsp"%>
<!-- //////////// //////////// //////////// -->
<% request.setCharacterEncoding("UTF-8"); %>

<style>
#addTable td {
	padding-bottom:16px;
}
#addTable p {
	width:60px;
	height: 100%;
	display: inline-block;
	float: left;
	font-size: 20px;
	padding: 8px 5px 0 0;
	margin: 0;
	font-size: 15px;
}

#addTable input {
	width: 90%;
	height: 100%;
}

#add-menu-wrapper button {
	cursor: hand;
	float: right;
}
label {
	font-size:16px;
}
.url {
	margin-left:20px;
}
</style>
<!-- flexible add content script -->
<script language="javascript">
var oTbl;
var num = 2;
//Row 추가
function insRow() {
	oTbl = document.getElementById("addTable");
	var oRow = oTbl.insertRow();
	oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	var oCell = oRow.insertCell();
	//삽입될 Form Tag
	var frmTag = "<p>"+num+"주차</p>";
	frmTag += "<input type='text' class='form-control' name='content' placeholder='제목 입력'>";
	frmTag += "<p class='url'>&nbsp;&nbsp;&nbsp;URL :</p>";
	frmTag += "<input type='url' class='form-control video-url' name='url' placeholder='https://www.test.com'>";
	oCell.innerHTML = frmTag;
	num++;
}
//Row 삭제
function removeRow() {
	if(num > 2) {
		oTbl.deleteRow(oTbl.rows.length-1);
		num--;
	}
}
function checkForm() {
    var title = document.form.title;
    // 강의명 유무 체크
    if(title.value == '') {
        window.alert("강의명을 입력하세오");
        document.form.title.focus();
        return false; // title 입력이 안되어 있다면 submint 이벤트를 중지
    }
    var topic = document.form.topic;
    // 강의주제 유무 체크
    if(topic.value == ''){
        alert('강의주제를 입력하세요.');
        topic.focus();
        return false;
    }
 	// 영상 유무 체크
 	var con = document.form.content;
 	if (num == 2) {
 		if(con.value == ''){
 	        alert('강의정보를 입력하세요.');
			con.focus();
 	        return false;
 		}
 	} else {
 		for (var i=0; i<con.length; i++) {
 	 		if (con[i].value == '') {
 	 			alert('강의정보를 모두 입력하세요.');
 	 	        con[i].focus();
 	 	        return false;
 	 		}
 	 	}
 	}
 	var u = document.form.url;
 	if (num == 2) {
 		if(u.value == ''){
 	        alert('강의정보를 입력하세요.');
			u.focus();
 	        return false;
 		}
 	} else {
 		for (var i=0; i<u.length; i++) {
 	 		if (u[i].value == '') {
 	 			alert('강의정보를 모두 입력하세요.');
 	 	        u[i].focus();
 	 	        return false;
 	 		}
 	 	}
 	}
 	
 	form.submit();
}
</script>

<body class="hold-transition sidebar-mini sidebar-collapse">
	<div class="wrapper" id="wrap">

		<!-- //////////// header.jsp //////////// -->
		<%@include file="header.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// sidebar.jsp //////////// -->
		<%@include file="sidebar.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// main.jsp //////////// -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">

						<div class="col-sm-6">
							<h1 class="m-0 text-white">강의 등록하기</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="text-white">_</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content">
				<div class="row">
					<div class="col-lg-10">
						<form name="form" id="form" method="post" role="form" action="uploadAction.jsp">
							<div class="card-body">
								<div class="form-group">
									<label for="yitle">강의명</label> <input
										type="text" class="form-control" id="title"
										name="title" placeholder="강의명 입력">
								</div>
								<div class="form-group">
									<label for="topic">강의 주제</label>
									<input type="text" class="form-control" id="topic" placeholder="강의 주제 입력" name="topic">
								</div>
								<div class="form-group">
									<label for="intro">강의 인트로</label>
									<textarea class="form-control" rows="3" id="intro" placeholder="강의에 대한 간단한 설명 입력 " name="intro"></textarea>
								</div>
								<div class="form-group">
									<label for="inputBackgroundImage">배경이미지 설정</label>
									<div class="input-group">
										<div class="custom-file" id="fileUploadWrapper" style="width:auto;">
											<input type="file" class="custom-file-input" id="inputBackgroundImage" name="image">
											<label class="custom-file-label" for="inputBackgroundImage">강의 정보 페이지의 배경 이미지 설정</label>
											<input type='text' class='form-control' name='imageURL' placeholder="임시 배경입력">
										</div>
										<div class="input-group-append">
											<span class="input-group-text" id="">Upload</span>
										</div>
									</div>
								</div>
								<!-- 강좌 추가기능 -->
								<div class="form-group">
									<table id="addTable" style="width:100%; border:0; margin-top:30px;">
										<tr id="add-menu-wrapper">
											<th style="padding: 0 5% 0 0">
												<p style="float: left; font-size:16px; width:auto;">강의 추가하기</p>
												<button type="button" class="btn" onClick="removeRow()">
													<i class="fa fa-minus"></i>
												</button>
												<button type="button" class="btn" onClick="insRow()">
													<i class="fa fa-plus"></i>
												</button>
											</th>
										</tr>
										<tr>
											<td>
												<p>1주차</p>
												<input type='text' class='form-control' name='content' placeholder="제목 입력">
												<p class="url">&nbsp;&nbsp;&nbsp;URL :</p>
												<input type='url' class='form-control video-url' name='url' placeholder="https://www.test.com">
											</td>
											<td></td>
										</tr>
									</table>
								</div>
								<!-- /강좌 추가기능 -->
							</div>
							<div class="card-footer">
								<button type="button" class="btn btn-success w-100" onclick="checkForm()">강의 등록</button>
							</div>
							
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<!-- 이곳에 첫번째 줄의 컨텐츠가 들어감 -->

					</div>
					<!-- /.col-md-6 -->


					<div class="col-lg-6">
						<!-- 이곳에 두번째 줄의 컨텐츠가 들어감 -->

					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// sidebar-right.jsp //////////// -->
		<%@include file="sidebar-right.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// footer.jsp //////////// -->
		<%@include file="footer.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// common-js.jsp //////////// -->
		<%@include file="common-js.jsp"%>
		<!-- //////////// //////////// //////////// -->
</body>
</html>
