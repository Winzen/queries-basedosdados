FROM python:3.8-slim

# Setup virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy and install dependencies
WORKDIR /tmp
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

# Copy dbt project and profiles
WORKDIR /dbt
COPY . .

# Run dbt deps and dbt rpc
CMD ["/dbt/start-server.sh"]
