// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;

configurable string key = "test";
configurable boolean isLiveServer = false;

const string MOCK_SERVER_URL = "http://localhost:9090";
const string LIVE_SERVER_URL = "https://mandrillapp.com/api/1.0";
string serviceUrl = isLiveServer ? LIVE_SERVER_URL : MOCK_SERVER_URL;
Client mailchimp = check new ({}, serviceUrl);

@test:Config {
    groups: ["mock", "live"]
}
function testAddToAllowlist() returns error? {
    AllowlistsAddBody payload = {
        email: "test@example.com",
        key,
        comment: "Adding to allowlist for testing"
    };
    InlineResponse200 result = check mailchimp->/allowlists/add.post(payload);
    test:assertEquals(result.email, "test@example.com", msg = "Wrong email");
    test:assertEquals(result.added, true, msg = "Email not added");
}

@test:Config {
    groups: ["mock", "live"]
}
function testListAllowlist() returns error? {
    AllowlistsListBody payload = {
        key
    };
    InlineResponse2001[] result = check mailchimp->/allowlists/list.post(payload);
    test:assertFalse(result !is InlineResponse2001[], msg = "Failed to list allowlist");
    test:assertTrue(result.length() >= 0, msg = "Empty allowlist or unexpected format");
}

@test:Config {
    groups: ["mock", "live"]
}
function testDeleteFromAllowlist() returns error? {
    AllowlistsDeleteBody payload = {
        email: "test@example.com",
        key
    };
    InlineResponse2002 result = check mailchimp->/allowlists/delete.post(payload);
    test:assertFalse(result !is InlineResponse2002, msg = "Failed to delete email from allowlist");
    test:assertEquals(result.email, "test@example.com", msg = "Wrong email deleted");
}

@test:Config {
    groups: ["mock", "live"]
}
function testListExports() returns error? {
    ExportsListBody payload = {
        key
    };
    InlineResponse2004[] result = check mailchimp->/exports/list.post(payload);
    test:assertFalse(result !is InlineResponse2004[], msg = "Failed to list exports");
    test:assertTrue(result.length() >= 0, msg = "Unexpected exports list format");
}

@test:Config {
    groups: ["mock", "live"]
}
function testExportAllowlist() returns error? {
    ExportsRejectsBody payload = {
        key
    };
    InlineResponse2006 result = check mailchimp->/exports/allowlist.post(payload);
    test:assertFalse(result !is InlineResponse2006, msg = "Failed to export allowlist");
    test:assertTrue(result.id != null, msg = "Export allowlist missing id");
}

@test:Config {
    groups: ["mock"]
}
function testExportDenylist() returns error? {
    ExportsRejectsBody payload = {
        key
    };
    InlineResponse2005 result = check mailchimp->/exports/rejects.post(payload);
    test:assertFalse(result !is InlineResponse2005, msg = "Failed to export denylist");
    test:assertTrue(result.id != null, msg = "Missing export ID in denylist response");
}

@test:Config {
    groups: ["mock"]
}
function testExportWhitelist() returns error? {
    ExportsRejectsBody payload = {
        key
    };
    InlineResponse2006 result = check mailchimp->/exports/whitelist.post(payload);
    test:assertFalse(result !is InlineResponse2006, msg = "Failed to export whitelist");
    test:assertTrue(result.id != null, msg = "Missing export ID in whitelist response");
}

@test:Config {
    groups: ["mock"]
}
function testExportActivity() returns error? {
    ExportsActivityBody payload = {
        key
    };
    InlineResponse2007 result = check mailchimp->/exports/activity.post(payload);
    test:assertFalse(result !is InlineResponse2007, msg = "Failed to export activity");
    test:assertTrue(result.hasKey("id"), msg = "Missing export ID in activity response");
}

@test:Config {
    groups: ["mock", "live"]
}
function testListInboundDomains() returns error? {
    ExportsListBody payload = {
        key
    };
    InlineResponse2008[] result = check mailchimp->/inbound/domains.post(payload);
    test:assertFalse(result !is InlineResponse2008[], msg = "Failed to list inbound domains");
    test:assertTrue(result.length() >= 0, msg = "Unexpected inbound domain list format");
}

@test:Config {
    groups: ["mock", "live"]
}
function testAddInboundDomain() returns error? {
    InboundAddDomainBody payload = {
        key,
        domain: "example.com"
    };
    InlineResponse2009 result = check mailchimp->/inbound/add\-domain.post(payload);
    test:assertFalse(result !is InlineResponse2009, msg = "Failed to add inbound domain");
    test:assertEquals(result.domain, "example.com", msg = "Domain mismatch in add response");
}

@test:Config {
    groups: ["mock", "live"]
}
function testCheckInboundDomain() returns error? {
    InboundCheckDomainBody payload = {
        key,
        domain: "example.com"
    };
    InlineResponse20010 result = check mailchimp->/inbound/check\-domain.post(payload);
    test:assertFalse(result !is InlineResponse20010, msg = "Failed to check inbound domain");
    test:assertEquals(result.domain, "example.com", msg = "Domain mismatch in check response");
}

@test:Config {
    groups: ["mock", "live"]
}
function testDeleteInboundDomain() returns error? {
    InboundCheckDomainBody payload = {
        key,
        domain: "example.com"
    };
    InlineResponse20011 result = check mailchimp->/inbound/delete\-domain.post(payload);
    test:assertFalse(result !is InlineResponse20011, msg = "Failed to delete inbound domain");
    test:assertEquals(result.domain, "example.com", msg = "Domain mismatch in delete response");
}

@test:Config {
    groups: ["mock"]
}
function testListMailboxRoutes() returns error? {
    InboundRoutesBody payload = {
        key,
        domain: "example.com"
    };
    InlineResponse20012[] result = check mailchimp->/inbound/routes.post(payload);
    test:assertFalse(result !is InlineResponse20012[], msg = "Failed to list mailbox routes");
    test:assertTrue(result.length() >= 0, msg = "Unexpected mailbox route list format");
}

@test:Config {
    groups: ["mock"]
}
function testAddMailboxRoute() returns error? {
    InboundAddRouteBody payload = {
        key,
        domain: "example.com",
        pattern: ".*",
        url: "https://example.com/webhook"
    };
    InlineResponse20013 result = check mailchimp->/inbound/add\-route.post(payload);
    test:assertFalse(result !is InlineResponse20013, msg = "Failed to add mailbox route");
    test:assertNotEquals(result.id, (), msg = "Route ID missing in add route response");
}

@test:Config {
    groups: ["mock", "live"]
}
function testListIps() returns error? {
    ExportsListBody payload = {
        key
    };
    InlineResponse20017[] result = check mailchimp->/ips/list.post(payload);
    test:assertFalse(result !is InlineResponse20017[], msg = "Failed to list IPs");
    test:assertTrue(result.length() >= 0, msg = "Unexpected IP list format");
}
