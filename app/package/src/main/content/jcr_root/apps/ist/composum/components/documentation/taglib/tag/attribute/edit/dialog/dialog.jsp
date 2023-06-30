<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="model" type="com.composum.pages.commons.model.Element"
                title="@{dialog.selector=='create'?'Add Attribute':'Edit Attribute'}">
    <div class="row">
        <div class="col col-xs-9">
            <cpp:widget label="Name" property="jcr:title" type="textfield" required="true"/>
        </div>
        <div class="col col-xs-3">
            <cpp:widget label="Type" property="valueType" type="select" required="true"
                        options="String,Boolean,Object"/>
        </div>
    </div>
    <div class="row">
        <div class="col col-xs-3">
            <cpp:widget label="Required" property="mandatory" type="checkbox"/>
        </div>
        <div class="col col-xs-9">
            <cpp:widget label="Default value" property="defaultValue" type="textfield"/>
        </div>
    </div>
    <cpp:widget label="Description" property="jcr:description" type="richtext" i18n="true" required="true"/>
</cpp:editDialog>
