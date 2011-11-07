Level = require ("./Level")

class Logger

    constructor: (@path="")  ->
        @handlers = []
        formatter = null

    log: (level, emitter, msg) ->
        handler.handle(this, level, emitter, msg) for handler in @handlers

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
