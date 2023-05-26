local lua_selectors = require "lua_selectors"

lua_selectors.register_extractor(rspamd_config, "numeric_urls", {
  get_value = function(task, args)
    local urls = task:get_urls()
    if not urls or not urls[1] then return end
    local numeric_urls = {}
    for _, u in ipairs(urls) do
      local flags = u:get_flags()
      if flags.numeric then
        table.insert(numeric_urls, u:get_host())
      end
    end
    if numeric_urls[1] then return numeric_urls, 'string' end
  end,
  description = 'Numeric URLs',
})
