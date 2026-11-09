# 🏠 CLUBOR – Self-Hosted Infrastructure

Self-hosted infrastructure, deployed with **Docker Compose** and grouped in a [Homepage](https://gethomepage.dev) dashboard.

Each service lives in its own folder, with its `compose.yaml` and separate persistent data.

🔗 Production example: www.ruedacano.es

## 📁 Structure

```
.
├── SERVICE/
│   ├── config/
│   │   └── compose.yaml    # Service definition
│   └── volumes/            # Persistent data (not versioned)
└── README.md
```

> `SERVICE` is a placeholder for each service folder (e.g. `nextcloud`, `immich`). `/SERVICES/` is the literal host mount root (replaces `/CLUBOR/`).

## 🚀 Services

### ☁️ Storage and documents

| Service | Description | URL | Compose |
|---------|-------------|-----|---------|
| [Nextcloud](https://nextcloud.com) | Storage and collaboration suite | [drive.example.com](https://drive.example.com) | [`nextcloud/config/compose.yaml`](nextcloud/config/compose.yaml) |
| [Immich](https://immich.app) | Photo and video management | [photos.example.com](https://photos.example.com) | [`immich/config/compose.yaml`](immich/config/compose.yaml) |
| [Paperless-ngx](https://docs.paperless-ngx.com) | Document management | [docs.example.com](https://docs.example.com) | [`paperless/config/compose.yaml`](paperless/config/compose.yaml) |
| [Calibre-Web](https://github.com/janeczku/calibre-web) | E-book library | [books.example.com](https://books.example.com) | [`calibre/config/compose.yaml`](calibre/config/compose.yaml) |
| [Stirling PDF](https://github.com/Stirling-Tools/Stirling-PDF) | PDF editing tools | [pdf.example.com](https://pdf.example.com) | [`stirling-pdf/config/compose.yaml`](stirling-pdf/config/compose.yaml) |

### 🔐 Security and communications

| Service | Description | URL | Compose |
|---------|-------------|-----|---------|
| [Vaultwarden](https://github.com/dani-garcia/vaultwarden) | Password management | [passwords.example.com](https://passwords.example.com) | [`vaultwarden/config/compose.yaml`](vaultwarden/config/compose.yaml) |
| [Mailcow](https://mailcow.email) | Email server | [mail.example.com](https://mail.example.com) | [`mailcow/config/compose.yaml`](mailcow/config/compose.yaml) |

### 🌐 Network and remote access

| Service | Description | URL | Compose |
|---------|-------------|-----|---------|
| [NetBird](https://netbird.io) | Trusted mesh VPN | [netbird.example.com](https://netbird.example.com) | [`netbird/config/compose.yaml`](netbird/config/compose.yaml) |
| [RustDesk](https://rustdesk.com) | Open source remote control | [desktop.example.com](https://desktop.example.com) | [`rustdesk/config/compose.yaml`](rustdesk/config/compose.yaml) |

### 🛠️ Development and AI

| Service | Description | URL | Compose |
|---------|-------------|-----|---------|
| [Forgejo](https://forgejo.org) | Repositories and CI/CD | [git.example.com](https://git.example.com) | [`forgejo/config/compose.yaml`](forgejo/config/compose.yaml) |
| [Hermes Agent](https://github.com/NousResearch/hermes-agent) | Autonomous AI agent | [ai.example.com](https://ai.example.com) | [`hermes-agent/config/compose.yaml`](hermes-agent/config/compose.yaml) |

### 🎬 Multimedia and entertainment

| Service | Description | URL | Compose |
|---------|-------------|-----|---------|
| NodeCast TV | Streaming and live TV | [tv.example.com](https://tv.example.com) | [`nodecast-tv/config/compose.yaml`](nodecast-tv/config/compose.yaml) |
| [Stremio](https://www.stremio.com) | Movies and series | [stremio.example.com](https://stremio.example.com) | [`stremio/config/compose.yaml`](stremio/config/compose.yaml) |
| [Dispatcharr](https://github.com/Dispatcharr/Dispatcharr) | Stream and EPG management | [iptv.example.com](https://iptv.example.com) | [`dispatcharr/config/compose.yaml`](dispatcharr/config/compose.yaml) |
| [Crafty Controller](https://craftycontrol.com) | Game server control panel | [games.example.com](https://games.example.com) | [`crafty/config/compose.yaml`](crafty/config/compose.yaml) |

## ⚙️ Usage

Start a service:

```bash
docker compose -f SERVICE/config/compose.yaml up -d
```

View logs:

```bash
docker compose -f SERVICE/config/compose.yaml logs -f
```

Update images:

```bash
docker compose -f SERVICE/config/compose.yaml pull
docker compose -f SERVICE/config/compose.yaml up -d
```

Stop a service:

```bash
docker compose -f SERVICE/config/compose.yaml down
```

## 🐳 Containers

Container names used in the dashboard (Homepage Docker integration):

| Service | Container |
|---------|-----------|
| Nextcloud | `NextCloud` |
| Immich | `ImmichServer` |
| Vaultwarden | `Vaultwarden` |
| Mailcow | `mail-nginx-mailcow-1` |
| Paperless-ngx | `Paperless` |
| NetBird | `netbird-dashboard` |
| Hermes Agent | `HermesAgent` |
| Forgejo | `Forgejo` |
| Calibre-Web | `Calibre` |
| NodeCast TV | `Nodecast` |
| Stremio | `Stremio` |
| Crafty | `Crafty` |
| Stirling PDF | `Stirling_PDF` |
| Dispatcharr | `Dispatcharr` |
| RustDesk | `Rustdesk_api` |

## 💾 Volumes and backups

Each service's persistent data lives in `SERVICE/volumes/`. This folder **is not uploaded to the repository**:

```gitignore
*/volumes/
.env
```

Recommendations:
- Make periodic backups of all `volumes/` folders.
- Apply the 3-2-1 rule (3 copies, 2 different media, 1 off-site).
- Test restoration from time to time, especially in Vaultwarden, Nextcloud, Immich and Mailcow.

## 🔐 Secrets

Passwords, tokens and API keys are not stored in the repository. Use `.env` files (ignored by git) or Docker secrets.

## 📝 Notes

- All services are published under subdomains of `example.com`.
- Mailcow is deployed with its own official structure, so its folder may differ from the rest.
- In RETIRED_SERVICES there are services I no longer use, but whose compose.yaml is created and ready to use.


## 📋 Prerequisites

- Docker and Docker Compose installed on the host.
- External Docker network `web_network` already created (used by all services for the reverse proxy).
- One `.env` file per service with the variables each `compose.yaml` requires (not uploaded to the repository).

## 🚀 Quick start

1. Clone the repository:

```bash
git clone https://github.com/<your-username>/CLUBOR.git
cd CLUBOR
```

2. Create the `.env` file for the service you want to bring up (Nextcloud example):

```bash
cp nextcloud/config/.env.example nextcloud/config/.env   # if an example exists
# or create it manually with the variables required by its compose.yaml
```

3. Create the volume directories:

```bash
sudo ./nextcloud/config/create_dir.sh
```

4. Start the service:

```bash
docker compose -f nextcloud/config/compose.yaml up -d
```

## 🔑 Environment variables (`.env`)

Passwords, tokens and API keys **are not uploaded to the repository**. Each service can have its own `.env` ignored by git. Create one per service with the variables referenced by its `compose.yaml`, for example:

```env
MYSQL_ROOT_PASSWORD=your_secure_password
MARIADB_PASSWORD=your_secure_password
PAPERLESS_SECRET_KEY=your_secret_key
```

Never add `.env` to git.

## ➕ Add a new service

1. Create the `SERVICE/` folder with `config/compose.yaml`.
2. Add `config/create_dir.sh` to create the volume directories (`/SERVICES/<service>/volumes/...`).
3. Add the reverse proxy config in `Web_Server/volumes/webserver/config/nginx/proxy-confs/`.
4. Register the service in `Homepage/volumes/homepage/services.yaml`.
5. Add a row to the services table in this README.

## 💾 Backups

Persistent data lives in `SERVICE/volumes/` and **is not versioned**. Make periodic backups of those folders (3-2-1 rule) and test restoration from time to time, especially in Vaultwarden, Nextcloud, Immich and Mailcow.

