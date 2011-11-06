cyanide = require "./cyanide"

consoleHandler = new cyanide.StdoutHandler

cyanide.Log.attachHandler consoleHandler
myLogger = cyanide.Log.getLogger ""

myLogger.logger.attachHandler consoleHandler
myLogger.logger.debug "FUCK YES"
