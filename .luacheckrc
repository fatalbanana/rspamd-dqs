codes = true
std = 'min'

exclude_files = {
  '.git/**/',
}

globals = {
  'classifiers',
  'config',
  'confighelp',
  'rspamd_classifiers',
  'rspamd_config',
  'rspamd_count_metatokens',
  'rspamd_gen_metatokens',
  'rspamd_parse_redis_server',
  'rspamd_paths',
  'rspamd_env',
  'rspamd_plugins',
  'rspamd_redis_make_request',
  'rspamd_str_split',
  'rspamd_version',
  'rspamd_maps',
  'rspamd_plugins_state',
  'rspamadm',
  'loadstring',
  'rspamadm_ev_base',
  'rspamadm_session',
  'rspamadm_dns_resolver',
  'jit',
  'table.unpack',
  'table.clear',
  'unpack',
}

ignore = {
}

max_string_line_length = 500
max_comment_line_length = 500
max_line_length = 140
