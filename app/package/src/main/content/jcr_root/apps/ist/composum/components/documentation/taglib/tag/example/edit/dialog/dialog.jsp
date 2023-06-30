<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="model" type="com.composum.pages.commons.model.Element"
                title="@{dialog.selector=='create'?'Add Example':'Edit Example'}">
    <cpp:widget label="Code" property="exampleCode" type="codearea" required="true"/>
    <cpp:widget label="Description" property="jcr:description" type="richtext" i18n="true" required="true"/>
</cpp:editDialog>
