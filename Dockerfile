
FROM python:3.12-alpine

WORKDIR /app

# 设置环境变量
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    # WebUI 默认配置
    # WEBUI_ACCESS_PASSWORD=your_secret_password
    WEBUI_HOST=0.0.0.0 \
    WEBUI_PORT=8316 \
    LOG_LEVEL=info \
    DEBUG=0

COPY ./requirements.txt  /app/
RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple

# 复制项目代码
COPY . .

# 暴露端口
EXPOSE 8316

# 启动 WebUI
CMD ["python", "webui.py"]
