<%@page session="false" pageEncoding="utf-8" %>
<%@taglib prefix="cpp" uri="http://sling.composum.com/cppl/1.0" %>
<cpp:defineFrameObjects/>
<cpp:editToolbar cssBase="composum-pages-stage-edit-toolbar">
    <cpp:editAction icon="edit" label="Edit" title="Edit the selected Element"
                    action="window.composum.pages.actions.element.edit"/>
    <cpp:editAction icon="copy" label="Copy" title="Copy the selected container"
                    action="window.composum.pages.actions.element.copy"/>
    <cpp:editAction icon="trash" label="Delete" title="Delete the selected Container"
                    action="window.composum.pages.actions.element.delete"/>
</cpp:editToolbar>
