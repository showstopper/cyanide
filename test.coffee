cyanide = require "./lib/cyanide"

consoleHandler = new cyanide.StdoutHandler(new cyanide.ColoredFormatter new cyanide.NiceFormatter)

cyanide.Log.attachHandler consoleHandler
myLogger = cyanide.Log.getLogger "cyanide"
myLogger.debug "Debug"
myLogger.info "Info"
myLogger.warn "Warn"
myLogger.error "Error"
myLogger.critical "THERE IS A RAPIST IN LINCOLN PARK"
