fs = require "fs"
Logger = require "./Logger"
stdout = fs.createWriteStream "/dev/stdout" # this is probably a stupid idea

Level =
    debug: 0
    info: 1
    warn: 2
    error: 3
    critical: 4
    
class Log
    
    @rootLogger: new Logger.Logger
    @getLogger: (path) ->
        console.log "rootLogger: #{Log.rootLooger}"
        Log.rootLogger
    
    @attachHandler: (handler) ->
        console.log "rootLogger: #{Log.rootLooger}"
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

exports.Level = Level
exports.Log = Log
exports.Handler = Handler
exports.StreamHandler = StreamHandler
exports.StdoutHandler = StdoutHandler
