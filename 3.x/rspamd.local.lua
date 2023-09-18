local lua_selectors = require "lua_selectors"
local lua_util = require "lua_util"
local rspamd_ip = require "rspamd_ip"
local rspamd_regexp = require "rspamd_regexp"

lua_selectors.register_extractor(rspamd_config, "numeric_urls_reversed", {
  get_value = function(task, args)
    local urls = lua_util.extract_specific_urls({
      flags_mode = 'explicit',
      flags = {'numeric'},
      task = task,
    })
    if not (urls and urls[1]) then return end
    local reversed = {}
    for _, u in ipairs(urls) do
      local addr = rspamd_ip.from_string(u:get_host())
      if addr then
        table.insert(reversed, table.concat(addr:inversed_str_octets(), "."))
      end
    end
    return reversed, 'string'
  end,
  description = 'Numeric URLs',
})

local reconf = config.regexp

local eth_re = [[/^0x[a-fA-F0-9]{40}$/{raw_words}L]]
reconf['ETH_ADDR'] = {
  re = eth_re,
  re_conditions = {
    [eth_re] = function(task, txt, s, e)
      -- NYI: validation!
      local word = lua_util.str_trim(txt:sub(s + 1, e))
      task:insert_result('ETH_ADDR', 1.0, word)
    end
  }
}

local ltc_re = [[/^[LM3][a-km-zA-HJ-NP-Z1-9]{26,33}$/{raw_words}L]]
reconf['LTC_ADDR'] = {
  re = ltc_re,
  re_conditions = {
    [ltc_re] = function(task, txt, s, e)
      -- NYI: validation!
      local word = lua_util.str_trim(txt:sub(s + 1, e))
      task:insert_result('LTC_ADDR', 1.0, word)
    end
  }
}

-- FIXME: likely wrong
local xmr_re = [[/^4[0-9AB][123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz]{93}$/{raw_words}L]]
reconf['XMR_ADDR'] = {
  re = xmr_re,
  re_conditions = {
    [xmr_re] = function(task, txt, s, e)
      -- NYI: validation!
      local word = lua_util.str_trim(txt:sub(s + 1, e))
      task:insert_result('XMR_ADDR', 1.0, word)
    end
  }
}

local xrp_re = [[/^r[rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz]{27,35}$/{raw_words}L]]
reconf['XRP_ADDR'] = {
  re = xrp_re,
  re_conditions = {
    [xrp_re] = function(task, txt, s, e)
      -- NYI: validation!
      local word = lua_util.str_trim(txt:sub(s + 1, e))
      task:insert_result('XRP_ADDR', 1.0, word)
    end
  }
}
