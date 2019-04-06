
## Basic Usage

To create an openssl config file, a key, and a csr, you would do that:

```
- hosts: localhost
  roles:
    - role: mafalb.x509/csr
      x509_alias: bla.example.com
```

This had generated a CSR and it lives on the control_machine in {{ playbook_dir }}

```
$ ls -1 files/x509/
bla.example.com.csr
```

Give it to your CA and get a certificate.

Now copy the certificate and the intermediates and the root certificate into {{ playbook_path }}/files/x509

```
$ ls -1 files/x509/
bla.example.com.csr
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

## Variables

x509_alias is used for destination file names
