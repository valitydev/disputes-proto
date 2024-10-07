namespace java dev.vality.disputes

typedef string DisputeID
typedef string MIMEType

service MerchantDisputesService {

    DisputeCreatedResult CreateDispute (1: DisputeParams disputeParams)

    DisputeStatusResult CheckDisputeStatus (1: DisputeContext disputeContext)

}

union DisputeCreatedResult {
    1: DisputeCreatedSuccessResult successResult
    2: DisputeAlreadyExistResult alreadyExistResult
}

struct DisputeCreatedSuccessResult {
    1: required DisputeID disputeId
}

struct DisputeAlreadyExistResult {}

struct DisputeParams {
    1: required string invoiceId
    2: required string paymentId
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
    1: required string message
}

struct DisputeContext {
    1: required DisputeID disputeId
    2: required string invoiceId
    3: required string paymentId
}
