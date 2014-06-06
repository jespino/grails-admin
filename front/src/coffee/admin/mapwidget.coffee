@.app.view 'mapwidget', ['$el'], ($el) ->
    $el.on "click", ".js-map-widget-refresh", (event) ->
        value = $(@).closest(".map-widget").find(".js-map-widget-text").val()
        html = """<iframe
                    width='425' height='350'
                    frameborder='0' scrolling='no'
                    marginheight='0' marginwidth='0'
                    src='https://maps.google.com/maps?f=q&amp;q=#{value}&amp;output=embed'
                  ></iframe>"""
        $(@).closest(".map-widget").find(".map-container").html(html)
