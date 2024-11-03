namespace java dev.vality.provider.payments
include "proto/domain.thrift"

typedef string ID

service ProviderPaymentsCallbackService {

    void CreateAdjustmentWhenFailedPaymentSuccess (1: ProviderPaymentsCallbackParams providerPaymentsCallbackParams)

}

service ProviderPaymentsCallbackAdminManagementService {

    void Cancel (1: CancelParamsRequest cancelParamsRequest)

    void Approve (1: ApproveParamsRequest approveParamsRequest)

}

service ProviderPaymentsService {

    PaymentStatusResult CheckPaymentStatus (1: TransactionContext transactionContext, 2: domain.Currency currency)

}

struct ProviderPaymentsCallbackParams {
    1: optional ID invoiceId
    2: optional ID paymentId
}

struct CancelParamsRequest {
    1: required bool cancelAll
    2: optional list<CancelParams> cancelParams
    3: optional string cancelReason
}

struct ApproveParamsRequest {
    1: required bool approveAll
    2: optional list<ApproveParams> approveParams
    3: optional string approveReason
}

struct CancelParams {
    1: required ID invoiceId
    2: required ID paymentId
}

struct ApproveParams {
    1: required ID invoiceId
    2: required ID paymentId
}

struct TransactionContext {
    1: required ID providerTrxId
    2: required domain.ProxyOptions terminalOptions
    3: required ID invoiceId
    4: required ID paymentId
}

struct PaymentStatusResult {
    1: required bool success
    2: optional domain.Amount changedAmount
}
