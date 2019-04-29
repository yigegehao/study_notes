<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>
 
<%@ taglib prefix="s" uri="/struts-tags" %>
 
<%@page isELIgnored="false"%>
 
<table>
    <tr>
        <td>id</td>
        <td>name</td>
    </tr>
                 
<s:iterator value="products" var="p">
    <tr>
        <td>${p.id}</td>
        <td>${p.name}</td>
    </tr>
</s:iterator>
 
</table>