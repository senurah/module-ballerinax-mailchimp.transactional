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

import ballerina/http;
import ballerina/log;

listener http:Listener mockListener = new (9090);

service on mockListener {

    # Adds an email to the allowlist.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post allowlists/add(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to add to allowlist");
        InlineResponse200 response = {
            email: "test@example.com",
            added: true
        };
        check caller->respond(response);
    }

    # Lists all emails in the allowlist.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post allowlists/list(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to list allowlist");
        InlineResponse2001[] response = [
            {
                email: "test@example.com",
                detail: "added to list allow list"
            }
        ];
        check caller->respond(response);
    }

    # Deletes an email from the allowlist.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post allowlists/delete(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to delete from allowlist");
        InlineResponse2002 response = {
            deleted: true,
            email: "test@example.com"
        };
        check caller->respond(response);
    }

    # Lists all exports.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post exports/list(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to list exports");
        InlineResponse2004[] response = [{}];
        check caller->respond(response);
    }

    # Exports the allowlist.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post exports/allowlist(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to export allowlist");
        InlineResponse2006 response = {
            createdAt: "",
            id: "",
            state: "",
            'type: ""
        };
        check caller->respond(response);
    }

    # Exports the denylist.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post exports/rejects(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to export denylist");
        InlineResponse2005 response = {
            createdAt: "",
            id: "",
            state: "completed",
            'type: "reject"
        };
        check caller->respond(response);
    }

    # Exports the whitelist.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post exports/whitelist(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to export whitelist");
        InlineResponse2006 response = {
            createdAt: "",
            id: "",
            state: "complete",
            'type: "whitelist"
        };
        check caller->respond(response);
    }

    # Exports the activity history.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post exports/activity(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to export activity history");
        InlineResponse2007 response = {
            createdAt: "",
            id: "2025-06-19 05:22:13.84634",
            state: "complete",
            'type: "activity"
        };
        check caller->respond(response);
    }

    # Lists all inbound domains.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post inbound/domains(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to list inbound domains");
        InlineResponse2008[] response = [
            {
                domain: "",
                createdAt: "",
                validMx: false
            }
        ];
        check caller->respond(response);
    }

    # Adds a new inbound domain.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post inbound/add\-domain(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to add inbound domain");
        InlineResponse2009 response = {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
        check caller->respond(response);
    }

    # Checks the settings of an inbound domain.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post inbound/check\-domain(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to check inbound domain settings");
        InlineResponse20010 response = {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
        check caller->respond(response);
    }

    # Deletes an inbound domain.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post inbound/delete\-domain(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to delete inbound domain");
        InlineResponse20011 response = {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
        check caller->respond(response);
    }

    # Lists all mailbox routes.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post inbound/routes(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to list mailbox routes");
        InlineResponse20012[] response = [
            {
                pattern: "",
                id: "",
                url: "example.com"
            }
        ];
        check caller->respond(response);
    }

    # Adds a new mailbox route.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post inbound/add\-route(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to add mailbox route");
        InlineResponse20013 response = {
            pattern: "",
            id: "",
            url: "https://example.com/webhook"
        };
        check caller->respond(response);
    }

    # Lists all IP addresses.
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post ips/list(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to list IP addresses");
        InlineResponse20017[] response = [
            {
                ip: "",
                domain: "",
                pool: "",
                createdAt: "",
                warmup: {}
            }
        ];
        check caller->respond(response);
    }
}

# Initializes the mock service.
# 
# + return - Returns an error if the mock service initialization fails.
public function initMockService() returns error? {
    log:printInfo("Starting mock service");
    check mockListener.'start();
}