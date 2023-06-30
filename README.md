# URL Shortener

A simple URL shortener built with Ruby on Rails. This application allows you to shorten URLs, redirect to the original URL using the shortened URL, and view basic statistics. It also includes an admin dashboard for monitoring purposes.

## Requirements

- Ruby 3.2 or higher
- Rails 7.0 or higher
- PostgreSQL

## Installation

1. Clone the repository:
```sh
git clone https://github.com/yourusername/url-shortener.git
cd url-shortener
```
2. Install required gems:
```sh
bundle install
```
3. Create and set up the database:
```sh
rails db:create
rails db:migrate
```
4. Set admin username and password for accessing the admin dashboard via environment variables:
```sh
export ADMIN_NAME="your_admin_username"
export ADMIN_PASSWORD="your_secure_password"
```
5. Start the Rails server:
```sh
rails server
```

## Usage
- To shorten a URL, enter the original URL in the input field and click "Shorten".
- To visit the original URL, use the shortened URL.
- Admin can view a simple dashboard at /admin to monitor created shortened links and their usage.

## Running Tests
This application uses RSpec for testing. To run the test suite, simply execute:
```sh
bundle exec rspec
```

## Admin Dashboard
The admin dashboard can be accessed at `/admin`. This dashboard provides a simple table to monitor created shortened links and their associated original links, along with their click count.

Use the `ADMIN_NAME` and `ADMIN_PASSWORD` environment variables to set the credentials for accessing the admin dashboard.

## Localization
This app supports localization through I18n. To add new languages, add new locale files in `config/locales` directory. The default language is English.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Testing the API Endpoints
The URL Shortener application provides API endpoints for creating shortened URLs and retrieving their information. Below are the available API endpoints and how to test them.

### Creating a Shortened URL

- **Endpoint:** `/urls`
- **Method:** `POST`
- **Payload:** `{ "original_url": "<URL_TO_BE_SHORTENED>" }`
- **Example using curl:**
```sh
curl -X POST -H "Content-Type: application/json" -d '{"original_url": "https://example.com"}' http://localhost:3000/urls
```

### Retrieving Information about a Shortened URL

- **Endpoint:** /urls/:short_url
- **Method:** GET
- **Example using curl:**
```sh
curl http://localhost:3000/urls/SHORT_URL_CODE
```

### Retrieving Statistics about a Shortened URL
- **Endpoint:** /urls/:short_url/stats
- **Method:** GET
- **Example using curl:**
```sh
curl http://localhost:3000/urls/SHORT_URL_CODE/stats
```

Replace `<URL_TO_BE_SHORTENED>` and `SHORT_URL_CODE` with the actual URL to be shortened and the code of the shortened URL respectively.
