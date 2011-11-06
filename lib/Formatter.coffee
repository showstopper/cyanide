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
            "level" : level.toString(),
            "msg" : msg,
            "emitter": emitter.path,
            "dateTime" : new Date().toString()
        }

        formatTemplate @template, map_

exports.Formatter = Formatter
exports.NiceFormatter = NiceFormatter
