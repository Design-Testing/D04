<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<acme:display code="provider.name" value="${provider.name}"/>
<spring:message code="provider.photo"/>:<br>
<img src="${provider.photo}" alt="<spring:message code="hacker.alt.image"/>" width="20%" height="20%"/>
<br>
<jstl:if test="${not empty provider.surname}">
<jstl:forEach items="${provider.surname}" var="df">
	<acme:display code="provider.surname" value="${df}"/>
</jstl:forEach>
</jstl:if>
<acme:display code="provider.email" value="${provider.email}"/>
<acme:display code="provider.phone" value="${provider.phone}"/>
<acme:display code="provider.make" value="${provider.make}"/>
<acme:display code="provider.address" value="${provider.address}"/>
<acme:display code="provider.vat" value="${provider.vat}"/>

<br>
<security:authorize access="hasRole('HACKER')">
	<jstl:set var="hk" value="1"/>
</security:authorize>
<jstl:choose>
	<jstl:when test="${hk eq 1}">
		<acme:button url="position/hacker/list.do" name="back" code="back"/>
	</jstl:when>
	<jstl:otherwise>
		<acme:button url="position/list.do" name="listPositions" code="back"/>
	</jstl:otherwise>
</jstl:choose>
<input type="button" name="providerList" value="<spring:message code="providerList" /> ${provider.make}" onclick="javascript: relativeRedir('position/providerList.do?providerId=${provider.id}');" />