# endooit-vps-docker

Full root VPS-style Docker container.

**Credentials:**
- User: `root`
- Password: `dev`
- Full root access enabled.

## Railway Deploy (fast)

1. Go to https://railway.app
2. New Project → Deploy from GitHub repo
3. Select this repo: `Pdunofficialacc/endooit-vps-docker`
4. Add service, set start command if needed: `/usr/sbin/sshd -D`
5. For TCP public access: use Railway TCP proxy or attach ngrok.

## Ngrok TCP tunnel (for public TCP address)

Inside container or locally:

```bash
ngrok tcp 22
```

This gives you a public TCP address like `0.tcp.ngrok.io:xxxxx`

Connect with:

```bash
ssh root@0.tcp.ngrok.io -p xxxxx
# password: dev
```

## Docker local test

```bash
docker build -t endooit-vps .
docker run -d -p 2222:22 --name vps endooit-vps
ssh root@localhost -p 2222
# pass: dev
```

## Notes

- Railway free tier has limits. Use multiple projects / accounts for bypass feel.
- Keep ngrok authtoken set for permanent tunnels: `ngrok config add-authtoken YOUR_TOKEN`
- Full root, docker-in-docker possible if privileged.

Anonymous style. Ready.
