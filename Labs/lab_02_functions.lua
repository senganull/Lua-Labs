-- lab_02_functions.lua

--[[
TL;DR
- Luaの関数は第一級オブジェクト(変数への代入や引数として渡すことが可能)
- 複数の戻り値を同時に返すことができる
- 匿名関数(コールバック)はFiveMのイベント処理で多用される。
]]

-- 1. 基本的な関数の定義
local function calculate_damage(base_attack, defense)
    local damage = base_attack - defense
    if damage < 0 then 
        damage = 0
    end
    local is_critical = damage > 50 --unkwown

    --Luaは複数の戻り値をカンマ区切りで返せる
    return damage, is_critical
end

-- 複数戻り値の受け取り
local dmg, crit = calculate_damage(100, 30)
print("Damage: " .. dmg .. ", Critical: " .. tostring(crit))




-- 2. 関数を変数に代入(無名関数)
local execute_action = function(action_name)
    print("Action: " .. action_name)
end

execute_action("Run")





-- 3. コールバック関数
-- 関数を別の関数の「引数」として渡す
local function register_event(event_name, callback_func)
    print("Event Registerd: " .. event_name)
    -- 任意のタイミングで渡された関数を実行
    callback_func("player_01")
end

-- 関数呼び出しの引数として、直接function() ~ end を記述する
register_event("onPlayerDeath", function(killer_id)
    print("Callbakc triggered by: " .. killer_id)
end)
