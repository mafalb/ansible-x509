
## Basic Usage

To create an openssl config file, a key, and a csr, you would do that:

```
- hosts: localhost
  roles:
  - role: x509/csr
    x509_alias: bla.example.com
    x509_dn:
      cn: bla.example.com
      city: Wherever
      country: XX
      state: Wherever
      organization: Whatever
```

If you wanted a client certificate:

```
- hosts: localhost
  roles:
  - role: x509/csr
    x509_alias: bla.example.com
    x509_dn:
      cn: bla.example.com
      city: Wherever
      country: XX
      state: Wherever
      organization: Whatever
    x509_key_usage:
      - clientAuth
```

If you wanted the certificate be both a server and client cert:

```
- hosts: localhost
  roles:
  - role: x509/csr
    x509_alias: bla.example.com
    x509_dn:
      cn: bla.example.com
      city: Wherever
      country: XX
      state: Wherever
      organization: Whatever
    x509_key_usage:
      - serverAuth
      - clientAuth
```

This had generated a CSR.
Give it to your CA and get a certificate.

## Variables

```x509_alias``` is used for destination file names

```x509_state: present``` present/absent

```
x509_key_usage:
  - serverAuth
  - clientAuth
```

serverAuth/clientAuth

```
x509_dn:
  cn: bla.example.com
  city: Wherever
  country: XX
  state: Wherever
  organization: Whatever
```
