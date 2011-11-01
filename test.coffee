cyanide = require "./cyanide"

consoleHandler = new cyanide.StdoutHandler
cyanide.Log.root.attachHandler consoleHandler
logger = new cyanide.Logger
logger.attachHandler consoleHandler
logger.debug "FUCK YES"

