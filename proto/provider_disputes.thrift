namespace java dev.vality.disputes.provider
include "proto/domain.thrift"

typedef string ID
typedef string ProviderDisputeID
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
    5: optional ID disputeId
}

union DisputeCreatedResult {
    1: DisputeCreatedSuccessResult successResult
    2: DisputeCreatedFailResult failResult
    3: DisputeAlreadyExistResult alreadyExistResult
    5: DisputeRetryLater retryLater
}

struct DisputeContext {
    1: required ProviderDisputeID providerDisputeId
    2: required domain.Currency currency
    3: required domain.ProxyOptions terminalOptions
    4: optional domain.TransactionInfo transactionInfo
}

union DisputeStatusResult {
    1: DisputeStatusPendingResult statusPending
    2: DisputeStatusSuccessResult statusSuccess
    3: DisputeStatusFailResult statusFail
}

struct TransactionContext {
    1: required ID providerTrxId
    2: required domain.ProxyOptions terminalOptions
    3: required ID invoiceId
    4: required ID paymentId
    5: optional domain.TransactionInfo transactionInfo
}

struct Attachment {
    1: required string sourceUrl
    2: required MIMEType mimeType
}

struct DisputeCreatedSuccessResult {
    1: required ProviderDisputeID providerDisputeId
}

struct DisputeCreatedFailResult {
    1: required domain.Failure failure
}

struct DisputeAlreadyExistResult {}

struct DisputeRetryLater {}

struct DisputeStatusSuccessResult {
    1: optional domain.Amount changedAmount
}

struct DisputeStatusPendingResult {}

struct DisputeStatusFailResult {
    1: required domain.Failure failure
}

struct Cash {
    1: required domain.Amount amount
    2: required domain.Currency currency
}
