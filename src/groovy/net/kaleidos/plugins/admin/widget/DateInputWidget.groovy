package net.kaleidos.plugins.admin.widget

class DateInputWidget extends InputWidget{

    DateInputWidget() {
        inputType = "date"
    }

    @Override
    String renderAsJson() {
        println ">>>>> Date widget"
        // if (value instanceof Date /* && attrs.format*/) {
            // return value.format(attrs.format)



            // def dateValue = value as Date
            // return (dateValue).format('dd/MM/yyyy')




        // } else {
            super.renderAsJson()
        // }
    }


    List<String> getAssets() {
        return [ 'libs/bootstrap-datepicker/css/datepicker3.css', 'libs/bootstrap-datepicker/js/bootstrap-datepicker.js']
    }
}
