# ASN.1 and CSR

## Links

- [A Layman's Guide to a Subset of ASN.1, BER, and DER](https://luca.ntop.org/Teaching/Appunti/asn1.html)

## Apple CSR Tool

Apple has an open source tool that can create signing requests. May also use the certtool command line util.

- [CertTool](https://github.com/apple-oss-distributions/security_certtool/blob/security_certtool-55119/src/CertTool.cpp)

OIDs referenced in:

```
#include <Security/oidsattr.h>
#include <Security/oidscert.h>
#include <Security/oidsalg.h>
```

## Security Command

The source for the security command is available at:

- [SecurityTool](https://github.com/apple-oss-distributions/SecurityTool)

Manipulating access lists:

- [access_utils.c](https://github.com/apple-oss-distributions/SecurityTool/blob/main/access_utils.c)
