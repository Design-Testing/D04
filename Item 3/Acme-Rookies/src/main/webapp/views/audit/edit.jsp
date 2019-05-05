
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
		<form:label path="text">
			<spring:message code="audit.text" />
		</form:label>
		<form:textarea path="text" />
		<form:errors path="score" cssClass="audit.text" />
		<br>
		<br>
		<form:label path="score">
			<spring:message code="audit.score" />
		</form:label>
		<form:textarea path="score" />
		<form:errors path="score" cssClass="audit.score" />
	</div>
	<br>

	<input type="submit" name="save"
		value="<spring:message code="audit.submit" />" />
		
		

	<acme:button url="audit/auditr/listFreePositions.do" name="back"
		code="audit.back.free.positions" />
</form:form>
