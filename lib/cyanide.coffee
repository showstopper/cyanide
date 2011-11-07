fs = require "fs"

Handler = require "./Handler"
Logger = require "./Logger"
Formatter = require "./Formatter"

class Log
    @rootLogger: new Logger.Logger

    @getLogger: (path) ->
        if path is ""
            Log.rootLogger
        else
            Log.rootLogger.getSubLogger path

    @attachHandler: (handler) ->
        Log.rootLogger.attachHandler handler

exports.Log = Log
exports.StdoutHandler = Handler.StdoutHandler
exports.StderrHandler = Handler.StderrHandler
exports.FileHandler = Handler.FileHandler
exports.NiceFormatter = Formatter.NiceFormatter
exports.ColoredFormatter = Formatter.ColoredFormatter

