fs = require "fs"

Handler = require "./Handler"
Logger = require "./Logger"
Formatter = require "./Formatter"

class Log
    
    @rootLogger: new Logger.Logger
    @getLogger: (path) ->

        if path is ""
            Log.rootLogger
        else # TODO: implement 'what else' (inheritance)
            Log.rootLogger

    @attachHandler: (handler) ->
        Log.rootLogger.attachHandler handler


exports.Log = Log
exports.StdoutHandler = Handler.StdoutHandler
exports.StderrHandler = Handler.StderrHandler
exports.NiceFormatter = Formatter.NiceFormatter
