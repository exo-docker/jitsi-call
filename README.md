# eXo Jitsi Call Docker image <!-- omit in toc -->

## Image Signature

eXo Jitsi docker images are signed with [cosign] (https://github.com/sigstore/cosign) tool from Docker Hub.

In order to verify the signature of the eXo Jitsi docker image, please install the "cosign" command line tool. Then please follow these instructions:

- Save the following public key to `cosign.pub` file:
```gpg
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEgYKR7SoWbXjHya1Bc2Ih3kX8wv8w
Y7StaVsRXzbcIL0jECiKzKarPxQQ69uVmZ6c0JEVQhBeN9w3pr75D4o2/A==
-----END PUBLIC KEY-----
```
- Execute the following command:
```bash
cosign verify --key cosign.pub exoplatform/jitsi:<tag>
```
*Example:*
```bash
cosign verify --key cosign.pub exoplatform/jitsi:7.2.1_0
```
  Output:
```json
[{"critical":{"identity":{"docker-reference":"index.docker.io/exoplatform/jitsi"},"image":{"docker-manifest-digest":"sha256:ae757647ebea57ded85bc8c5a3a1b131291bc53b6ee5de6c19aae86a822820fd"},"type":"cosign container image signature"},"optional":{"Bundle":{"SignedEntryTimestamp":"MEUCIHJm3s5x6voPUhV6kdz6PcFneu3CMhSB9+xkqU7jHpJnAiEAkcYgWYtyCwzAg0SsKkphAT5c1OjGAQKvfSkoWN5+K88=","Payload":{"body":"eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMTU1MWJjMjVhY2UxNWJmYzc5Nzc1ZDlmMjY1NGQyMmVhNDllYzEzN2JkZTg2MGRlNzZiZDU5M2FjM2NkZmE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUREbmdLN1ZRbC9iZVBrclZ1M3QramlUNjltYVV3RW5rN0ZRcnZUbXhIL0t3SWdRRzM5MDV3TzJCUk5mSDRQL0NrckZOL3lZamw4L2U4YXhmcURUSFFiaDVVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCUVZVSk1TVU1nUzBWWkxTMHRMUzBLVFVacmQwVjNXVWhMYjFwSmVtb3dRMEZSV1VsTGIxcEplbW93UkVGUlkwUlJaMEZGWjFsTFVqZFRiMWRpV0dwSWVXRXhRbU15U1dnemExZzRkM1k0ZHdwWk4xTjBZVlp6VWxoNlltTkpUREJxUlVOcFMzcExZWEpRZUZGUk5qbDFWbTFhTm1Nd1NrVldVV2hDWlU0NWR6TndjamMxUkRSdk1pOUJQVDBLTFMwdExTMUZUa1FnVUZWQ1RFbERJRXRGV1MwdExTMHRDZz09In19fX0=","integratedTime":1785423063,"logIndex":2291370628,"logID":"c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"}}}}]
```
