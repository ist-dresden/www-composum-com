<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<cpp:defineObjects/>
<cpp:container test="@{model.editMode or not empty model.elements}"
               var="model" type="com.composum.pages.commons.model.Container">
    <cpn:text value="Examples" tagName="h4" i18n="true"/>
    <ul class="${modelCssBase}_xmpl-list">
        <c:forEach items="${model.elements}" var="groupElement" varStatus="loop">
            <li class="${modelCssBase}_xmpl"><cpp:include resource="${groupElement.resource}"/></li>
        </c:forEach>
    </ul>
</cpp:container>