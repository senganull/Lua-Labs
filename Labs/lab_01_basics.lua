-- lab_01_basics.lua

--[[
1. グローバル汚染の回避(local)
2. 唯一のデータ構造(table)
3. 1始まりのインデックス(1-based indexing)

TL;DR
- スコープとは「その変数が読み書きできる有効範囲」のこと
- Luaにおいて`local`を省略するとグローバル変数となり、プログラムの
どこからでもアクセス・上書きが可能になる。
- 予期せぬバグ(特にFiveMでの変数の衝突)を防ぐため、常に`local`を使い
スコープを最小化するのが鉄則
]]

-- 1. 変数とスコープ
-- デフォでグローバル汚染するので、変数は必ずlocal宣言
local player_name = "null"
local max_health = 100

-- 2. テーブル
-- 配列、連想配列、オブジェクト、クラス(代替)をすべてこれで表現する
local vehicle_config = {
    model = "t20",
    engine_level = 4,
    colors = {255, 0, 0}
}

-- 3. 1-based indexing (配列の添字は1から)
local weapons = {"WEAPON_PISTOL", "WEAPON_ASSALUTRIFLE"}

-- 最初の要素にアクセス
print("First weapon: " .. weapons[1]) -- WEAPON_PISTOL

-- #演算子で配列の要素数を取得
print("Weapon count: " .. #weapons) --2

-- テーブル(連想配列)へのアクセス
print("Vehicle model: " .. vehicle_config.model) -- t20

