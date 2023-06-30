<%@page session="false" pageEncoding="UTF-8" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineObjects/>
<cpp:container var="model" type="com.composum.pages.commons.model.Container"
               cssBase="composum-pages-components-container-row"
               cssAdd="row ist-composum-components-documentation-taglib">
    <div class="${modelCssBase}_header">
        <cpn:text value="${model.title} (${model.properties.key})" tagName="h2" class="${modelCssBase}_title"/>
    </div>
    <cpn:div class="${modelCssBase}_top" test="${not empty model.description}">
        <cpn:text value="${model.description}" class="${modelCssBase}_description" type="rich"/>
    </cpn:div>
    <div class="${modelCssBase}_column ${modelCssBase}_column-first col col-lg-6 col-md-12 col-sm-12 col-xs-12">
        <cpp:include path="column-0" resourceType="ist/composum/components/documentation/taglib/tags"/>
    </div>
    <div class="${modelCssBase}_column ${modelCssBase}_column-last col col-lg-6 col-md-12 col-sm-12 col-xs-12">
        <cpp:include path="column-1" resourceType="ist/composum/components/documentation/taglib/tags"/>
    </div>
</cpp:container>
