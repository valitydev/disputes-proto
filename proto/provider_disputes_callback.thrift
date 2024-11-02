namespace java dev.vality.disputes.callback

typedef string ID
typedef string ProviderDisputeID
typedef string DisputeID

service ProviderDisputesCallbackService {

    void CreateAdjustmentIfPaymentSuccess (1: DisputeCallbackParams disputeCallbackParams)

}

service ProviderDisputesCallbackAdminManagementService {

    void Cancel (1: CancelParamsRequest cancelParamsRequest)

    void Approve (1: ApproveParamsRequest approveParamsRequest)

}

struct DisputeCallbackParams {
    1: optional ID invoiceId
    2: optional ID paymentId
    3: optional DisputeID disputeID
}

struct CancelParamsRequest {
    1: required bool cancelAll
    2: optional list<ID> ids
}

struct ApproveParamsRequest {
    1: required bool approveAll
    2: optional list<ID> ids
}
