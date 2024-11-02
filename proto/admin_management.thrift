namespace java dev.vality.disputes.admin
include "proto/domain.thrift"

typedef string ID
typedef string DisputeID

service AdminManagementService {

    void CancelPending (1: CancelParamsRequest cancelParamsRequest)

    void ApprovePending (1: ApproveParamsRequest approveParamsRequest)

    void BindCreated (1: BindParamsRequest bindParamsRequest)

    DisputeResult GetDisputes (1: DisputeParamsRequest disputeParamsRequest)

}

service AdminCallbackService {

    void Notify (1: NotificationParamsRequest notificationParamsRequest)

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
    3: optional string mapping
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
    2: optional ID providerDisputeId
    3: required ID invoiceId
    4: required ID paymentId
    5: required ID providerTrxId
    6: required string status
    7: optional string errorMessage
    8: required string amount
    9: optional string changedAmount
    10: required bool skipCallHgForCreateAdjustment
    11: optional list<Attachment> attachments
    12: optional string mapping
}

struct Attachment {
    1: required binary data
}

struct NotificationParamsRequest {
    1: required list<Notification> notifications
}

union Notification {
    1: DisputeAlreadyCreated disputeAlreadyCreated
    2: DisputePoolingExpired disputePoolingExpired
    3: DisputeReadyForCreateAdjustment disputeReadyForCreateAdjustment
    4: DisputeFailedReviewRequired disputeFailedReviewRequired
    5: DisputeManualCreated disputeManualCreated
    6: DisputeManualPending disputeManualPending
}

struct DisputeAlreadyCreated {
    1: required DisputeID id
    2: required ID invoiceId
    3: required ID paymentId
}

struct DisputePoolingExpired {
    1: required DisputeID id
    2: required ID invoiceId
    3: required ID paymentId
}

struct DisputeReadyForCreateAdjustment {
    1: required DisputeID id
    2: required ID invoiceId
    3: required ID paymentId
}

struct DisputeFailedReviewRequired {
    1: required DisputeID id
    2: required ID invoiceId
    3: required ID paymentId
    4: required string errorCode
    5: optional string errorDescription
}

struct DisputeManualPending {
    1: required DisputeID id
    2: required ID invoiceId
    3: required ID paymentId
    4: optional string errorMessage
}

struct DisputeManualCreated {
    1: required DisputeID id
    2: required ID invoiceId
    3: required ID paymentId
    4: optional string errorMessage
}
