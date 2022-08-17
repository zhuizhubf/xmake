--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- Copyright (C) 2015-present, TBOOX Open Source Group.
--
-- @author      SirLynix, ruki
-- @file        xmake.lua
--

-- copy other files generated by emcc (see https://emscripten.org/docs/tools_reference/emcc.html#emcc-o-target)
rule("platform.wasm.installfiles")
    on_load("wasm", function (target)
        if not target:is_binary() then
            return
        end
        local targetfile = target:targetfile()
        target:add("installfiles", targetfile:gsub("%.html", ".js"), { prefixdir = "bin" })
        target:add("installfiles", targetfile:gsub("%.html", ".mem"), { prefixdir = "bin" })
        target:add("installfiles", targetfile:gsub("%.html", ".mjs"), { prefixdir = "bin" })
        target:add("installfiles", targetfile:gsub("%.html", ".wasm"), { prefixdir = "bin" })
    end)
