package com.composum.site.components.model.servlet;

import com.composum.pages.commons.model.Container;
import com.composum.platform.models.annotations.Property;
import com.composum.sling.core.BeanContext;
import org.apache.commons.lang3.StringUtils;
import org.apache.sling.models.annotations.Model;

import static org.apache.sling.models.annotations.DefaultInjectionStrategy.OPTIONAL;

/**
 * Models a Composum servlets general data. The attributes are injected with Sling-Models, to provide an example how this is done
 * in the context of the Composum framework - it extends the various model-related classes but also uses Sling-Models to inject
 * additional attributes.
 */
@Model(adaptables = BeanContext.class, defaultInjectionStrategy = OPTIONAL)
public class Servlet extends Container {

    @Property
    private String className;

    @Property(name = "path")
    private String servletPath;

    @Property
    private String resourceType;

    @Property
    private String suffix;

    /** The class name of the spathervlet. */
    public String getClassName() {
        return className;
    }

    /** The path under which the servlet is deployed. */
    public String getServletPath() {
        return servletPath;
    }

    /** The resourceType for which the servlet is active. */
    public String getServletResourceType() {
        return resourceType;
    }

    /** The suffix the servlet needs. */
    public String getSuffix() {
        return suffix;
    }

    public boolean isValid() {
        return StringUtils.isNoneBlank(className) && !StringUtils.isAllBlank(servletPath, resourceType, suffix);
    }
}
