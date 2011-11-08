class Filter
    isAccepted: (handler, logger, level, emitter, msg) ->
        true

class LevelFilter extends Filter
    constructor: (@minimum, @maximum) ->
        super

    isAccepted: (handler, logger, level, emitter, msg) ->
        @minimum <= level <= @maximum

exports.Filter = Filter
exports.LevelFilter = LevelFilter
