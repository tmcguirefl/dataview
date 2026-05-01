NB. api_health.ijs — GET /api/health

coclass 'apihealth'
coinsert 'jhs'

jev_get_api_health_ =: 3 : 0
  japi_ok '{"status":"ok","service":"modelscope-j","version":"0.1.0"}'
)
