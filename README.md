# xray-docker

[Xray 2.0 by Chaitin](https://github.com/chaitin/xray) packaged in a Docker container.

---

## Installation

Clone the repository and build the Docker image:

```bash
git clone https://github.com/VlCl0US/xray-docker
cd xray-docker
docker build -t xray-scanner .
```

## Basic Usage

Run the tools within the Docker container:

### Run xray
```bash
docker run -it xray-scanner xray
```

### Run xpoc
```bash
docker run -it xray-scanner xpoc
```

### Mount configuration and report folders
```bash
docker run -it -v $(pwd)/config:/opt/xray/config -v $(pwd)/reports:/opt/xray/reports xray-scanner <command>
```

## Example

Scan a target with a custom configuration file and save HTML output to a shared folder:

```bash
sudo docker run -it -v $(pwd)/config:/opt/xray/config -v $(pwd)/reports:/opt/xray/reports xray-scanner xray --config /opt/xray/config/my-config.yaml webscan --url http://vulnerable-url.test1234 --html-output /opt/xray/reports/scan.html
```
