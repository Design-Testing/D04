
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>



<form:form action="audit/auditor/edit.do?positionId=${positionId }" modelAttribute="auditForm" method="POST">
	<form:hidden path="id" />
	<form:hidden path="version" />
	


	<div>
		<acme:textarea code="audit.text" path="text"/>
		<br>
		<acme:numberbox min="0" max="10" code="audit.score" path="score"/>
	</div>
	<br>

	<input type="submit" name="save"
		value="<spring:message code="audit.submit" />" />
		
	<br>
	<br>
	
	<jstl:if test="${auditForm.id eq 0 }">
            <jstl:set var="toPositionsList" value="1"/>
	</jstl:if>	
	
	<jstl:choose>
	<jstl:when test="${toPositionsList eq 1}">
		<acme:button url="audit/auditor/listFreePositions.do" name="back"
		code="audit.back.free.positions" />
	</jstl:when>
	<jstl:otherwise>
		<acme:button url="audit/auditor/listDraft.do" name="back" code="audit.back.draft.audits"/>
	</jstl:otherwise>
</jstl:choose>
	
</form:form>
