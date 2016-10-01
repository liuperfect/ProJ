<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理中心-账户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="<%=basePath%>/rs/js/jquery-3.1.0.min.js"></script>	
  </head>
  <script type="text/javascript">
  var pageNumber = 1;
  var pageSize = 10;
  var base = '<%=request.getAttribute("base")%>';
  function reload_accountlist(){
	 $.ajax({
		url:base+"/user/accountquery",
		data:$("#query_form").serialize(),
		dataType:"json",
		success:function(data){
			var list_html="";
			for(var i=0;i<data.list.length;i++){
				var account = data.list[i];
				var j=i+1;
				var tmp="<tr><td>"+j+"</td><td>"+account.bankaccount+"</td><td>"+account.accountname+"</td><td>"+
						"<button type=\"button\" class=\"btn btn-primary\"  onclick=\"showupdatemodal(this)\""+
						"data-bankaccount=\""+account.bankaccount+"\" "+
						"data-accountname=\""+account.accountname+"\" "+
						"data-accountid=\""+account.account_id+"\" "+
						">修 改</button> "+
						"<button type=\"button\" class=\"btn btn-danger\"  onclick=\"deleteaccount(this)\""+
						"data-bankaccount=\""+account.bankaccount+"\" "+
						">删 除</button>"+						
						"</td></tr>";
				list_html+=tmp;
			}
			$("#accountlist tbody").html(list_html);
		}
	});
  }
  function addaccount(){
	$.ajax({
		url:base+"/user/addaccount",
		data : $("#add_form").serialize(),
		dataType : "json",
		success:function(data){
			if(data.ok){
				$("#addbankaccount").val("");
				$("#addaccountname").val("");
				$("#addmodal").modal("hide");
				reload_accountlist();
			}else{
				alert(data.msg);
			}
		}
	});	
		
  }
  function deleteaccount(button){
	  if(confirm("确定删除？")){
		  $.ajax({
			  url:base+"/user/deleteaccount",
			  data:{
				  "bankaccount":$(button).attr("data-bankaccount"),
			  },
			  dateType:"json",
			  success:function(data){
				  if(data.ok){
					  reload_accountlist();	  
				  }else{
					  alert(data.msg);
				  }
				  
			  }
		  })
	  }
  }
  //通过ajax无刷新更新页面
  function updateaccount(){
	$.ajax({
		url:base+"/user/updateaccount",
		data:$("#update_form").serialize(),
		dataType:"json",
		success:function(data){
			if(data.ok){
				reload_accountlist();
				$("#updatemodal").modal("hide");
			}else{
				alert(data.msg);
			}
			
		}
	});	  
  }
  //初始化表格页面 加载account列表
  $(function(){
	reload_accountlist();
  });
  function showupdatemodal(button){
	var bankaccount=$(button).attr("data-bankaccount")//获取button属性值
	var accountname=$(button).attr("data-accountname")
	var accountid=$(button).attr("data-accountid")
	$("#bankaccount").val(bankaccount);
	$("#accountname").val(accountname);
	$("#updateaccountid").val(accountid);
	$("#updatemodal").modal("show");		
  }
  function test(){
	  alert("test");
  }
  </script>
  <body>
  	<jsp:include page="/bootstrap/js.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<form action="#" id="query_form" >
					<label for="bankaccount">银行账号：</label>
					<input type="text" name="bankaccount" onkeydown="reload_accountlist()">
					<label for="accountname">别名：</label>
					<input type="text" name="accountname" onkeydown="reload_accountlist()">
				</form>
			</div>
			<div class="col-md-3">
				<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addmodal">添加账户</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="account_list">
					<table class="table table-striped " id="accountlist">
						<thead>
							<tr>
								<th>#</th>
								<th>账户</th>
								<th>别名</th>
								<th>操作</th>
							</tr></thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改账户信息的弹出框 -->
	<div class="modal fade" id="updatemodal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	    		<h4>修改账户</h4>
	    	</div>
	    	<div class="modal-body">
	    		<form action="#" id="update_form">
					<input type="hidden" id="updateaccountid" name="account_id">
	    			<div class="form-group" class="form-control" id="updatebankaccount">
	    				<div class="row">
	    					<div class="col-md-2"></div>
	    					<div class="col-md-2">
	    						<label for="bankaccount">银行账户</label>
	    					</div>
	    					<div class="col-md-6">
	    						<input name="bankaccount" id="bankaccount">		
	    					</div>
	    					<div class="col-md-2"></div>
	    				</div>
	    			</div>
	    			<div class="form-group" class="form-control" >
	    				<div class="row">
	    					<div class="col-md-2"></div>
	    					<div class="col-md-2">
								<label for="accountname" >别名</label>
	    					</div>
	    					<div class="col-md-6">
   								<input name="accountname" id="accountname">
	    					</div>
	    					<div class="col-md-2"></div>
	    				</div>
	    			</div>

				</form>
	    	</div>
	    	<div class="modal-footer">
	    		<button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
	    		<button type="button" class="btn btn-primary" onclick="updateaccount()">提 交</button>
	    	</div>
	      	<div id="accountupdate">
				
	      	</div>
	    </div>
	  </div>
	</div>
	<!-- 添加账户弹出框 -->
	<div class="modal fade" id="addmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="close"><span aria-hidden="true">&times;</span></button>
					<h4>添加账户</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form action="#" id="add_form">
							<div class="form-group " >
								<div class="row">
									<div class="col-md-2"></div>
									<label for="bankaccount" class="col-md-2">银行账号</label>
									<input name="bankaccount" id="addbankaccount" class="col-md-6">
									<div class="col-md-2"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-2"></div>
									<label for="accountname" class="col-md-2">别&#12288&#12288名</label>
									<input name="accountname" id="addaccountname" class="col-md-6">
									<div class="col-md-2"></div>
								</div>
							</dir>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
					<button type="button" class="btn btn-primary" onclick="addaccount()">提 交</button>
				</div>
			</div>
		</div>
	</div>
  </body>
</html>
