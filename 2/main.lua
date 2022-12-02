local input = fs.open("2/input.txt","r")
local data = input:readAll()
input:close()

local opponent_lookup = {
    A=1,
    B=2,
    C=3
}

local self_lookup = {
    X=1,
    Y=2,
    Z=3
}

local rules = {
    3,1,2
}

local score = 0

for round in data:gmatch("[^\n]+") do
    local opponent_move = opponent_lookup[round:sub(1,1)]
    local self_move     = self_lookup    [round:sub(3,3)]

    if self_move == opponent_move then
        score = score + self_move + 3
        print("same")
    elseif self_move == rules[opponent_move] then
        score = score + self_move
        print("lost")
    elseif rules[self_move] == opponent_move then
        score = score + self_move + 6
        print("won")
    end
end

print("The total score is "..score)