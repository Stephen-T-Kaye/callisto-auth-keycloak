resource "keycloak_openid_client" "react_client" {
  lifecycle {
    prevent_destroy = true
  }

  realm_id = keycloak_realm.callisto.id

  client_id = "callistoreactclient"
  name      = "React client Callisto"
  enabled   = true

  access_type                              = "PUBLIC"
  exclude_session_state_from_auth_response = false
  standard_flow_enabled                    = true
  direct_access_grants_enabled             = true
  service_accounts_enabled                 = false

  admin_url = "https://web.dev.callisto-notprod.homeoffice.gov.uk/"
  root_url  = "https://web.dev.callisto-notprod.homeoffice.gov.uk/"
  valid_redirect_uris = [
    "https://web.dev.callisto.homeoffice.gov.uk/*",
    "https://web.dev.callisto-notprod.homeoffice.gov.uk/*",
  ]
  web_origins = [
    "https://web.dev.callisto.homeoffice.gov.uk",
    "https://web.dev.callisto.homeoffice-notprod.gov.uk",
  ]
}

resource "keycloak_openid_user_property_protocol_mapper" "user_property_mapper" {
  realm_id  = keycloak_realm.callisto.id
  client_id = keycloak_openid_client.react_client.id
  name      = "personId"

  user_property = "id"
  claim_name    = "personId"
}
