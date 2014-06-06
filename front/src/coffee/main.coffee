class App
    module: (dpName, dependencies, fn) ->
        Injector.add(dpName, fn)
        fn._inject = dependencies

    service: @.module
    view: @.module

    init: ->
        @.configure.exec()
        @.findViews()
        @.load.exec()

    findViews: (elm) ->
        if (elm)
            views = elm.find('[view]')
        else
            views = $('[view]')

        views.each ->
            viewsName = $(@).attr('view').split(',')
            elm = $(@)

            for viewName in viewsName
                fn = Injector.get(viewName.trim())

                if (fn)
                    Injector.invoke fn, {
                        $el: ->
                            return elm
                    }
                else
                    throw new Error(viewsName + ' does not exist')

    exec: (moduleName) ->
        fn = Injector.get(moduleName)
        return Injector.invoke(fn)

    # configuration in exec before init views
    configure:
        fns: []
        exec: ->
            for func in @.configure.fns
                func()

        addConfiguration: (fn) ->
            @.configure.fns.push(fn)

    # onload in exec after init views
    load:
        fns: = []
        exec: ->
            for func in @.configure.fns
                func()

        onLoad: (fn) ->
            @.load.fns.push(fn)

@.app = App()
