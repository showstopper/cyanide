cyanide = require "./lib/cyanide"

consoleHandler = new cyanide.StdoutHandler

cyanide.Log.attachHandler consoleHandler
myLogger = cyanide.Log.getLogger ""
myLogger.debug "Debug"
