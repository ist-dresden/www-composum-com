<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.commons.model.Element">
    <cpn:text value="${model.title}" tagName="h5" class="${modelCssBase}_name"/>
    <div class="${modelCssBase}_meta">
        <cpn:text property="valueType" class="${modelCssBase}_type"/>
        <cpn:text value="${model.properties.mandatory?'mandatory':'optional'}" i18n="true"
                  class="${modelCssBase}_mandatory"/>
        <cpn:text property="defaultValue" format="default: {}" i18n="true" class="${modelCssBase}_default"/>
    </div>
    <cpn:text value="${model.description}" class="${modelCssBase}_description" type="rich"/>
</cpp:element>