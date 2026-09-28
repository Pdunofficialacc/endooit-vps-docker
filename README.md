# endooit-vps-docker (RAM Fixed + Crash Proof)

**Fixed version** - Alpine based, ultra low RAM for free tier bypass.

**Credentials:**
- User: `root`
- Password: `dev`
- Full root access

## Why previous crashed?
Ubuntu + packages = high RAM → free Railway / low memory kills it.

## New version
- Alpine 3.20 (tiny)
- Minimal packages only
- SSH ready
- Ngrok binary included

## Railway Deploy (recommended)
1. railway.app → New Project → Deploy from GitHub
2. Select `Pdunofficialacc/endooit-vps-docker`
3. After deploy, go to Settings → Networking → Generate Domain or TCP Proxy if available
4. For public TCP: use ngrok inside

## Get TCP address (ngrok)
Inside running container:
```bash
ngrok tcp 22
```
Output example: `tcp://0.tcp.ngrok.io:12345`

Connect:
```bash
ssh root@0.tcp.ngrok.io -p 12345
# password: dev
```

## Local test
```bash
docker build -t endooit-vps .
docker run -d -p 2222:22 --name vps --memory=256m endooit-vps
ssh root@localhost -p 2222
```

## RAM bypass tips
- Use Alpine (already done)
- Railway free: create multiple projects / new accounts if limit hit
- Add swap if privileged: `fallocate -l 1G /swap && mkswap /swap && swapon /swap`
- Keep only SSH running, no extra services

Crash fix + low RAM ready.
