namespace java dev.vality.disputes
include "proto/domain.thrift"

typedef string ID
typedef string MIMEType

service ProviderDisputesService {

    DisputeCreatedResult CreateDispute (1: DisputeParams disputeParams)

    DisputeStatusResult CheckDisputeStatus (1: DisputeContext disputeContext)

}

struct DisputeParams {
    1: required TransactionContext transactionContext
    2: required list<Attachment> attachments
    3: optional Cash cash
    4: optional string reason
}

union DisputeCreatedResult {
    1: DisputeCreatedSuccessResult successResult
    2: DisputeCreatedFailResult failResult
}

struct DisputeContext {
    1: required ID disputeId
    2: required domain.ProxyOptions terminalOptions
}

union DisputeStatusResult {
    1: DisputeStatusPendingResult pendingSuccess
    2: DisputeStatusSuccessResult statusSuccess
    3: DisputeStatusFailResult statusFail
}

struct TransactionContext {
    1: required ID providerTrxId
    2: required domain.ProxyOptions terminalOptions
    3: optional ID invoiceId
    4: optional ID paymentId
}

struct Attachment {
    1: required string sourceUrl
    2: optional MIMEType mimeType
}

struct DisputeCreatedSuccessResult {
    1: required ID disputeId
}

struct DisputeCreatedFailResult {
    1: required domain.Failure failure
}

struct DisputeStatusSuccessResult {
    1: optional domain.Amount changedAmount
}

struct DisputeStatusPendingResult {}

struct DisputeStatusFailResult {
    1: required domain.Failure failure
}

struct Cash {
    1: required domain.Amount   amount
    2: required domain.Currency currency
}
