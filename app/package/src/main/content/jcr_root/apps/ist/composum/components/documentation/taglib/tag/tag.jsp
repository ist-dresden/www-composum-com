<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:container var="model" type="com.composum.pages.commons.model.Container">
    <cpn:text id="tag-${model.title}" value="${model.title}" tagName="h3" class="${modelCssBase}_name"/>
    <cpn:text value="${model.description}" class="${modelCssBase}_description" type="rich"/>
    <cpp:include path="attributes" resourceType="ist/composum/components/documentation/taglib/tag/attributes"/>
    <cpn:text property="footer" class="${modelCssBase}_footer" type="rich"/>
    <cpp:include path="examples" resourceType="ist/composum/components/documentation/taglib/tag/examples"/>
</cpp:container>