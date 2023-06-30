<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling/1.2" %>
<%@taglib prefix="cpn" uri="http://sling.composum.com/cpnl/1.0" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editDialog var="row" type="com.composum.pages.components.model.container.Row"
                title="@{dialog.selector=='create'?'Create an Operation':'Operation Properties'}">
    <div class="row" style="align-items: flex-start;">
        <div class="col-xs-9">
            <cpp:widget label="Name" property="jcr:title" type="textfield" required="true"/>
            <cpp:widget label="Selector" property="selector" type="textfield" required="true"/>
            <cpp:widget label="Description" property="jcr:description" type="richtext" i18n="true"/>
        </div>
        <div class="col-xs-3">
            <cpp:widget label="Method" property="method" type="multicheck" required="true"
                        options="HEAD,GET,POST,PUT,DELETE"/>
            <cpp:widget label="Extensions" property="extension" type="combobox" multi="true" required="true"
                        options="json,html"/>
        </div>
    </div>
</cpp:editDialog>
