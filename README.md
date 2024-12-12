Description: Easy Setup Script for n8n and Docker 

This script is designed to make setting up the n8n-io/self-hosted-ai-starter-kit project simple and interactive. It helps you install Docker, securely configure passwords, and deploy the system with just a few prompts. Here's what it does:

What the Script Does
Installs Docker:

Automatically installs Docker and Docker Compose if they’re not already set up.
Verifies the installation to ensure everything works smoothly.
Custom Passwords:

Guides you through setting passwords for important systems like:
The PostgreSQL database.
Encryption keys for secure data handling.
JWT secrets for user management.
Ensures you enter and confirm the passwords, reducing mistakes.
Environment Setup:

Creates a configuration file (.env) with your custom passwords.
Makes sure these passwords are securely passed to the system during deployment.
Deploys Services:

Downloads the n8n-io/self-hosted-ai-starter-kit project from GitHub.
Lets you choose between CPU or GPU setups based on your needs.
Starts the services automatically using Docker Compose.
Error Handling:

Checks if Docker is installed properly before moving forward.
Ensures all necessary information is provided, so nothing breaks during setup.
Why You’ll Love It
Interactive: You’re in control—set passwords and configurations that work for you.
Automated: Skip the manual hassle of installing Docker and setting up the system step by step.
Secure: Your passwords and keys are handled with care and stored in a secure configuration.
Flexible: Whether you’re running on a CPU or GPU, the script adapts to your needs.
Who Should Use This Script?
This script is perfect for anyone who wants to:

Deploy n8n quickly and securely.
Avoid the technical overhead of setting up Docker and related services manually.
Get started with self-hosted automation workflows without worrying about complex configurations.
