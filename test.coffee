cyanide = require "./lib/cyanide"

consoleHandler = new cyanide.StdoutHandler(new cyanide.ColoredFormatter new cyanide.NiceFormatter)
cyanide.Log.attachHandler consoleHandler

fileHandler = new cyanide.FileHandler(new cyanide.NiceFormatter, "cyanide.log")
cyanide.Log.getLogger("cyanide").attachHandler fileHandler

main = cyanide.Log.getLogger "cyanide.main"
main.debug "Debug"
main.info "Info"
main.warn "Warn"
main.error "Error"
main.critical "THERE IS A RAPIST IN LINCOLN PARK"

unrelated = cyanide.Log.getLogger "unrelated"
unrelated.info "This is logged to the `unrelated` logger which has no attached file handler, so this won't appear in the logfile."

