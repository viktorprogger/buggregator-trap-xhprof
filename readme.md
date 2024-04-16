# Buggregator Trap config for XHProf profiles analysis

## Quickstart
1. If you can't use port 8000, create `.env` file and configure a desired port with the `WEB_PORT` environment variable.
    I.e. `WEB_PORT=8888`.
2. Run `docker compose up -d` and wait until container is being build
3. Copy your XHProf profiles to the `data` directory
4. Open http://localhost:8000/#/profiler (change port according to your preferences)
5. Choose any of your profiles and inspect it!
