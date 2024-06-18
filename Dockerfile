FROM quay.io/astronomer/astro-runtime:10.9.0-python-3.10

# install dbt into a venv to avoid package dependency conflicts
WORKDIR "/usr/local/airflow"
COPY dbt-requirements.txt ./
RUN python -m virtualenv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir -r dbt-requirements.txt && deactivate