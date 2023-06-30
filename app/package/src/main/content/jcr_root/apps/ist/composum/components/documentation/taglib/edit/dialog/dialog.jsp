<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="model" type="com.composum.pages.commons.model.Container"
                title="@{dialog.selector=='create'?'New Taglib / Widget Set':'Edit Taglib / Widget Set'}">
    <div class="row">
        <div class="col col-xs-9">
            <cpp:widget label="Title" property="jcr:title" type="textfield" i18n="true" required="true"/>
        </div>
        <div class="col col-xs-3">
            <cpp:widget label="Key" property="key" type="textfield"/>
        </div>
    </div>
    <cpp:widget label="Description" property="jcr:description" type="richtext" i18n="true" required="true"/>
</cpp:editDialog>
