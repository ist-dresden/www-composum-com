<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="servlet" type="com.composum.site.components.model.servlet.Servlet"
                title="@{dialog.selector=='create'?'Create a Servlet Doc':'Servlet Properties'}">
    <cpp:editDialogTab tabId="description" label="Description">
        <cpp:widget label="Name" property="jcr:title" type="textfield" required="true"/>
        <cpp:widget label="Class" property="className" type="textfield" required="true"/>
        <cpp:widget label="Path" property="path" type="textfield"/>
        <cpp:widget label="Resource Type" property="resourceType" type="textfield"/>
        <cpp:widget label="Suffix" property="suffix" type="textfield"/>
        <cpp:widget label="Description" property="jcr:description" type="richtext"/>
    </cpp:editDialogTab>
</cpp:editDialog>
