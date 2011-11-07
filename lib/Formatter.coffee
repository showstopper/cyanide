Level = require("./Level").Level

formatTemplate = (str, toReplace) ->
    ###
    Poor man's template engine. Poor man can't engineer, poor man needs food.
    Example: "[{{dateTime}}] [{{level}}] [{{emitter}}] {{msg}}"

    str: template string
    toReplace: keys : 'result' value
    ###

    for key in Object.keys(toReplace)
        str = str.replace("{{#{key}}}", toReplace[key])
    str

class Formatter
    format: (handler, logger, level, emitter, msg) ->
        msg

class NiceFormatter
    constructor: (@template="[{{dateTime}}] [{{level}}] [{{emitter}}] {{msg}}") ->

    format: (handler, logger, level, emitter, msg) ->
        map_ = {
            "level": Level.toString(level),
            "msg": msg,
            "emitter": emitter.path,
            "dateTime": new Date().toISOString()
        }
        formatTemplate @template, map_

class ColoredFormatter
    constructor: (@inner) ->

    format: (handler, logger, level, emitter, msg) ->
        color = 0
        switch level
            when Level.debug then color = 36
            when Level.info then color = 32
            when Level.warn then color = 33
            when Level.error then color = 35
            when Level.critical then color = 31
            else color = 0
        s = ""
        if color
            s += "\033[#{color}m"
        s += @inner.format(handler, logger, level, emitter, msg)
        if color
            s += "\033[0m"
        s

exports.Formatter = Formatter
exports.NiceFormatter = NiceFormatter
exports.ColoredFormatter = ColoredFormatter
