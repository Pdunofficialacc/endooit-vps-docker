# endooit-vps-docker — Ubuntu + 164GB RAM

**Full Ubuntu 22.04** with massive RAM config.

**Credentials:**
- User: `root`
- Password: `dev`
- Full root access

## Specs set
- Base: Ubuntu 22.04
- mem_limit: **164g**
- mem_reservation: 32g
- cpus: 16
- Privileged: true

## Railway / free tier note
Free hosts ignore 164g limit. Real high RAM only on paid VPS or your own machine.
For free: still use Alpine version if crash aaye.

## Deploy
```bash
docker compose up -d --build
ssh root@localhost -p 2222
# pass: dev
```

## Ngrok TCP
```bash
ngrok tcp 22
```

164GB mode ready.
