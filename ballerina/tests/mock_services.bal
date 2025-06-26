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

listener http:Listener mockListener = new (9090);

service on mockListener {

    # Adds an email to the allowlist.
    #
    # + return - Returns an error if the operation fails.
    resource function post allowlists/add() returns InlineResponse200|error {
        return {
            email: "test@example.com",
            added: true
        };
    }

    # Lists all emails in the allowlist.
    #
    # + return - Returns an error if the operation fails.
    resource function post allowlists/list() returns InlineResponse2001[]|error {
        return [
            {
                email: "test@example.com",
                detail: "added to list allow list"
            }
        ];
    }

    # Deletes an email from the allowlist.
    #
    # + return - Returns an error if the operation fails.
    resource function post allowlists/delete() returns InlineResponse2002|error {
        return {
            deleted: true,
            email: "test@example.com"
        };
    }

    # Lists all exports.
    #
    # + return - Returns an error if the operation fails.
    resource function post exports/list() returns InlineResponse2004[]|error {
        return [
            {
                id: "",
                state: ""
            }
        ];
    }

    # Exports the allowlist.
    #
    # + return - Returns an error if the operation fails.
    resource function post exports/allowlist() returns InlineResponse2006|error {
        return {
            createdAt: "",
            id: "",
            state: "",
            'type: ""
        };
    }

    # Exports the denylist.
    #
    # + return - Returns an error if the operation fails.
    resource function post exports/rejects() returns InlineResponse2005|error {
        return {
            createdAt: "",
            id: "",
            state: "completed",
            'type: "reject"
        };
    }

    # Exports the whitelist.
    #
    # + return - Returns an error if the operation fails.
    resource function post exports/whitelist() returns InlineResponse2006|error {
        return {
            createdAt: "",
            id: "",
            state: "complete",
            'type: "whitelist"
        };
    }

    # Exports the activity history.
    #
    # + return - Returns an error if the operation fails.
    resource function post exports/activity() returns InlineResponse2007|error {
        return {
            createdAt: "",
            id: "2025-06-19 05:22:13.84634",
            state: "complete",
            'type: "activity"
        };
    }

    # Lists all inbound domains.
    #
    # + return - Returns an error if the operation fails.
    resource function post inbound/domains() returns InlineResponse2008[]|error {
        return [
            {
                domain: "",
                createdAt: "",
                validMx: false
            }
        ];
    }

    # Adds a new inbound domain.
    #
    # + return - Returns an error if the operation fails.
    resource function post inbound/add\-domain() returns InlineResponse2009|error {
        return {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
    }

    # Checks the settings of an inbound domain.
    #
    # + return - Returns an error if the operation fails.
    resource function post inbound/check\-domain() returns InlineResponse20010|error {
        return {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
    }

    # Deletes an inbound domain.
    #
    # + return - Returns an error if the operation fails.
    resource function post inbound/delete\-domain() returns InlineResponse20011|error {
        return {
            domain: "example.com",
            validMx: false,
            createdAt: ""
        };
    }

    # Lists all mailbox routes.
    #
    # + return - Returns an error if the operation fails.
    resource function post inbound/routes() returns InlineResponse20012[]|error {
        return [
            {
                pattern: "",
                id: "",
                url: "example.com"
            }
        ];
    }

    # Adds a new mailbox route.
    #
    # + return - Returns an error if the operation fails.
    resource function post inbound/add\-route() returns InlineResponse20013|error {
        return {
            pattern: "",
            id: "",
            url: "https://example.com/webhook"
        };

    }

    # Lists all IP addresses.
    #
    # + return - Returns an error if the operation fails.
    resource function post ips/list() returns InlineResponse20017[]|error {
        return [
            {
                ip: "",
                domain: "",
                pool: "",
                createdAt: "",
                warmup: {}
            }
        ];
    }
}
