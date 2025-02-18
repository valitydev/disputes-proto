namespace java dev.vality.disputes.merchant

typedef string DisputeID
typedef string MIMEType
typedef string ID

exception DisputeNotFound {}

service MerchantDisputesService {

    DisputeCreatedResult CreateDispute (1: DisputeParams disputeParams)

    DisputeStatusResult CheckDisputeStatus (1: DisputeContext disputeContext) throws (1: DisputeNotFound ex);

}

union DisputeCreatedResult {
    1: DisputeCreatedSuccessResult successResult
}

struct DisputeCreatedSuccessResult {
    1: required DisputeID disputeId
}

struct DisputeParams {
    1: required ID invoiceId
    2: required ID paymentId
    3: required list<Attachment> attachments
}

struct Attachment {
    1: required binary data
    2: required MIMEType mimeType
}

union DisputeStatusResult {
    1: DisputeStatusPendingResult statusPending
    2: DisputeStatusSuccessResult statusSuccess
    3: DisputeStatusFailResult statusFail
}

struct DisputeStatusSuccessResult {}

struct DisputeStatusPendingResult {}

struct DisputeStatusFailResult {
    1: optional string mapping
}

struct DisputeContext {
    1: required DisputeID disputeId
}
