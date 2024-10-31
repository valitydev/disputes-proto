namespace java dev.vality.disputes.callback

typedef string ID
typedef string ProviderDisputeID
typedef string DisputeID

service ProviderDisputesCallbackService {

    void CreateAdjustmentIfPaymentSuccess (1: DisputeCallbackParams disputeCallbackParams)

}

struct DisputeCallbackParams {
    1: optional ID invoiceId
    2: optional ID paymentId
    3: optional ID providerTrxId
    4: optional ProviderDisputeID providerDisputeID
    5: optional DisputeID disputeID
}
