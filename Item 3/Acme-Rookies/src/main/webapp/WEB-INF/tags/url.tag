<%--
 * display.tag
 *
 * Copyright (C) 2019 a8081 
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@ tag language="java" body-content="empty"%>

<%-- Taglibs --%>

<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<%-- Attributes --%>


<%@ attribute name="labelCode" required="false"%>
<%@ attribute name="code" required="true"%>
<%@ attribute name="url" required="true"%>

<%-- Definition --%>

<jstl:if test="${labelCode != null}">
	<spring:message code="${labelCode}" />:
</jstl:if>
<a href="<jstl:out value="${url}" />"><spring:message code="${code}" /></a>
<br />
