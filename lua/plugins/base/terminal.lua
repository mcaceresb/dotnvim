return {
  "kassio/neoterm",
  cmd = {
    "Tnew",
    "Topen",
    "Ttoggle",
    "Tredo",
    "Tclear",
    "Tclose",
    "TcloseAll",
    "Tkill",
    "TREPLSetTerm",
    "TREPLSendFile",
    "TREPLSendLine",
    "TREPLSendSelection",
    "TtoggleAll",
    "Tls",
    "Tnext",
    "Tprevious",
  },
  init = function()
    require "mappings.terminal"()
  end,
}
