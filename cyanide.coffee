fs = require "fs"
logger = require "./logger"
stdout = fs.createWriteStream "/dev/stdout" # this probably a stupid idea

Level =
    debug: 0
    info: 1
    warn: 2
    error: 3
    critical: 4
    
class Log

    @rootLogger = new logger.Logger
    
    @getLogger: (path) ->
        console.log @rootLooger
        @rootLogger
    
    @attachHandler: (handler) ->
        console.log @rootLooger
        @rootLogger.attachHandler handler

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
