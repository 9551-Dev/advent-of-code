local input = fs.open("1/input.txt","r")

local current_slave = 1

local data = input:readAll()
input:close()

local slaves = {}
local slave_lookup = {}
local current_slave = 0

for slave in data:gsub("\n\n","!"):gmatch("[^!]+") do
    current_slave = current_slave + 1

    local total_calories = 0
    for calories in slave:gmatch("[^\n]+") do
        total_calories = total_calories + tonumber(calories)
    end

    slaves[current_slave] = total_calories
    slave_lookup[total_calories] = current_slave
end

local top_calories = math.max(table.unpack(slaves))

print(("The most valued slave is slave %d carrying %d calories"):format(
    slave_lookup[top_calories],top_calories
))