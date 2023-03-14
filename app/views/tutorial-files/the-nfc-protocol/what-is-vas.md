title: What is the VAS protocol - an explanation

## Overview

If you're a developer working with Near Field Communication (NFC) technology, you may be familiar with the Value Added Services (VAS) protocol. In this article, we'll provide an overview of VAS, including its definition, implementation, and usage.

VAS is a cell phone standard defined by the GSM Association (GSMA) that enables mobile credential transfers using a cell phone. Specifically, VAS supports mobile transfers through NFC technology. VAS was originally part of the GSM standard and is partially implemented by mobile phone manufacturers who must follow GSMA's guidelines to ensure that their devices are approved for VAS. Apple calls their implementation Apple VAS and Google calls their implentation Google SmartTap.

VAS has a wide range of potential applications, including flight bookings, event ticketing, coupons, loyalty cards, gift cards, stored value cards, gym passes, and corporate visitor passes.

## How does the VAS protocol work?

The VAS protocol is both a hardware and software protocol implemented by mobile phone manufacturers. It enables communication of credentials over radio frequency (RF) and defines encryption functionality to ensure that the data transmitted is not in clear text. While the protocol defines the encryption functionality, each manufacturer may implement the encryption in a different way. Some phone manufacturers that support VAS include Apple, Motorola, Huawei, Samsung, Nokia, and Ericsson.

## How does VAS connect through NFC

NFC tags fall under the NFC Forum, which defines several layers of NFC communication, such as physical, radio, etc. The NFC Forum defines the physical layer, which includes the carrier frequency, data modulation, and encoding timings. Beyond the physical layer, the the Initialization Anticollision Protocol Activation layer (aka the media access layer) allows for 1-to-1 connection between two NFC radios. NFC targets fall under eight types:

1. Type 1 (Topaz) - ISO 14443A - Memory availability is 96 bytes and expandable to 2kB.
2. Type 2 - ISO 14443 - Memory availability is 48 bytes and expandable to 2 kbyte.
3. Type 3 (FeliCa) - ISO 14443 - Memory availability up to 1MByte.
4. Type 4 - ISO 14443 / ISO 7896 - Memory availability up to 1MByte.
5. Type 5 (PicoPass) - ISO 14443 - Memory availability up to 32kByte.
6. Type 6 - ISO 15693 - Generic RFID Tag used to store NFC Forum NDEF messages (max 8kB)
7. Type 7 - ISO 14443 - Proprietary NXP crypto
8. Type V - ISO 15693 - Proprietary NXP for ICODE

The one we care about for VAS implementations is Type 4. NFC forum Type 4 passes support files that are extendable by the ISO 7896 specification, which specifies a file system format that allows for data to be stored in a structured way that does not require byte addressing. When Type 4 is selected in the media access layer, it allows for interaction with VAS, including the exchange of unique identifiers and payloads.

## Building for VAS

To use VAS on a mobile device, the manufacturer controls the security model, and in the case of Apple and Google, developers need a certificate to define VAS credentials which is obtained by applying for a developer account in each software providers developer portal. To use VAS on an Apple or Android-enabled phone, a certificate must be issued directly by Apple or Google.

From a software perspective, you must create custom code for issuing passes according to the respective operating system's pass API. You may also need to deal with webhook integration for push notifications on Apple as well.

From a hardware reader perspective, you must manage the certificates issued by Apple and Google as well as making sure your NFC reading firmware is VAS compatible. Not to mention the key (ECC private/public key pair) management necessary for decoding a pass.

## Making it simple with PassNinja

Alternatively, if you'd like to get started with issuing NFC passes today, you can use the PassNinja platform, which does not require approval, certificate management, normalizes the pass API across Apple and Google as well as provides ready to go hardware pre-loaded with appropriate certificates and keys.

## Conclusion

If you're a developer working with NFC technology, understanding the VAS protocol and its implementation can provide you with a valuable toolset for a wide range of applications. By connecting VAS to NFC tags, you can enable secure mobile credential transfers that can benefit both consumers and businesses alike.

If you have any feedback on this article, let us know! Email content@passninja.com
