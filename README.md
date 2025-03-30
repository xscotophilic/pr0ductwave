# Django Product Hunt Clone

## Prerequisites

Before running this project, ensure you have the following installed:

- **Python** (>=3.9)
- **PostgreSQL** (>=12)

### PostgreSQL Database Setup

Create a PostgreSQL database and user with the following credentials:

```sql
CREATE DATABASE producthuntdb;
CREATE USER test WITH PASSWORD 'test';
ALTER ROLE test SET client_encoding TO 'utf8';
ALTER ROLE test SET default_transaction_isolation TO 'read committed';
ALTER ROLE test SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE producthuntdb TO test;
```

Ensure your `settings.py` has the correct database configuration:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'producthuntdb',
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
git clone https://github.com/xscotophilic/django-producthunt-clone.git
cd django-producthunt-clone
```

### 2. Using the Makefile

This project includes a `Makefile` to simplify setup. Run the following commands:

#### **Create and Activate Virtual Environment**
```bash
make venv
```

#### **Install Dependencies**
```bash
make install
```

#### **Apply Migrations**
```bash
make migrate
```

#### **Create a Superuser (Optional)**
```bash
make createsuperuser
```

#### **Run the Development Server**
```bash
make run
```

The project will be available at `http://127.0.0.1:8000/`.

#### **Freeze Dependencies (if you modify them)**
```bash
make freeze
```

#### **Clean Up**
To remove the virtual environment and temporary files:
```bash
make clean
```

## License

This project is licensed under the MIT License.
