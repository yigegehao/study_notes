<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resource/jsp/htmlhead.jsp"%>
<style>
/*旧风格使用的样式*/
.PromptTB{border: 1px solid #000033;}
.barmsg{border-bottom: 1px solid #000033;}
</style>
<script>
Com_IncludeFile("msg.js", "style/"+Com_Parameter.Style+"/msg/");
Com_IncludeFile("docutil.js");
</script>
<%-- 新风格使用的样式 --%>
<link href="${KMSS_Parameter_StylePath}promptBox/prompt.css" rel="stylesheet" type="text/css" />
<title><bean:message key="return.systemInfo"/></title>
</head>
<BODY style="margin-left:10px">
<br><br>
<table align=center>
	<tr>
		<td><img src="${KMSS_Parameter_StylePath}icons/blank.gif" height=1 width=20></td>
		<td>
			<table width=400 border="0" align="center" cellpadding="0" cellspacing="0" class="PromptTB">
				<tr> 
					<td height=18 class=barmsg><bean:message key="return.systemInfo"/></td>
				</tr>
				<tr>
					<td>
						<table bgcolor="#FFFFFF" border=0 cellspacing=0 cellpadding=0 width=100%>
							<tr>
								<td width=20 class="PromptTD_Left Prompt_error"><img src="${KMSS_Parameter_StylePath}icons/blank.gif" height=1 width=20></td>
								<td class="PromptTD_Center">
									<br><bean:message key="return.title"/><br>
									<br style="font-size:10px">
									<font color="red">
										<strong>操作未授权，您没有权限进行此操作！</strong>
									</font>
									<br><br style="font-size:10px"><br style="font-size:10px">
								</td>
								<td width=20><img src="${KMSS_Parameter_StylePath}icons/blank.gif" height=1 width=20></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
		<td><img src="${KMSS_Parameter_StylePath}icons/blank.gif" height=1 width=20></td>
	</tr>
</table>
</body>
</html>