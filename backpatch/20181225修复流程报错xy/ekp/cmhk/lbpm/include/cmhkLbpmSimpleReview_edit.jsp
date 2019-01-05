<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resource/jsp/common.jsp"%>
<c:set var="sysWfBusinessForm" value="${requestScope[param.formName]}" />
<c:set var="lbpmProcessForm" value="${sysWfBusinessForm.sysWfBusinessForm.internalForm}" />
<script type="text/javascript">
var review_div_nav = document.getElementById('reviewDiv')
if(review_div_nav && is_will_zoom) {
	review_div_nav.style.width= htmlFlagWidth + 'px'
	review_div_nav.style.zoom=zoomSize
}


</script>
<c:if test="${sysWfBusinessForm.sysWfBusinessForm!=null}">
<%@ include file="/cmhk/lbpm/include/cmhkLbpmProcess_script.jsp"%>
<input type="hidden" name="sysWfBusinessForm.fdParameterJson" value="" id="sysWfBusinessForm.fdParameterJson">
<input type="hidden" name="sysWfBusinessForm.fdAdditionsParameterJson" value="" id="sysWfBusinessForm.fdAdditionsParameterJson">
<input type="hidden" name="sysWfBusinessForm.fdIsModify" value='' >
<input type="hidden" name="taskId" value="" id="taskId">
<html:hidden property="sysWfBusinessForm.fdCurHanderId"  styleId="sysWfBusinessForm.fdCurHanderId" />
<html:hidden property="sysWfBusinessForm.fdCurNodeSavedXML"  styleId="sysWfBusinessForm.fdCurNodeSavedXML" />
<html:hidden property="sysWfBusinessForm.fdFlowContent"  styleId="sysWfBusinessForm.fdFlowContent"  />
<html:hidden property="sysWfBusinessForm.fdProcessId"  styleId="sysWfBusinessForm.fdProcessId"  />
<html:hidden property="sysWfBusinessForm.fdKey"  styleId="sysWfBusinessForm.fdKey" />
<input type="hidden" name="sysWfBusinessForm.fdModelId" id="sysWfBusinessForm.fdModelId" value='<c:out value="${sysWfBusinessForm.fdId}" />' >
<input type="hidden" name="sysWfBusinessForm.fdModelName" id="sysWfBusinessForm.fdModelName" value='<c:out value="${sysWfBusinessForm.modelClass.name}" />' >
<html:hidden property="sysWfBusinessForm.fdCurNodeXML"  styleId="sysWfBusinessForm.fdCurNodeXML" />
<html:hidden property="sysWfBusinessForm.fdTemplateModelName"  styleId="sysWfBusinessForm.fdTemplateModelName"/>
<html:hidden property="sysWfBusinessForm.fdTemplateKey" styleId="sysWfBusinessForm.fdTemplateKey"/>
<input type="hidden" name="sysWfBusinessForm.canStartProcess" id="sysWfBusinessForm.canStartProcess" value='' >
<html:hidden property="sysWfBusinessForm.fdTranProcessXML" styleId="sysWfBusinessForm.fdTranProcessXML"/>
<html:hidden property="sysWfBusinessForm.fdFinishedNames" styleId="sysWfBusinessForm.fdFinishedNames"/>
<html:hidden property="sysWfBusinessForm.fdDraftorId" styleId="sysWfBusinessForm.fdDraftorId"/>
<html:hidden property="sysWfBusinessForm.fdDraftorName" styleId="sysWfBusinessForm.fdDraftorName"/>
<html:hidden property="sysWfBusinessForm.fdCurHanderNames" styleId="sysWfBusinessForm.fdCurHanderNames"/>
<html:hidden property="sysWfBusinessForm.fdHandlerRoleInfoIds"  styleId="sysWfBusinessForm.fdHandlerRoleInfoIds"/>
<html:hidden property="sysWfBusinessForm.fdHandlerRoleInfoNames"  styleId="sysWfBusinessForm.fdHandlerRoleInfoNames" />
<html:hidden property="sysWfBusinessForm.fdIdentityId"  styleId="sysWfBusinessForm.fdIdentityId" />
<html:hidden property="sysWfBusinessForm.fdProcessStatus" styleId="sysWfBusinessForm.fdProcessStatus" />
<!-- 柔性活动定义 -->
<input disbled=true type="hidden" name="fdDynamicNodeContent" value='<c:out value="${dynamicNodecontent}" />' >
		<!-- 流程主表格开始 -->
		<table class="tb_normal" width=967>
				<tr>
					<td class="td_normal_title" width="15%" align="left">
						<bean:message bundle="cmhk-lbpm-support" key="lbpm.flowOpt"/>
					</td>
					<td width="85%" colspan="3" id="cmhkButtonArea">
						<input class="btnopt" type="button" value="<bean:message bundle="km-cmdoc" key="kmCmdoc.review.button.viewWF"/>" onClick="viewWorkFlow();"/>
						<input class="btnopt" type="button" value="<bean:message bundle="km-cmdoc" key="kmCmdoc.review.button.opinions"/>" onClick="showOpinions('${param.fdId}');"/>
					</td>
				</tr>
				<%-- 动态加载操作--%>
				<c:forEach items="${lbpmProcessForm.curHandlerOperationsReviewJs}" var="reviewJs" varStatus="vstatus">
					<c:import url="${reviewJs}" />
				</c:forEach>

				<%-- 紧急程度设置--%>
				<c:if test="${cansetEmergency eq 'true'}">
					<tr id="emergencyRow">
				</c:if>	
				<c:if test="${cansetEmergency ne 'true' && not empty cansetEmergency}">
					<tr id="emergencyRow1" style="display:none">
				</c:if>	
				<c:if test="${empty cansetEmergency}">
					<tr id="emergencyRow" style="display:none">
				</c:if>	
						<td class="td_normal_title" width="15%" align="left">
							<bean:message bundle="cmhk-lbpm-support" key="lbpm.emergency.setting" />
						</td>
						<td colspan="3">
						 	<xform:radio property="sysWfBusinessForm.fdEmergency" value="0" showStatus="edit">
				        			<xform:enumsDataSource enumsType="cmhk_lbpm_support_emergency"></xform:enumsDataSource>		        			
				 		 	</xform:radio>
						</td>
				</tr>
				<c:if test="${ifNeedApprove eq 'true'}">
					<tr id="notifyTypeRow">
				</c:if>	
				<c:if test="${ifNeedApprove ne 'true' && not empty ifNeedApprove}">
					<tr id="notifyTypeRow1" style="display:none">
				</c:if>	
				<c:if test="${empty ifNeedApprove}">
					<tr id="notifyTypeRow" style="display:none">
				</c:if>	
					<td class="td_normal_title"  width="15%" align='left'>
						<bean:message bundle="sys-lbpmservice" key="lbpmNode.currentNode.notify.type" />
					</td>
					<td colspan="3" id="systemNotifyTypeTD">
						<kmss:editNotifyType property="sysWfBusinessForm.fdSystemNotifyType" value=""/> 
						<script type="text/javascript">
								var nodes = document.getElementsByName('sysWfBusinessForm.fdSystemNotifyType');
								if(nodes.length > 0) {
									nodes = nodes[0].parentNode.childNodes;
									
									for(var i = 0;i < nodes.length; i++) {
										if(nodes[i].nodeName.toLowerCase() != 'label') continue;
										if(nodes[i].childNodes[0].value == 'todo') {
											nodes[i].style.display = 'none';
											break;
										}
									}
								} 
		              </script>
					</td>
				</tr>
				<%-- 阅件取回设置--%>
				<c:if test="${canSetReadFile eq 'true'}">
					<tr id="readFileRow">
				</c:if>	
				<c:if test="${canSetReadFile ne 'true' && not empty canSetReadFile}">
					<tr id="readFileRow1" style="display:none">
				</c:if>	
				<c:if test="${empty canSetReadFile}">
					<tr id="readFileRow" style="display:none">
				</c:if>	
						<td class="td_normal_title" width="15%" align="left">
							<bean:message bundle="cmhk-lbpm-support" key="lbpm.readFile.setting" />
						</td>
						<td colspan="3">
				 		 	<bean:message bundle="cmhk-lbpm-support" key="lbpm.readFile.message1" />
							<input name="sysWfBusinessForm.fdReadFile" value="0" class="inputSgl" style="width:30px;" alertText="">
							<bean:message bundle="cmhk-lbpm-support" key="lbpm.readFile.message2" />
						</td>
				</tr>
				<c:if test="${ifNeedApprove eq 'true'}">
					<tr id="descriptionRow">
				</c:if>	
				<c:if test="${ifNeedApprove ne 'true' && not empty ifNeedApprove}">
					<tr id="descriptionRow1" style="display:none">
				</c:if>	
				<c:if test="${empty ifNeedApprove}">
					<tr id="descriptionRow" style="display:none">
				</c:if>			 
						<td class="td_normal_title" width="15%" align='left'>
							<bean:message bundle="sys-lbpmservice" key="lbpmNode.createDraft.opinion" />
						</td>
						<td colspan="3">
							<table border=0 class="tb_noborder">
								<tr rowspan="2">
									<td width="90%">
										
										<bean:message bundle="sys-lbpmservice" key="lbpmNode.createDraft.commonUsages" />:&nbsp;&nbsp;
										<select name="commonUsages" onchange="lbpm.globals.setUsages(this);">
										<option value=""><bean:message key="page.firstOption" /></option>
										</select>
										<a id="sysWfBusinessForm.commonUsagesDefBtn" href="#" onclick="Com_EventPreventDefault();lbpm.globals.openDefiniateUsageWindow();">
										<bean:message bundle="sys-lbpmservice" key="lbpmNode.createDraft.commonUsages.definite" />
										</a></br>
										<textarea name="fdUsageContent" class="inputMul" style="width:100%;" alertText="" key="auditNode"></textarea>
									</td>
									<td width="5%" valign="bottom">
										<%-- 暂存按钮 | 后面将改为ajax方式  Com_Submit(document.sysWfProcessForm, 'saveDraft');--%>
										<input class="btnopt" id="saveDraftButton" type=button value="<bean:message key="button.saveDraft" bundle="sys-lbpmservice" />"
											onclick="lbpm.globals.saveDraftAction(this);">
									</td>
									<td width="15%">&nbsp;</td>
									<!-- <td width="15%"><label id="currentNodeDescription"></label></td> -->
								</tr>
								<tr>
									<td colspan="2">
										<span class="txtstrong">
											<bean:message bundle="cmhk-lbpm-support" key="lbpm.review.myOpinion.tip"/>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="3"><label id="currentNodeDescription"></label></td>
								</tr>
							</table>
						</td>
				</tr>
				<!-- 2013-07-12招商局定制 增加提交者身份 -->
				<c:if test="${sysWfBusinessForm.docStatus == null || sysWfBusinessForm.docStatus<='10'}">
					<tr id="handlerIdentityRow">
						<td class="td_normal_title"  width="15%" align="center">
							<bean:message bundle="sys-lbpmservice" key="lbpmNode.currentNode.submitRole" />
						</td>
						<td colspan="3">
							<select name="rolesSelectObj" key="handlerId">
							</select>
						</td>
					</tr>
				</c:if>
		</table>
		<!-- 流程主表格结束 -->
</c:if>
<script type="text/javascript">
lbpm.constant.ERRORMAXLENGTH = '<bean:message bundle="cmhk-lbpm-support" key="lbpm.review.myOpinion.tip"/>';
$(document).ready(function () { 
	var taskId = lbpm.globals.getOperationParameterJson("id");
	$("#taskId").attr("value",taskId);
});
</script>
