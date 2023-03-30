local expect = require "cc.expect"
local pretty = require "cc.pretty"

local tArgs = {...}
pretty.pretty_print(tArgs)

function install(id)
    local packLoc = http.get("https://icecube.badgeminer2.repl.co/add/"..id)
    local packpos =packLoc.readAll()
    local pack = http.get(packpos.."/pkg.json")
    local pkgd = textutils.unserialiseJSON(pack.readAll())
    local file = fs.open("ice/"..id..".lua", "w")
    local pkg = http.get(packpos.."/"..pkgd.file)
    file.write(pkg.readAll())
    file.close()
    for index, value in ipairs(pkgd.requires) do
        install(value)
    end
end

if tArgs[1] == "add" then
    install(tArgs[2])
else
    print("not  "..tArgs[1])
end
