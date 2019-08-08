
## Basic Usage

To create an openssl config file, a key, and a csr, you would do that:

```
- hosts: localhost
  roles:
  - role: x509/csr
    x509_alias: bla.example.com
    x509_dn_cn: commonName
    x509_dn_ou: organizationalUnitName
    x509_dn_o: organizationName
    x509_dn_l:  my city
    x509_dn_st: my state
    x509_dn_c: countryName (2 letter)
```

If you wanted a client certificate:

```
- hosts: localhost
  roles:
  - role: x509/csr
    x509_alias: bla.example.com
    x509_dn_cn: commonName
    x509_dn_ou: organizationalUnitName
    x509_dn_o: organizationName
    x509_dn_l:  locality
    x509_dn_st: stateOrProvinceName
    x509_dn_c: countryName (2 letter)
    x509_key_usage:
      - clientAuth
```

If you wanted the certificate be both a server and client cert:

```
- hosts: localhost
  roles:
  - role: x509/csr
    x509_alias: bla.example.com
    x509_dn_cn: commonName
    x509_dn_ou: organizationalUnitName
    x509_dn_o: organizationName
    x509_dn_l:  locality
    x509_dn_st: stateOrProvinceName
    x509_dn_c: countryName (2 letter)
    x509_key_usage:
      - serverAuth
      - clientAuth
```

This had generated a CSR.
Give it to your CA and get a certificate.

## Variables

```x509_alias``` is used for destination file names

---

```x509_state: present``` present/absent

if the specified csr should be present or absent

---

```
x509_key_usage:
  - serverAuth
  - clientAuth
```

what key usage should be requested. serverAuth/clientAuth

---

```
x509_dn_cn: commonName
x509_dn_ou: organizationalUnitName
x509_dn_o: organizationName
x509_dn_l: locality
x509_dn_st: stateOrProvinceName
x509_dn_c: countryName (2 letter)
```

the fields in the distinguished name (DN)

---
