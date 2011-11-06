Level = require ("./Level")
class Logger

    constructor:  ->
        @handlers = []

    log: (level, emitter, msg) ->
        handler.handle(this, level, emitter, msg) for handler in @handlers

    attachHandler: (handler) ->
        @handlers.push handler

    debug: (msg) ->
         @log Level.Level.debug, this, msg

exports.Logger = Logger
