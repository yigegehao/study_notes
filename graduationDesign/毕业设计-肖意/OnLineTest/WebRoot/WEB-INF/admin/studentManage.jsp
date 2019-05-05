<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
<meta charset="UTF-8">
<title>在线考试系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">

<script src="${pageContext.request.contextPath}/jQuery/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-dropdown.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


<script src="${pageContext.request.contextPath}/js/adminUpdatePwd.js"></script>
<script src="${pageContext.request.contextPath}/js/addStudent.js"></script>
<script src="${pageContext.request.contextPath}/js/updateStudent.js"></script>
<script src="${pageContext.request.contextPath}/js/deleteStudent.js"></script>
</head>




<body class="bootstrap-admin-with-small-navbar">
    <nav class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="collapse navbar-collapse main-navbar-collapse">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/admin.jsp"><strong>欢迎使用在线考试系统</strong></a>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i> 欢迎您， <s:property value="#session.admin.username"/> <i class="caret"></i></a>
                            
                                 <ul class="dropdown-menu">
                                      <li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
                                     <li role="presentation" class="divider"></li>
                                    <li><a href="${pageContext.request.contextPath}/adminLoginAction_logout.action">退出</a></li>
                                </ul>
                                
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- left, vertical navbar & content -->
        <div class="row">
            <!-- left, vertical navbar -->
            <div class="col-md-2 bootstrap-admin-col-left">
                <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/studentManageAction_findStudentByPage.action"><i class="glyphicon glyphicon-chevron-right"></i> 学生管理</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/teacherManageAction_findTeacherByPage.action"><i class="glyphicon glyphicon-chevron-right"></i> 教师管理</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/courseManageAction_findCourseByPage.action"><i class="glyphicon glyphicon-chevron-right"></i> 课程管理</a>
                    </li>
                   
                </ul>
            </div>

		  <!-- content -->
		            <div class="col-md-10">
		                <div class="row">
		                    <div class="col-lg-12">
		                        <div class="panel panel-default bootstrap-admin-no-table-panel">
		                            <div class="panel-heading">
		                                <div class="text-muted bootstrap-admin-box-title">查询</div>
		                            </div>
		                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
		                                <form class="form-horizontal" action="${pageContext.request.contextPath}/admin/studentManageAction_queryStudent.action" method="post">
		                                    <div class="col-lg-5 form-group">
		                                        <label class="col-lg-4 control-label" for="query_sno">学号</label>
		                                        <div class="col-lg-8">
		                                            <input class="form-control" id="studentId" type="text" value="" name="studentId">
		                                            <label class="control-label" for="studentId" style="display: none;"></label>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-5 form-group">
		                                        <label class="col-lg-4 control-label" for="query_sname">姓名</label>
		                                        <div class="col-lg-8">
		                                            <input class="form-control" id="studentName" name="studentName"  type="text" value="">
		                                            <label class="control-label" for="studentName" style="display: none;"></label>
		                                        </div>
		                                    </div>
		                                    
		                                   
										 <div class="col-lg-2 form-group">
                                        <button type="submit" class="btn btn-primary" id="btn_query" onclick="query()">查询</button>
                                        <button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加</button>          
                                    </div>
		                               
		                               
		                                </form>
		                            </div>
		                        </div>
		                    </div>
						   </div>            
			<div class="row">
                    <div class="col-lg-12">
                        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>学生姓名</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            
                            
                            <!---在此插入信息-->
                            <s:if test="#request.pb.beanList!=null">
                            <s:iterator value="#request.pb.beanList" var="student">
                             <tbody>
	                         	   <td><s:property value="#student.studentId"/></td>
	                                <td><s:property value="#student.studentName"/></td>
	                                <td>
	                                	<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal" onclick='updateStudent("<s:property value="#student.studentId"/>")'>修改</button>
	                                	<button type="button" class="btn btn-danger btn-xs" onclick='deleteStudent("<s:property value="#student.studentId"/>")'>删除</button>
	                                		
	                               	</td>                                              
                          	  </tbody>
                            </s:iterator>
                            </s:if>
                            <s:else>
                            	<tbody>
	                         	   	<td>暂无数据</td>
	                                <td>暂无数据</td>
	                                <td>暂无数据</td>
                          	  </tbody>
                            </s:else>
                            
                        </table>
                        
                        
                    <s:if test="#request.pb!=null">
					                    
					                    		   <%-- 定义页码列表的长度，5个长 --%>
								   <c:choose>
									<%-- 第一条：如果总页数<=5，那么页码列表为1 ~ totaPage 从第一页到总页数--%>
									<%--如果总页数<=5的情况 --%>
									  <c:when test="${pb.totaPage <= 5 }">
									    <c:set var="begin" value="1"/>
									    <c:set var="end" value="${pb.totaPage }"/>
									  </c:when>
									  <%--总页数>5的情况 --%>
									  <c:otherwise>
										  	<%-- 第二条：按公式计算，让列表的头为当前页-2；列表的尾为当前页+2 --%>
										  	<c:set var="begin" value="${pb.pageCode-2 }"/>
										    <c:set var="end" value="${pb.pageCode+2 }"/>
										    
										    <%-- 第三条：第二条只适合在中间，而两端会出问题。这里处理begin出界！ --%>
										    <%-- 如果begin<1，那么让begin=1，相应end=5 --%>
										    <c:if test="${begin<1 }">
										    	<c:set var="begin" value="1"/>
										    	<c:set var="end" value="5"/>
										    </c:if>
										    <%-- 第四条：处理end出界。如果end>tp，那么让end=tp，相应begin=tp-4 --%>
										    <c:if test="${end>pb.totaPage }">
										    	<c:set var="begin" value="${pb.totaPage-4 }"/>
										    	<c:set var="end" value="${pb.totaPage }"/>
										    </c:if>
									  </c:otherwise>
								</c:choose>
                    
                        
                        <div class="pull-right"><!--右对齐--->
                           <ul class="pagination">
                           <li class="disabled"><a href="#">第<s:property value="#request.pb.pageCode"/>页/共<s:property value="#request.pb.totaPage"/>页</a></li>
                           <li><a href="${pageContext.request.contextPath}/admin/studentManageAction_${pb.url }pageCode=1">首页</a></li>
                           <li><a href="${pageContext.request.contextPath}/admin/studentManageAction_${pb.url }pageCode=${pb.pageCode-1 }">&laquo;</a></li><!-- 上一页 -->
                           <%-- 循环显示页码列表 --%>
								<c:forEach begin="${begin }" end="${end }" var="i">
								  <c:choose>
								  <%--如果是当前页则设置无法点击超链接 --%>
								  	<c:when test="${i eq pb.pageCode }">							  	
								  			<li class="active"><a>${i }</a><li>							 
								  	</c:when>
								  	<c:otherwise>
								  		<li><a href="${pageContext.request.contextPath}/admin/studentManageAction_${pb.url }pageCode=${i}">${i}</a></li>
								  	</c:otherwise>
								  </c:choose>
								</c:forEach>
				        	   <%--如果当前页数没到总页数，即没到最后一页,则需要显示下一页 --%>
							  <c:if test="${pb.pageCode < pb.totaPage }">
								  <li><a href="${pageContext.request.contextPath}/admin/studentManageAction_${pb.url }pageCode=${pb.pageCode+1}">&raquo;</a></li>
							</c:if>
							<%--否则显示尾页 --%>
							<li><a href="${pageContext.request.contextPath}/admin/studentManageAction_${pb.url }pageCode=${pb.totaPage}">尾页</a></li>
							</ul>
                           </div>
                    </s:if>           
                    </div>
                </div>

	
                
                
                
                
    
    
     <!--------------------------------------添加的模糊框------------------------>  
                                 <form class="form-horizontal">   <!--保证样式水平不混乱-->   
                                        <!-- 模态框（Modal） -->
									<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
														添加新学生
													</h4>
												</div>
												<div class="modal-body">
												
										<!---------------------表单-------------------->
										 <div class="form-group">
											<label for="firstname" class="col-sm-3 control-label">学号</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="addStudentId"  placeholder="请输入学生学号">
												 <label class="control-label" for="addStudentId" style="display: none;"></label>
												</div>
										</div>
											
					
											
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">姓名</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="addStudentName"  placeholder="请输入学生姓名">
												 <label class="control-label" for="addStudentName" style="display: none;"></label>
												</div>
										</div>
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">密码</label>
											<div class="col-sm-7">
												<input type="password" class="form-control" id="addPwd"  placeholder="请输入密码">
												 <label class="control-label" for="addPwd" style="display: none;"></label>
											</div>
										</div>
										
										<!---------------------表单-------------------->
									</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
													<button type="button" class="btn btn-primary" id="addStudent">
														添加
													</button>
												</div>
											</div><!-- /.modal-content -->
										</div><!-- /.modal -->
									</div>

                                 </form>	
 								<!--------------------------------------添加的模糊框------------------------>  
 
 
 
 
     
                                     <!-- 修改模态框（Modal） -->
                                     <!-------------------------------------------------------------->  
                                
                                        <!-- 修改模态框（Modal） -->
                               <form class="form-horizontal">   <!--保证样式水平不混乱-->   
									<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="updateModalLabel">
														修改学生信息
													</h4>
												</div>
												<div class="modal-body">
												
										<!---------------------表单-------------------->
											
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">学号</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="updateStudentId" placeholder="请输入学生学号" readonly="readonly">
												 <label class="control-label" for="updateStudentId" style="display: none;"></label>
												</div>
										</div>
											
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">姓名</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="updateStudentName"  placeholder="请输入学生姓名">
												<label class="control-label" for="updateStudentName" style="display: none;"></label>
												</div>
										</div>
										
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">密码</label>
											<div class="col-sm-7">
												<input type="password" class="form-control" id="updatePwd"  placeholder="请输入密码">
												<label class="control-label" for="updatePwd" style="display: none;"></label>
											</div>
										</div>
										
										
										
										<!---------------------表单-------------------->
															
										</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
													<button type="button" class="btn btn-primary" id="updateStudent">
														修改
													</button>
												</div>
											</div><!-- /.modal-content -->
										</div><!-- /.modal -->
									</div>
	
                                 </form>
                                   <!-------------------------------------------------------------->
 
    
    
    
    
 
 
 
 
    
    <!------------------------------修改密码模糊框-------------------------------->  
                 
                   <form class="form-horizontal">   <!--保证样式水平不混乱-->                  
                                     <!-- 模态框（Modal） -->
				<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">
									修改密码
								</h4>
							</div>
							
							<div class="modal-body">
							 
								<!--正文-->
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">原密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="oldPwd"  placeholder="请输入原密码">
										<label class="control-label" for="oldPwd" style="display: none;"></label>		
								</div>
							</div>	
							
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">新密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="newPwd"  placeholder="请输入新密码">
											<label class="control-label" for="newPwd" style="display: none;"></label>				
								</div>
							</div>	
							
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">确认密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="confirmPwd"  placeholder="请输入确认密码">
												<label class="control-label" for="confirmPwd" style="display: none;"></label>	
								</div>
							</div>	
								<!--正文-->
								
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<button type="button" class="btn btn-primary" id="update_adminPwd">
									修改
								</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>

				</form>	
                                   <!-------------------------------------------------------------->
                                   
                                   
                                   
                                   
                                   
                                   
                                   
                                   
    
    
    
    
				    <div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                <h4 class="modal-title" id="infoModalLabel">提示</h4>
				            </div>
				            <div class="modal-body">
				                <div class="row">
				                    <div class="col-lg-12" id="div_info"></div>
				                </div>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" id="btn_info_close" data-dismiss="modal">关闭</button>
				            </div>
				        </div>
				    </div>
				</div>
				    
    
 
 

 
</body>
</html>
