namespace java dev.vality.disputes.admin
include "proto/domain.thrift"
include "provider_disputes.thrift"

typedef provider_disputes.ID ID
typedef string DisputeID

service ManualParsingService {

    void CancelPending (1: CancelParamsRequest cancelParamsRequest)

    void ApprovePending (1: ApproveParamsRequest approveParamsRequest)

    void BindCreated (1: BindParamsRequest bindParamsRequest)

    DisputeResult GetDisputes (1: DisputeParamsRequest disputeParamsRequest)

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

struct DisputeParamsRequest {
    1: required list<DisputeParams> disputeParams
    2: required bool withAttachments
}

struct DisputeResult {
    1: required list<Dispute> disputes
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

struct DisputeParams {
    1: required DisputeID disputeId
}

struct Dispute {
    1: required DisputeID disputeId
    2: optional string providerDisputeId
    3: required string invoiceId
    4: required string paymentId
    5: required string providerTrxId
    6: required string status
    7: optional string errorMessage
    8: required string amount
    9: optional string changedAmount
    10: required bool skipCallHgForCreateAdjustment
    11: optional list<Attachment> attachments
}

struct Attachment {
    1: required binary data
}
