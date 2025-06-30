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

import ballerina/io;
import ballerinax/mailchimp.'transactional as mailchimp;

configurable string key = ?;
configurable string webhookURL = ?;

final mailchimp:Client mailchimp = check new;

public function main() returns error? {
    mailchimp:WebhooksAddBody addPayload = {
        key,
        url: webhookURL,
        description: "Test webhook"
    };

    mailchimp:InlineResponse20075 addResult = check mailchimp->/webhooks/add.post(addPayload);
    io:println("Webhook created:", addResult.id, addResult);
    mailchimp:WebhooksInfoBody infoPayLoad = {
        key,
        id: <int>addResult.id
    };

    mailchimp:InlineResponse20076 infoResult = check mailchimp->/webhooks/info.post(infoPayLoad);
    io:println("Webhook Info: ", infoResult);

    mailchimp:WebhooksUpdateBody updatePayload = {
        key,
        id: <decimal>addResult.id,
        url: webhookURL
    };
    mailchimp:InlineResponse20077 updateResult = check mailchimp->/webhooks/update.post(updatePayload);
    io:println("Updated webhook :", updateResult);

    mailchimp:WebhooksInfoBody deletePayload = {
        key,
        id: <int>addResult.id
    };
    mailchimp:InlineResponse20078 delResult = check mailchimp->/webhooks/delete.post(deletePayload);
    io:println("Webhook deleted: ", delResult);

}
