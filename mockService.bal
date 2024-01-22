import ballerina/http;
import ballerina/lang.runtime;
service / on new http:Listener(9091) {
    isolated resource function get candidResult() returns string {
        runtime:sleep(10);
        return "Candid Result";
    }
}
