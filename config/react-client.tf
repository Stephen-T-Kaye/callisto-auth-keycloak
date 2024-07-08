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

  valid_redirect_uris = [
    var.callisto_url != "" ? "${var.callisto_url}/*" : "*",
  ]
  web_origins = [
    var.callisto_url != "" ? var.callisto_url : "*",
  ]
}

resource "keycloak_openid_user_property_protocol_mapper" "user_property_mapper" {
  count     = var.include_test_users ? 0 : 1
  realm_id  = keycloak_realm.callisto.id
  client_id = keycloak_openid_client.react_client.id
  name      = "personIdProperty"

  user_property = "id"
  claim_name    = "personId"
}

resource "keycloak_openid_user_attribute_protocol_mapper" "user_property_mapper" {
  count     = var.include_test_users ? 1 : 0
  realm_id  = keycloak_realm.callisto.id
  client_id = keycloak_openid_client.react_client.id
  name      = "personIdAttribute"

  user_attribute = "unique_identifier"
  claim_name    = "personId"
}
