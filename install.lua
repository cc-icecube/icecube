local completion = require "cc.shell.completion"

fs.makeDir("ice")

local complete = completion.build(
  { completion.choice, { "get", "put" } },
  completion.dir,
  { completion.file, many = true }
)
shell.setCompletionFunction("ice.lua", complete)
