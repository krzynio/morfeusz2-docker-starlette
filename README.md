
# Morfeusz2 Morphological Analysis API

This API provides a simple interface for morphological analysis using the Morfeusz2 library. It is built using the Starlette framework and is containerized with Docker for easy deployment.

## Getting Started

### Prerequisites

- Docker installed on your machine.

### Building the Docker Image

To build the Docker image for the API, navigate to the directory containing the `Dockerfile` and `api.py` and run:

```bash
docker build -t morfeusz2-api .
```

This command will build the Docker image and tag it with the name `morfeusz2-api`.

### Running the API

Once the Docker image is built, you can run the API using the following command:

```bash
docker run -p 8000:8000 morfeusz2-api
```

This will start the API on port `8000` of your machine. 

## API Endpoints

### POST /api/analyse

Analyzes the provided text for morphological details.

**Payload**:

```json
{
    "text": "Your text here"
}
```

**Response**:

The response will contain the analysis of the provided text.

## Maintainer

For any queries or contributions, reach out to the maintainer at [krzynio@gmail.com](mailto:krzynio@gmail.com).
