FROM python:3.11.4-slim-buster

LABEL .image.authors="ichaff1997@gmail.com"

WORKDIR /app

ADD pyproject.toml .bumpversion.cfg README.md ./

ADD prometheus_http_sd ./prometheus_http_sd/

RUN pip install --no-cache-dir . -i https://mirrors.aliyun.com/pypi/simple/

EXPOSE 8080

ENTRYPOINT ["prometheus-http-sd"]

CMD ["--log-level", "0", "serve", "-h", "0.0.0.0", "-p", "8080", "targets"]