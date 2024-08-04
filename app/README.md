# <img src="assets/logo-colored.svg" width="27"> **Not Zero - Flutter app**

## Building and running

First of all app is built using Flutter SDK.
To install it follow [**the official guide**](https://docs.flutter.dev/get-started/install).

Also you need to create Supabase project. Here is 2 options:

- [Self hosted](https://supabase.com/docs/guides/self-hosting)
- Managed (from [the website](https://supabase.com))
- With [Supabase CLI](https://supabase.com/docs/reference/cli/introduction) (for development only)

This Flutter project uses environment variables to manage settings for development and production environments. The .env.example file serves as a template for creating .env.dev and .env.prod files, which are used for the development and production environments, respectively. To set up, simply copy .env.example to create .env.dev and .env.prod, then fill in the relevant values for each environment. These files are not version-controlled to protect sensitive information.

The you can build and run your app as with any other Flutter app. [Flutter Get Started](https://docs.flutter.dev/get-started/codelab)
