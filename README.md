## Subroles

[```x509/csr```](csr/README.md) creates a Certificate Signing Request

[```x509/certificate```](certificate/README.md) installs a certificate

[```x509/key```](key/README.md) creates an key

[```x509/pem```](pem/README.md)

[```x509/ca_trust```](ca_trust/README.md) adds a CA certificate to the system store

[```x509/selfsigned```](selfsigned/README.md) creates a selfsigned certificate

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

This had generated a CSR.
Give it to your CA and get a certificate.

Now copy the certificate and the intermediates and the root certificate into ```{{ x509.local_certstore }}``` (defaults to ```{{ playbook_path }}/files/x509```)

```
$ ls -1 files/x509/
bla.example.com.cert
chain_0.cert
chain_1.cert
chain_2.cert
```
 
```
- hosts: localhost
  roles:
    - role: mafalb.x509/certificate
      x509_alias: bla.example.com
      x509_src:
        cert: bla.example.com.cert
        chain:
        - chain_2.cert
        - chain_1.cert
        root: chain_0.cert
```

The location of the destination files are OS dependent, on RedHat-ish Operating Systems it would be like that:

TBD

```
- hosts: localhost
  roles:
    - role: mafalb.x509/pem
      alias: client_ca.pem
      x509_src:
        certs:
          - chain_2.cert
```

creates a pem file with the ```x509_src.certs``` concatenated

## Variables

```x509_alias``` is used for destination file names

```x509_state``` present/absent

```
x509_src:
  cert: bla.example.com.cert
  key: bla.example.com.key
  chain:
    - chain.cert
  root: root.cert
  certs:
    - cert1.cert
    - cert2.cert
```

is used for source file names.

not all values has to be defined in all circumstances. e.g. if you want a pem file with some certificates you only need ```x509_src.certs```.
