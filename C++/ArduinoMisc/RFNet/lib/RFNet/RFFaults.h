#ifndef RFNET_FAULT_HEADER
#define RFNET_FAULT_HEADER

namespace RFNET
{

enum class Faults
{
    NRF24_INIT,
    NRF24_SET_CHAN,
    NRF24_SET_RF,
    NRF24_UNAVAILABLE,
    TIMEOUT_SEND,
    TIMEOUT_RECV,
    GENERAL_SEND,
    GENERAL_RECV
};

}
#endif