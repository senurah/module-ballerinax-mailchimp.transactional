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

# Handles requests related to the allowlist functionality.
service /allowlists on mockListener {

    # Adds an email to the allowlist.
    # ```ballerina
    # InlineResponse200 response = {
    #     email: "test@example.com",
    #     added: true
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post add(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Received a request to add to allowlist");
        InlineResponse200 response = {
            email: "test@example.com",
            added: true
        };
        check caller->respond(response);
        return;
    }

    # Lists all emails in the allowlist.
    # ```ballerina
    # InlineResponse2001[] response = [
    #     {
    #         email: "test@example.com",
    #         detail: "added to list allow list"
    #     }
    # ];
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post list(http:Caller caller,http:Request req) returns error?{
        log:printInfo("Received a request to list allowlist");
       InlineResponse2001[] response = [
            {
                email: "test@example.com",
                detail: "added to list allow list"
            }
        ];
        check caller->respond(response);
        return;
    }

    # Deletes an email from the allowlist.
    # ```ballerina
    # InlineResponse2002 response = {
    #     deleted: true,
    #     email: "test@example.com"
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post delete(http:Caller caller,http:Request req) returns error? {
        log:printInfo("Received a request to delete the allowlist");
        InlineResponse2002 respose = {
            deleted: true,
            email: "test@example.com"

        };
        check caller->respond(respose);
        return;

    }
}

# Handles requests related to exporting data.
service /exports on mockListener {

    # Lists all export jobs.
    # ```ballerina
    # InlineResponse2004[] response = [
    #     {}
    # ];
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post list(http:Caller caller,http:Request req) returns error? {
        log:printInfo("Recieved a request to exports list");
        InlineResponse2004[] response = [
            {}
        ];
        check caller->respond(response);
        return;
    }

    # Exports the allowlist.
    # ```ballerina
    # InlineResponse2006 response = {
    #     createdAt: "",
    #     id: "",
    #     state: "",
    #     'type: ""
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post allowlist(http:Caller caller,http:Request req) returns error?{
        log:printInfo("Recieved a request to export allowlists");
        InlineResponse2006 response={
            createdAt: "",
            id: "",
            state: "",
            'type: ""
        };
        check caller->respond(response);
        return;
    }

    # Exports the denylist.
    # ```ballerina
    # InlineResponse2005 response = {
    #     createdAt: "",
    #     id: "",
    #     state: "completed",
    #     'type: "reject"
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post rejects(http:Caller caller, http:Request req) returns error?{
        log:printInfo("Recieved a request to export denylist");
        InlineResponse2005 response = {
            createdAt: "",
            id: "",
            state: "completed",
            'type:"reject"
        };
        check caller->respond(response);
        return;
    }

    # Exports the whitelist.
    # ```ballerina
    # InlineResponse2006 response = {
    #     createdAt: "",
    #     id: "",
    #     state: "complete",
    #     'type: "whitelist"
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post whitelist(http:Caller caller, http:Request req) returns error? {
        log:printInfo("Recieved a request to export allowlist");
        InlineResponse2006 response = {
            createdAt: "",
            id: "",
            state: "complete",
            'type: "whitelist"
        };
        check caller->respond(response);
        return;
    }

    # Exports the activity history.
    # ```ballerina
    # InlineResponse2007 response = {
    #     createdAt: "",
    #     id: "2025-06-19 05:22:13.84634",
    #     state: "complete",
    #     'type: "activity"
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post activity(http:Caller caller,http:Request req) returns error? {
        log:printInfo("Recieved a request to export activity history");
        InlineResponse2007 response = {
            createdAt: "",
            id:"2025-06-19 05:22:13.84634",
            state: "complete",
            'type: "activity"
        };
        check caller->respond(response);
        return;
    }
}

# Handles requests related to inbound domains and mailbox routes.
service /inbound on mockListener {

    # Lists all inbound domains.
    # ```ballerina
    # InlineResponse2008[] response = [
    #     {
    #         domain: "",
    #         createdAt: "",
    #         validMx: false
    #     }
    # ];
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post domains(http:Caller caller,http:Request req) returns error?{
        log:printInfo("Recieved a request to list inbound domains");
        InlineResponse2008[] resposnse =[
            {domain:"",
            createdAt:"",
            validMx: false}
        ];
        check caller->respond(resposnse);
        return;
    }

    # Adds a new inbound domain.
    # ```ballerina
    # InlineResponse2009 response = {
    #     domain: "example.com",
    #     validMx: false,
    #     createdAt: ""
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post add\-domain(http:Caller caller,http:Request req)returns error?{
        log:printInfo("Recieved a request to add inbound domain");
        InlineResponse2009 response = {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
        check caller->respond(response);
        return;
    }

    # Checks the settings of an inbound domain.
    # ```ballerina
    # InlineResponse20010 response = {
    #     domain: "example.com",
    #     validMx: false,
    #     createdAt: ""
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post check\-domain(http:Caller caller,http:Request req) returns error? {
        log:printInfo("Recieved a request to check inbound domain settings");
        InlineResponse20010 response = {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
        check caller->respond(response);
        return;
    }

    # Deletes an inbound domain.
    # ```ballerina
    # InlineResponse20011 response = {
    #     domain: "example.com",
    #     validMx: false,
    #     createdAt: ""
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post delete\-domain(http:Caller caller,http:Request req) returns  error? {
        log:printInfo("Recieved a request to delete inbound domain");
        InlineResponse20011 response = {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
        check caller->respond(response);
        return;      
    }

    # Deletes an inbound domain.
    # ```ballerina
    # InlineResponse20011 response = {
    #     domain: "example.com",
    #     validMx: false,
    #     createdAt: ""
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post routes(http:Caller caller,http:Request req) returns error? {
        log:printInfo("Recieved a request to list mailbox routes");
        InlineResponse20012[] response = [
            {
                pattern: "",
                id: "",
                url: "example.com"
            }
        ];
        check caller->respond(response);
        return;
    }

    # Adds a new mailbox route.
    # ```ballerina
    # InlineResponse20013 response = {
    #     pattern: "",
    #     id: "",
    #     url: "https://example.com/webhook"
    # };
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post add\-route(http:Caller caller,http:Request req) returns error?{
        log:printInfo("Recieved a request to add mailbox route");
        InlineResponse20013 response = {
            pattern: "",
            id: "",
            url: "https://example.com/webhook"
        };
        check caller->respond(response);
        return;
    }
}

# Handles requests related to IP addresses.
service /ips on mockListener {

    # Lists all IP addresses.
    # ```ballerina
    # InlineResponse20017[] response = [
    #     {
    #         ip: "",
    #         domain: "",
    #         pool: "",
    #         createdAt: "",
    #         warmup: {}
    #     }
    # ];
    # ```
    #
    # + caller - Represents the client making the request.
    # + req - The HTTP request received by the service.
    # + return - Returns an error if the operation fails.
    resource function post list(http:Caller caller,http:Request req) returns error? {
        log:printInfo("Recieved a request to list IP addresses");
        InlineResponse20017[] response= [
            {
                ip: "",
                domain: "",
                pool: "",
                createdAt: "",
                warmup: {}
            }
        ];
        check caller->respond(response);
        return;
    }
}

# Initializes the mock service.
# ```ballerina
# check initMockService();
# ```
#
# + return - Returns an error if the mock service initialization fails.
public function initMockService()returns error?{
    log:printInfo("Starting mock service");
    check mockListener.'start();
}