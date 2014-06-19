package net.kaleidos.plugins.admin.widget

import groovy.xml.MarkupBuilder

class NumberInputWidget extends InputWidget{
    @Override
    String render() {
        def writer = new StringWriter()
        def builder = new MarkupBuilder(writer)

        def attrs = htmlAttrs.clone()

        attrs << ["data-type": "integer"]
        attrs << ["value": (value!=null)?value:""]

        builder.input(attrs)

        return writer
    }

    NumberInputWidget() {
        inputType = "number"
    }

    @Override
    public void updateValue() {
        if (value) {
            super.updateValue(parse("$value"))
        }
    }

    def parse(String str) {
        def number = null;

        try {
            number = Integer.parseInt(str);
        } catch(NumberFormatException e3) {
            try {
                number = Long.parseLong(str);
            } catch(NumberFormatException e2) {
                throw e3;
            }
        }
        return number;
    }
}
