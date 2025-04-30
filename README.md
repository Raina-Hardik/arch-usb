# Arch USB Ricing Project

This project is designed to create a fully customized Arch Linux environment that can be used both in a Docker + VNC setup for testing and on a bootable USB for real-world usage. The goal is to maintain a consistent configuration between the two environments, ensuring that any changes made to configurations (e.g., dotfiles, installed tools) are synchronized across both setups.

## Project Overview

1. **Docker + VNC Setup**:
   - Use Docker and a VNC extension to test and preview the riced Arch Linux environment.
   - This allows for experimentation and refinement of configurations before deploying them to the USB.

2. **USB Deployment**:
   - Deploy the finalized Arch Linux setup to a USB drive.
   - The USB will serve as a bootable Arch Linux system, isolated to the USB, and usable as a normal operating system.

3. **Configuration Synchronization**:
   - Ensure that all configuration changes (e.g., tmux dotfiles, swapping tmux for gostty) are reflected in both the Docker + VNC setup and the USB setup.
   - Regularly upload the entire system configuration (excluding personal files) to Git for version control and backup.

## Folder Structure

- **bin/**: Contains setup and update scripts.
- **config/**: Houses configuration files for various tools and environments (e.g., i3, ncmpcpp, nvim, tmux, vim, zsh).
- **docker/**: Includes Docker-related files such as `docker-compose.yml` and `Dockerfile`.
- **docs/**: Documentation files, including setup instructions.
- **usb/**: Scripts and configurations for setting up the USB environment.

## Usage

1. **Testing with Docker + VNC**:
   - Use the Docker setup to test and refine your Arch Linux environment.
   - Make configuration changes as needed and verify them in the VNC environment.

2. **Deploying to USB**:
   - Once satisfied with the setup, use the scripts in the `usb/` folder to deploy the environment to a USB drive.

3. **Synchronizing Configurations**:
   - Regularly commit and push changes to Git to ensure both environments stay in sync.

## Notes

- This project is focused on system configurations and does not include personal files.
- The goal is to create a portable, consistent, and customizable Arch Linux environment.
- And above all, have fun with it! Contributions and suggestions are welcome but the project is just for my own use and ricing fun. If you want to use it, feel free to do so but be aware that it is not a polished product and may not work as expected. Use at your own risk.
