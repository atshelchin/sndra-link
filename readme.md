# SNDRA Link

A fast, reliable, and free URL shortening service built with Rust and Axum. SNDRA Link provides both simple link shortening and advanced campaign URL building with UTM parameters.

## Features

- **🚀 Fast & Lightweight**: Built with Rust and Axum for optimal performance
- **💯 100% Free**: No hidden costs, no premium tiers
- **🔗 Permanent Links**: Links remain active as long as the service runs
- **📊 UTM Campaign Builder**: Advanced marketing campaign tracking with UTM parameters
- **🌏 Bilingual Support**: Full Chinese and English interface
- **📱 Mobile Responsive**: Optimized for all device sizes
- **🐳 Docker Ready**: Easy deployment with Docker and Docker Compose
- **⚡ Auto-Deploy**: GitHub Actions integration for seamless CI/CD

## Our 5-Year Commitment

We guarantee uninterrupted service from **December 1, 2025** to **December 1, 2030**. All shortened links created during this period will remain active and accessible.

## Quick Start

### Prerequisites

- Docker and Docker Compose
- Git (for cloning the repository)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/sndra-link.git
cd sndra-link
```

2. Create a `.env` file:
```bash
DATABASE_URL=sqlite:///data/sndra-link.db
DOMAIN=https://sndra.link
```

3. Start the service:
```bash
docker compose up -d
```

The service will be available at `http://localhost:7700`

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DATABASE_URL` | SQLite database path | `sqlite:///data/sndra-link.db` |
| `DOMAIN` | Your domain name | `https://sndra.link` |

### Traefik Integration

If using Traefik as a reverse proxy, the service is pre-configured with labels in `docker-compose.yml`:

```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.sndralink.rule=Host(`sndra.link`)"
  - "traefik.http.routers.sndralink.entrypoints=web"
  - "traefik.http.services.sndralink.loadbalancer.server.port=7700"
```

## API Documentation

### Create Short Link

**Endpoint**: `POST /`

**Request Body**:
```json
{
  "link": "https://example.com/your-long-url"
}
```

**Response**:
```json
{
  "short": "https://sndra.link/r/abc123"
}
```

**Status Codes**:
- `200 OK`: Link created successfully
- `400 Bad Request`: Invalid URL format
- `500 Internal Server Error`: Database error

### Redirect to Original URL

**Endpoint**: `GET /r/{key}`

**Example**: `https://sndra.link/r/abc123`

**Status Codes**:
- `301 Moved Permanently`: Redirects to original URL
- `404 Not Found`: Short link key not found
- `500 Internal Server Error`: Database error

## Local Development

### Prerequisites

- Rust (1.70+)
- SQLite3

### Build and Run

1. Install dependencies:
```bash
cargo build
```

2. Set environment variables:
```bash
export DATABASE_URL=sqlite:///data/sndra-link.db
export DOMAIN=http://localhost:7700
```

3. Run the server:
```bash
cargo run
```

## Deployment

### Manual Deployment

```bash
# Build the Docker image
docker build -t sndra-link:latest .

# Run the container
docker run -d \
  -e DATABASE_URL=sqlite:///data/sndra-link.db \
  -e DOMAIN=https://sndra.link \
  -v $(pwd)/data:/data \
  -p 7700:7700 \
  --name sndra-link-service \
  sndra-link:latest
```

### GitHub Actions Deployment

The repository includes automated deployment via GitHub Actions. Configure the following secrets:

| Secret | Description |
|--------|-------------|
| `SERVER_HOST` | Server IP address |
| `SERVER_USERNAME` | SSH username |
| `SERVER_PASSWORD` | SSH password |

On push to `main` branch, the workflow will:
1. SSH into your server
2. Pull the latest code
3. Rebuild and restart containers

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed setup instructions.

## Project Structure

```
sndra-link/
├── src/
│   └── main.rs           # Main application code
├── public/
│   ├── index.html        # Main interface
│   └── commitment.html   # Service commitment page
├── .github/
│   └── workflows/
│       └── deploy.yml    # CI/CD pipeline
├── Dockerfile            # Container image definition
├── docker-compose.yml    # Service orchestration
└── Cargo.toml           # Rust dependencies
```

## Technology Stack

- **Backend**: Rust, Axum, SQLx
- **Database**: SQLite
- **Frontend**: HTML, TailwindCSS, Vanilla JavaScript
- **Deployment**: Docker, Docker Compose, GitHub Actions
- **Proxy**: Traefik (optional)

## UTM Campaign Builder

The advanced Campaign URL Builder supports the following UTM parameters:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `utm_source` | Traffic source | `google`, `facebook`, `newsletter` |
| `utm_medium` | Marketing medium | `cpc`, `email`, `social` |
| `utm_campaign` | Campaign name | `summer_sale_2025` |
| `utm_term` | Paid keywords | `running+shoes` |
| `utm_content` | Ad content variant | `banner_a`, `text_link` |

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Security

- All URLs are validated before storage
- SQL injection prevention via parameterized queries
- No authentication required for public short link access
- Rate limiting recommended for production deployment

## FAQ

**Q: How long do short links last?**
A: Links are permanent and will remain active as long as the service is running.

**Q: Is there a limit on the number of links I can create?**
A: No, there are no limits on link creation.

**Q: Can I customize the short link key?**
A: Currently, keys are auto-generated. Custom keys may be added in future versions.

**Q: Is my data secure?**
A: All data is stored locally in SQLite. We don't track clicks or collect user data.

## Roadmap

- [ ] Custom short link keys
- [ ] Click analytics and statistics
- [ ] QR code generation
- [ ] Link expiration options
- [ ] Admin dashboard
- [ ] Rate limiting
- [ ] API authentication

## License

MIT License - feel free to use this project for any purpose.

## Support

For issues, questions, or suggestions:
- Open an issue on [GitHub](https://github.com/athshelchin/sndra-link/issues)
- Visit our [Commitment Page](https://sndra.link/commitment.html)

---

**Built with ❤️ using Rust**
