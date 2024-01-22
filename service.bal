import ballerina/http;
import ballerina/log;
// import ballerinax/candid.charitycheckpdf;
// import ballerina/lang.runtime;

// charitycheckpdf:ApiKeysConfig keyConfig = {};
// final charitycheckpdf:Client charityClient = check new charitycheckpdf:Client(keyConfig, config = {timeout: 20});

final http:Client charityClient = check new("http://localhost:9091", timeout = 5);

service / on new http:Listener(9090) {
    isolated resource function get charitysearch/charitycheckpdf/[string ein]() returns  http:Response| error {
        // runtime:sleep(30);
        do {
            log:printError("Before");
            http:Response result = check charityClient->/candidResult();
            log:printError("After");
            return result;
        } on fail error err {
            log:printError(err.message());
            return err;
        }
    }
}
