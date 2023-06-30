<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="model" type="com.composum.pages.commons.model.Container"
                title="@{dialog.selector=='create'?'Add Tag / Widget':'Edit Tag / Widget'}">
    <cpp:widget label="Name" property="jcr:title" type="textfield" required="true"/>
    <cpp:widget label="Description" property="jcr:description" type="richtext" i18n="true" required="true"/>
    <cpp:widget label="Footer" property="footer" type="richtext" i18n="true" height="120"/>
</cpp:editDialog>
