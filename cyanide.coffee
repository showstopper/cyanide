fs = require "fs"
Logger = require "./Logger"
stdout = fs.createWriteStream "/dev/stdout" # this is probably a stupid idea

    
class Log
    
    @rootLogger: new Logger.Logger
    @getLogger: (path) ->

        if path is ""
            Log.rootLogger
        else # TODO: implement 'what else' (inheritance)
            Log.rootLogger

    @attachHandler: (handler) ->
        Log.rootLogger.attachHandler handler

class Handler
        
    handle: (logger, level, emitter, msg) ->
        formatted = msg
        @send(logger, level, emitter, msg, formatted) # why msg+formatted?


class StreamHandler extends Handler

    send: (logger, level, emitter, msg, formatted) ->
        @stream.write formatted
        @stream.write "\n"
        @stream.flush()

class StdoutHandler extends StreamHandler

    constructor: ->
        @stream = stdout

exports.Log = Log
exports.Handler = Handler
exports.StreamHandler = StreamHandler
exports.StdoutHandler = StdoutHandler
