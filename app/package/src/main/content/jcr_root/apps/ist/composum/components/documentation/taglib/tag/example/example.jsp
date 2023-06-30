<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:element var="model" type="com.composum.pages.commons.model.Element">
    <cpn:div property="exampleCode" tagName="pre"
             class="${modelCssBase}_wrapper"><cpn:text property="exampleCode"
                                                       tagName="code"
                                                       class="${modelCssBase}_code"/></cpn:div>
    <cpn:text value="${model.description}" class="${modelCssBase}_description" type="rich"/>
</cpp:element>