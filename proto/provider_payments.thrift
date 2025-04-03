namespace java dev.vality.provider.payments
include "proto/domain.thrift"

typedef string ID

service ProviderPaymentsCallbackService {

    void CreateAdjustmentWhenFailedPaymentSuccess (1: ProviderPaymentsCallbackParams providerPaymentsCallbackParams)

}

service ProviderPaymentsService {

    PaymentStatusResult CheckPaymentStatus (1: TransactionContext transactionContext, 2: domain.Currency currency)

}

struct ProviderPaymentsCallbackParams {
    1: optional ID invoiceId
    2: optional ID paymentId
}

struct TransactionContext {
    1: required ID providerTrxId
    2: required domain.ProxyOptions terminalOptions
    3: required ID invoiceId
    4: required ID paymentId
    5: optional domain.TransactionInfo transactionInfo
}

struct PaymentStatusResult {
    1: required bool success
    2: optional domain.Amount changedAmount
}
