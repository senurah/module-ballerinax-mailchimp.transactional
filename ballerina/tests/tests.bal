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

configurable string MAILCHIMP_API_KEY=?;
configurable boolean useMock=?;
//Service Urls: mock service
string mockServiceUrl = "http://localhost:9090";
string mandrillServiceUrl = "https://mandrillapp.com/api/1.0";
string serviceUrl= useMock? mockServiceUrl:mandrillServiceUrl;

ConnectionConfig config = check {};

Client mailchimp = check new(config, serviceUrl);

@test:Config{
    groups: ["mock","live"]
}
function testAddToAllowlist() returns error? {
    AllowlistsAddBody payload = {
        email: "test@example.com",
        key:MAILCHIMP_API_KEY,
        comment: "Adding to allowlist for testing"

    };
    var result = mailchimp->/allowlists/add.post(payload);
    test:assertFalse(result is error, msg="Failed to add email to allowlist");
    if result is InlineResponse200 {
        test:assertEquals(result.email, "test@example.com", msg = "Wrong email");
        test:assertEquals(result.added, true, msg = "Email not added");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]

}
function testListAllowlist() returns error? {
    AllowlistsListBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/allowlists/list.post(payload);
    test:assertFalse(result is error, msg = "Failed to list allowlist");
    if result is InlineResponse2001[] {
        test:assertTrue(result.length() >= 0, msg = "Empty allowlist or unexpected format");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]

}
function testDeleteFromAllowlist() returns error? {
    AllowlistsDeleteBody payload = {
        email: "test@example.com",
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/allowlists/delete.post(payload);
    test:assertFalse(result is error, msg = "Failed to delete email from allowlist");
    if result is InlineResponse2002 {
        test:assertEquals(result.email, "test@example.com", msg = "Wrong email deleted");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]

}
function testListExports() returns error? {
    ExportsListBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/exports/list.post(payload);
    test:assertFalse(result is error, msg = "Failed to list exports");
    if result is InlineResponse2004[] {
        test:assertTrue(result.length() >= 0, msg = "Unexpected exports list format");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]
}
function testExportAllowlist() returns error? {
    ExportsRejectsBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/exports/allowlist.post(payload);
    test:assertFalse(result is error, msg = "Failed to export allowlist");
    if result is InlineResponse2006 {
        test:assertTrue(result.id != null,msg = "Export allowlist missing id");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock"]

}
function testExportDenylist() returns error? {
    ExportsRejectsBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/exports/rejects.post(payload);
    test:assertFalse(result is error, msg = "Failed to export denylist");
    if result is InlineResponse2005 {
        test:assertTrue(result.id != null, msg = "Missing export ID in denylist response");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock"]

}
function testExportWhitelist() returns error? {
    ExportsRejectsBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/exports/whitelist.post(payload);
    test:assertFalse(result is error, msg = "Failed to export whitelist");
    if result is InlineResponse2006 {
        test:assertTrue(result.id != null, msg = "Missing export ID in whitelist response");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock"]

}
function testExportActivity() returns error? {
    ExportsActivityBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/exports/activity.post(payload);
    test:assertFalse(result is error, msg = "Failed to export activity");
    if result is InlineResponse2007 {
        test:assertTrue(result.hasKey("id"), msg = "Missing export ID in activity response");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]

}
function testListInboundDomains() returns error? {
    ExportsListBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/inbound/domains.post(payload);
    test:assertFalse(result is error, msg = "Failed to list inbound domains");
    if result is InlineResponse2008[] {
        test:assertTrue(result.length() >= 0, msg = "Unexpected inbound domain list format");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]
}
function testAddInboundDomain() returns error? {
    InboundAddDomainBody payload = {
        key: MAILCHIMP_API_KEY,
        domain: "example.com"
    };
    var result = mailchimp->/inbound/add\-domain.post(payload);
    test:assertFalse(result is error, msg = "Failed to add inbound domain");
    if result is InlineResponse2009 {
        test:assertEquals(result.domain, "example.com", msg = "Domain mismatch in add response");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]
}
function testCheckInboundDomain() returns error? {
    InboundCheckDomainBody payload = {
        key: MAILCHIMP_API_KEY,
        domain: "example.com"
    };
    var result = mailchimp->/inbound/check\-domain.post(payload);
    test:assertFalse(result is error, msg = "Failed to check inbound domain");
    if result is InlineResponse20010 {
        test:assertEquals(result.domain, "example.com", msg = "Domain mismatch in check response");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]
}
function testDeleteInboundDomain() returns error? {
    InboundCheckDomainBody payload = {
        key: MAILCHIMP_API_KEY,
        domain: "example.com"
    };
    var result = mailchimp->/inbound/delete\-domain.post(payload);
    test:assertFalse(result is error, msg = "Failed to delete inbound domain");
    if result is InlineResponse20011 {
        test:assertEquals(result.domain, "example.com", msg = "Domain mismatch in delete response");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock"]
}
function testListMailboxRoutes() returns error? {
    InboundRoutesBody payload = {
        key: MAILCHIMP_API_KEY,
        domain: "example.com"
    };
    var result = mailchimp->/inbound/routes.post(payload);
    test:assertFalse(result is error, msg = "Failed to list mailbox routes");
    if result is InlineResponse20012[] {
        test:assertTrue(result.length() >= 0, msg = "Unexpected mailbox route list format");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock"]
}
function testAddMailboxRoute() returns error? {
    InboundAddRouteBody payload = {
        key: MAILCHIMP_API_KEY,
        domain: "example.com",
        pattern: ".*",
        url: "https://example.com/webhook"
    };
    var result = mailchimp->/inbound/add\-route.post(payload);
    test:assertFalse(result is error, msg = "Failed to add mailbox route");
    if result is InlineResponse20013 {
        test:assertNotEquals(result.id, (), msg = "Route ID missing in add route response");
    } else {
        return error("Unexpected response format");
    }
}

@test:Config{
    groups: ["mock","live"]
}
function testListIps() returns error? {
    ExportsListBody payload = {
        key: MAILCHIMP_API_KEY
    };
    var result = mailchimp->/ips/list.post(payload);
    test:assertFalse(result is error, msg = "Failed to list IPs");
    if result is InlineResponse20017[] {
        test:assertTrue(result.length() >= 0, msg = "Unexpected IP list format");
    } else {
        return error("Unexpected response format");
    }
}
