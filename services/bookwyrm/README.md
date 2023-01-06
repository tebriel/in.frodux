# Bookwyrm Instance

Hosting this is kind of a bear at the moment, writing down instructions for posterity. [Documentation](https://docs.joinbookwyrm.com/) is available.

## Container

The Container has some patches in it, grab the latest release from tebriel/bookwyrm-docker, always use the sha.

## Database Migrations

Deploy the latest app and exec into the web container and run the following:

```sh
python manage.py migrate
python manage.py compile_themes
python manage.py collectstatic --no-input
```
