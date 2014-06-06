@.app.load.onLoad ->
    msg = $("#msg")

    if (msg.length)
        setTimeout(->
            msg.fadeOut()
        }, 5000)
