namespace java dev.vality.disputes.callback
include "proto/domain.thrift"
include "provider_disputes.thrift"

typedef provider_disputes.ID ID
typedef provider_disputes.ProviderDisputeID ProviderDisputeID
typedef provider_disputes.TransactionContext TransactionContext
typedef provider_disputes.DisputeStatusResult DisputeStatusResult

service ProviderDisputesCallbackService {

    void ChangeStatus (1: DisputeCallbackParams disputeCallbackParams)

}

struct DisputeCallbackParams {
    1: required TransactionContext transactionContext
    2: required ProviderDisputeID providerDisputeID
    3: required DisputeStatusResult disputeStatusResult
}
