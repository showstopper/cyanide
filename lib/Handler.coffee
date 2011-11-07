fs = require "fs"
Formatter = require "./Formatter"

class Handler
        
    handle: (logger, level, emitter, msg) ->
        formatted = msg
        @send(logger, level, emitter, msg, formatted) # why msg+formatted?

class ExtendedHandler extends Handler

    constructor: (@formatter=new Formatter.Formatter) ->

    handle: (logger, level, emitter, msg) ->
        formatted = @formatter.format this, logger, level, emitter, msg
        @send(logger, level, emitter, msg, formatted) # why msg+formatted?
        true

class StreamHandler extends ExtendedHandler

    constructor: (@formatter, @stream) ->
        super @formatter

    send: (logger, level, emitter, msg, formatted) ->
        @stream.write formatted
        @stream.write "\n"

class FileHandler extends StreamHandler

    constructor: (@formatter, @filename) ->
        super @formatter, fs.createWriteStream(@filename, {flags: 'a'})

class StdoutHandler extends ExtendedHandler

    send:(logger, level, emitter, msg, formatted) ->
        console.log formatted

class StderrHandler extends ExtendedHandler

    send:(logger, level, emitter, msg, formatted) ->
        console.error formatted
        

exports.StdoutHandler = StdoutHandler
exports.StderrHandler = StdoutHandler
exports.FileHandler = FileHandler
