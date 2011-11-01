fs = require "fs"

stdout = fs.createWriteStream "/dev/stdout" # this probably a stupid idea

Level =
    debug: 0
    info: 1
    warn: 2
    error: 3
    critical: 4
    
class Logger

    constructor:  ->
        @handlers = []

    log: (level, emitter, msg) ->
        handler.handle(this, level, emitter, msg) for handler in @handlers

    attachHandler: (handler) ->
        @handlers.push handler

    debug: (msg) ->
         @log Level.debug, this, msg

class Log

    @root = new Logger
    getLogger: () ->
        @root

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
exports.Logger = Logger
exports.Handler = Handler
exports.StreamHandler = StreamHandler
exports.StdoutHandler = StdoutHandler
