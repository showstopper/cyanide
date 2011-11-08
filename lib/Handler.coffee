fs = require "fs"
Formatter = require "./Formatter"

class Handler

    handle: (logger, level, emitter, msg) ->
        formatted = msg
        @send(logger, level, emitter, msg, formatted) # why msg+formatted?

class ExtendedHandler extends Handler

    constructor: (@formatter=new Formatter.Formatter, @filter=null) ->

    handle: (logger, level, emitter, msg) ->
        if @filter? and not @filter.isAccepted this, logger, level, emitter, msg
            return false
        if @formatter?
            formatted = @formatter.format(this, logger, level, emitter, msg)
        else
            formatted = msg
        @send(logger, level, emitter, msg, formatted) # why msg+formatted?
        true

class StreamHandler extends ExtendedHandler

    constructor: (@formatter, @stream, @filter) ->
        super @formatter, @filter

    send: (logger, level, emitter, msg, formatted) ->
        @stream.write formatted
        @stream.write "\n"

class FileHandler extends StreamHandler

    constructor: (@formatter, @filename, @filter) ->
        super @formatter, fs.createWriteStream(@filename, {flags: 'a'}), @filter

class StdoutHandler extends ExtendedHandler

    send:(logger, level, emitter, msg, formatted) ->
        console.log formatted

class StderrHandler extends ExtendedHandler

    send:(logger, level, emitter, msg, formatted) ->
        console.error formatted
        

exports.StdoutHandler = StdoutHandler
exports.StderrHandler = StdoutHandler
exports.FileHandler = FileHandler
