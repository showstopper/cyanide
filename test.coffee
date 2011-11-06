cyanide = require "./lib/cyanide"

consoleHandler = new cyanide.StdoutHandler(new cyanide.NiceFormatter)

cyanide.Log.attachHandler consoleHandler
myLogger = cyanide.Log.getLogger "cyanide"
myLogger.debug "Debug"
