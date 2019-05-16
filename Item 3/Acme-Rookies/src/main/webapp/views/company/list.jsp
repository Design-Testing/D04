<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<security:authorize access="hasRole('ADMIN')">
	
	<acme:button url="company/computeScores.do" name="display" code="company.compute.scores"/>
</security:authorize>



<display:table name="companies" id="row"
	requestURI="company/list.do" pagesize="5"
	class="displaytag">


	<display:column property="name" titleKey="actor.name" />
		
	<display:column property="email" titleKey="actor.email" />
	
	<jstl:choose>
	<jstl:when test="${not empty row.score and row.score not eq 0}">
		<display:column property="score" titleKey="company.score" />
	</jstl:when>
	<jstl:otherwise>
		<display:column titleKey="company.score">
			<jstl:out value="N/A"></jstl:out>
		</display:column>
	</jstl:otherwise>
	</jstl:choose>

	
	<display:column>
	<acme:button url="company/display.do?companyId=${row.id}" name="display" code="company.display"/>
	</display:column>
	
	<security:authorize access="hasRole('ADMIN')">
	
		<display:column>
	<acme:button url="company/computeScore.do?companyId=${row.id}" name="display" code="company.compute.score"/>
	</display:column>
	
	</security:authorize>


</display:table>
