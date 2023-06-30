<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="row" type="com.composum.pages.components.model.container.Row"
                title="@{dialog.selector=='create'?'Create a Parameter':'Parameter Properties'}">
    <div class="row">
        <div class="col-xs-4">
            <cpp:widget label="Name" property="jcr:title" type="textfield" required="true"/>
        </div>
        <div class="col col-xs-5">
            <cpp:widget label="Default" property="defaultValue" type="textfield"/>
        </div>
        <div class="col col-xs-3">
            <cpp:widget label="Required" property="required" type="checkbox"/>
        </div>
    </div>
    <cpp:widget label="Remark" property="jcr:description" type="richtext" i18n="true"/>
</cpp:editDialog>
