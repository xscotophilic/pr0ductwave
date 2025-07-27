# Pr0ductWave

Pr0ductWave is a platform where users can **post, discover, and support new products**.

## Features

- Submit and share new product ideas with the community
- Discover trending and new products posted by others
- Support and engage with your favorite products

## Prerequisites

Before running Pr0ductWave locally, ensure you have:

- **Python 3.9 or higher**
- **PostgreSQL 12 or higher**

## PostgreSQL Database Setup

Create a database and user for the application with the following commands in your PostgreSQL shell:

```sql
CREATE DATABASE pr0ductwavedb;
CREATE USER test WITH PASSWORD 'test';
ALTER ROLE test SET client_encoding TO 'utf8';
ALTER ROLE test SET default_transaction_isolation TO 'read committed';
ALTER ROLE test SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE pr0ductwavedb TO test;
```

Ensure these credentials match your Django `settings.py` database configuration:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'pr0ductwavedb',
        'USER': 'test',
        'PASSWORD': 'test',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
```

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/xscotophilic/pr0ductwave.git
cd pr0ductwave
```

### 2. Use the Makefile to Simplify Setup

The project includes a Makefile with commands to automate setup steps:

- **Create and activate virtual environment**

  ```bash
  make venv
  ```

- **Install project dependencies**

  ```bash
  make install
  ```

- **Apply database migrations**

  ```bash
  make migrate
  ```

- **Create a superuser (optional, for admin access)**

  ```bash
  make createsuperuser
  ```

- **Run the development server**

  ```bash
  make run
  ```

Server will be accessible at [http://127.0.0.1:8000/](http://127.0.0.1:8000/).

### Additional Make commands

- **Freeze current dependency versions**

  ```bash
  make freeze
  ```

- **Clean up virtual environment and temporary files**

  ```bash
  make clean
  ```

## License

This project is licensed under the MIT License.
