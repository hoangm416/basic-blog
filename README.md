# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Basic Rails Blog - Docker Setup

```bash
# 1. Setup và chạy
make setup

# 2. Truy cập LAN (Windows + WSL)
# Copy file sang Windows Desktop rồi chạy với quyền Administrator:
setup-windows-forwarding.bat

# 3. Test
curl http://localhost:3000/health
```

## URLs

- **Local**: http://localhost:3000
- **LAN**: http://192.168.x.x:3000 (sau khi setup Windows forwarding)

## Commands

```bash
make up      # Start
make down    # Stop  
make logs    # Logs
make console # Rails console
make help    # All commands
```