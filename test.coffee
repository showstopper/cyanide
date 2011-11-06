cyanide = require "./cyanide"

consoleHandler = new cyanide.StdoutHandler

cyanide.Log.attachHandler consoleHandler
console.log cyanide.Log
myLogger = cyanide.Log.getLogger ""
console.log myLogger
myLogger.attachHandler consoleHandler
myLogger.debug "FUCK YES"
