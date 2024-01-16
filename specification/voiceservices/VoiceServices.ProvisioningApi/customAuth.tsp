import "@typespec/http";

using TypeSpec.Http;

namespace Custom.Auth;

/**
 * Custom Auth Flow for Azure Active Directory OAuth2 matching previous implementation
 * @template TokenUrl The token URL.
 * @template Scopes A list of scopes the token applies to.
 */
model CustomTokenAuthFlow<Scopes extends string[], TokenUrl extends string>
    extends TypeSpec.Http.ClientCredentialsFlow {
    type: OAuth2FlowType.clientCredentials;
    tokenUrl: TokenUrl;
    scopes: Scopes;
}

/**
 * Azure Active Directory OAuth2 Flow
 * @template AuthUrl The authorization URL.
 * @template TokenUrl The token URL.
 * @template Scopes A list of scopes the token applies to.
 */
@doc("The Azure Active Directory OAuth2 Flow")
model Oauth2<
    Scopes extends string[],
    TokenUrl extends string = "https://login.microsoftonline.com/common/oauth2/v2.0/token"
> is OAuth2Auth<[CustomTokenAuthFlow<Scopes, TokenUrl>]>;
