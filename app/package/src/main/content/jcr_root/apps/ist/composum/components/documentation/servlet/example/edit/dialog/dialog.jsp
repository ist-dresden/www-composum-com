<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="model" type="com.composum.pages.commons.model.Element"
                title="@{dialog.selector=='create'?'Add Example':'Edit Example'}">
    <cpp:widget label="Code" property="exampleCode" type="codearea" required="true" height="50"
                hint="a servlet request (URL) example"/>
    <cpp:widget label="Description" property="jcr:description" type="richtext" i18n="true" required="true" height="80"/>
    <cpp:widget label="Result" property="exampleResult" type="codearea" height="150"
                hint="a result content example"/>
</cpp:editDialog>
