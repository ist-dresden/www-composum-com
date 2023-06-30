Attempt to automatically convert confluence code to Composum Page content via XML.

1. Save "view as source" of confluence page to a file
2. Use http://www.it.uc3m.es/jaf/html2xhtml/simple-form.html to convert this HTML to XHTML (1.0 Transitional)
3. Run confluenceimport.xslt on it to get a snippet to paste over a column of a page
4. Upload it and compare result with original confluence page and fix the differences manually.

Watch for XXX in the output - that are unsupported features where the XSL has to be extended.
