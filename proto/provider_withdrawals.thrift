namespace java dev.vality.provider.withdrawals
include "proto/domain.thrift"

typedef string ID

/**
 * Callback от адаптера выплат в disputes-api: провайдер сообщил, что выплата,
 * завершившаяся в процессинге неуспешно, на самом деле прошла успешно.
 */
service ProviderWithdrawalsCallbackService {

    void CreateAdjustmentWhenFailedWithdrawalSuccess (1: ProviderWithdrawalsCallbackParams providerWithdrawalsCallbackParams)

}

/**
 * Проверка статуса выплаты у провайдера: disputes-api вызывает адаптер выплат.
 */
service ProviderWithdrawalsService {

    WithdrawalStatusResult CheckWithdrawalStatus (1: WithdrawalContext withdrawalContext, 2: domain.Currency currency)

}

struct ProviderWithdrawalsCallbackParams {
    /** Идентификатор выплаты в fistful (withdrawal_id) */
    1: required ID withdrawalId
}

struct WithdrawalContext {
    1: required ID withdrawalId
    2: required domain.ProxyOptions terminalOptions
    /** Идентификатор транзакции у провайдера, если он уже известен процессингу */
    3: optional ID providerTrxId
}

struct WithdrawalStatusResult {
    1: required bool success
}
