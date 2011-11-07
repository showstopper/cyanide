Level =
    debug: 0
    info: 1
    warn: 2
    error: 3
    critical: 4

    toString: (level) ->
        switch level
            when Level.debug then "DEBUG"
            when Level.info then "INFO"
            when Level.warn then "WARN"
            when Level.error then "ERROR"
            when Level.critical then "CRITICAL"
            else level.toString()

exports.Level = Level
