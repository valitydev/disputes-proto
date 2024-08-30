namespace java dev.vality.disputes.admin
include "proto/domain.thrift"
include "provider_disputes.thrift"

typedef provider_disputes.ID ID
typedef string DisputeID

service ManualParsingService {

    void CancelPending (1: CancelParamsRequest CancelParamsRequest)

    void ApprovePending (1: ApproveParamsRequest ApproveParamsRequest)

    void BindCreated (1: BindParamsRequest bindParamsRequest)

}

struct CancelParamsRequest {
    1: required list<CancelParams> cancelParams
}

struct ApproveParamsRequest {
    1: required list<ApproveParams> approveParams
}

struct BindParamsRequest {
    1: required list<BindParams> bindParams
}

struct CancelParams {
    1: required DisputeID disputeId
    2: optional string cancelReason
}

struct ApproveParams {
    1: required DisputeID disputeId
    2: required bool skipCallHgForCreateAdjustment
    3: optional domain.Amount changedAmount
}

struct BindParams {
    1: required DisputeID disputeId
    2: required ID providerDisputeId
}
