class Handler
        
    handle: (logger, level, emitter, msg) ->
        formatted = msg
        @send(logger, level, emitter, msg, formatted) # why msg+formatted?


class StreamHandler extends Handler

    send: (logger, level, emitter, msg, formatted) ->
        @stream.write formatted
        @stream.write "\n"

class StdoutHandler extends StreamHandler

    send:(logger, level, emitter, msg, formatted) ->
        console.log formatted

class StderrHandler extends StreamHandler

    send:(logger, level, emitter, msg, formatted) ->
        console.error formatted
        

exports.StdoutHandler = StdoutHandler
exports.StderrHandler = StdoutHandler
