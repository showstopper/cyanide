fs = require "fs"

Handler = require "./Handler"
Logger = require "./Logger"
Formatter = require "./Formatter"
Filter = require "./Filter"
Level = require "./Level"

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
exports.Filter = Filter.Filter
exports.LevelFilter = Filter.LevelFilter
exports.Level = Level.Level
