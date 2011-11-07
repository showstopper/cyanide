Level = require ("./Level")

class Logger

    constructor: (@path="", @parent=null)  ->
        @handlers = []
        @subLoggers = {}
        formatter = null
        @fullPath = @getFullPath()

    getFullPath: ->
        if @parent
            "#{@parent.getFullPath()}.#{@path}"
        else
            @path

    log: (level, emitter, msg) ->
        accepted = false
        for handler in @handlers
            if handler.handle(this, level, emitter, msg)
                accepted = true

        # TODO: propagating it further even if it already got accepted. do we want that?
        if @parent
            @parent.log level, emitter, msg
        else if not accepted
            console.log "A message got lost in spaaaace: #{level} #{emitter} #{msg}" # TODO!

    getSubLogger: (path, create=true) ->
        if "." in path
            [first, rest] = path.split(".")
            @getSubLogger(first).getSubLogger(rest)
        else
            if path not of @subLoggers
                if not create
                    throw new Error("There is no logger called #{path}")
                else
                    logger = new Logger path, this
                    @subLoggers[path] = logger
            @subLoggers[path]

    attachHandler: (handler) ->
        @handlers.push handler

    debug: (msg) ->
         @log Level.Level.debug, this, msg

    info: (msg) ->
         @log Level.Level.info, this, msg

    warn: (msg) ->
         @log Level.Level.warn, this, msg

    error: (msg) ->
         @log Level.Level.error, this, msg

    critical: (msg) ->
         @log Level.Level.critical, this, msg

exports.Logger = Logger
