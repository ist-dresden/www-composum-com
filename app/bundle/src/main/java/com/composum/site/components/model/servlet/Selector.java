package com.composum.site.components.model.servlet;

import com.composum.pages.commons.model.Element;
import com.composum.sling.core.BeanContext;
import org.apache.sling.api.resource.Resource;

/**
 * An operation of a Composum servlet - that is, a selector. As a contrast to {@link Servlet}, we deliberately don't use
 * Sling-Models here, to show how this works together with HTL.
 */
public class Selector extends Element {

    /** Property name for {@link #getName()}. */
    public static final String PROP_NAME = "";

    /** Property name for {@link #getExtensions()}. */
    public static final String PROP_EXTENSIONS = "";

    /** Property name for {@link #getSuffix()}. */
    public static final String PROP_SUFFIX = "";

    /** Property name for {@link #getDescription()}. */
    public static final String PROP_DESCRIPTION = "";

    /** @see #getName() */
    private transient String name;

    /** @see #getExtensions() */
    private transient String extensions;

    /** @see #getSuffix() */
    private transient String suffix;

    /** @see #getDescription() */
    private transient String description;

    public Selector() {
    }

    public Selector(BeanContext context, Resource resource) {
        super(context, resource);
    }

    /** The selector name. */
    @Override
    public String getName() {
        if (name == null) {
            name = getProperty(PROP_NAME, "");
        }
        return name;
    }

    /** A textual description of the operation. */
    @Override
    public String getDescription() {
        if (description == null) {
            description = getProperty(PROP_DESCRIPTION, "");
        }
        return description;
    }

    /** The extensions with which the operation can be called. */
    public String getExtensions() {
        if (extensions == null) {
            extensions = getProperty(PROP_EXTENSIONS, "");
        }
        return extensions;
    }

    /** Optionally, a textual description of the suffix the servlet needs. */
    public String getSuffix() {
        if (suffix == null) {
            suffix = getProperty(PROP_SUFFIX, "");
        }
        return suffix;
    }


}
