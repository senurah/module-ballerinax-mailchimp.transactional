import ballerina/io;
import ballerinax/mailchimp.'transactional as mailchimp;

configurable string key = ?;
const string serviceUrl = "https://mandrillapp.com/api/1.0";

final mailchimp:Client mailchimp = check new ({}, serviceUrl);

public function main() returns error? {
    string templateName = "signup--template";
    mailchimp:TemplatesAddBody addPayload = {
        key,
        name: templateName,
        text: "Sample template",
        publish: true
    };
    mailchimp:InlineResponse20060 template = check mailchimp->/templates/add.post(addPayload);
    io:println("Template added: ", template.publishedAt, template.name);

    mailchimp:TemplatesInfoBody infoPayload = {
        key,
        name: templateName
    };

    mailchimp:InlineResponse20061 info = check mailchimp->/templates/info.post(infoPayload);
    io:println("Template Info: Published at", info.publishedAt);

    mailchimp:InlineResponse20063 publish = check mailchimp->/templates/publish.post(infoPayload);
    io:println("Published template: ", publish.publishName);

    mailchimp:TemplatesRenderBody renderPayload = {
        key,
        templateName: templateName,
        templateContent: [
            {
                name: "Sign Up",
                content: "Context"
            }
        ],
        mergeVars: [
            {}
        ]
    };

    mailchimp:InlineResponse20066 rendered = check mailchimp->/templates/render.post(renderPayload);
    io:println("Renered HTML: ", rendered);

    mailchimp:TemplatesListBody listPayload = {
        key
    };
    mailchimp:InlineResponse20065[] listTemplates = check mailchimp->/templates/list.post(listPayload);
    io:println("Template list: ");
    foreach mailchimp:InlineResponse20065 item in listTemplates {
        io:println(item.name);
    }

    mailchimp:InlineResponse20064 deleteTemplate = check mailchimp->/templates/delete.post(infoPayload);
    io:println("Deleted Template: ", deleteTemplate.name);

}
