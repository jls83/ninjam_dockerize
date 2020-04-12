## Ninjam Dockerize

### Getting Started
1. Pull down this repository on the machine you wish to install the server on
1. Install Docker for your target system; make sure Docker Compose is installed as well
1. Add any users to the `user_items.cfg` file
1. OPTIONAL: Make any changes you would like to the `server.cfg` file (e.g. default BPM, log location, etc.)
1. Run `docker-compose up`; confirm you can connect to the server at `localhost` (or whatever hostname you have set)

#### OPTIONAL: Run Container As Systemd Service
If your target host supports systemd services, do the following to enable automatic startup on system reboots & control via `systemctl`:
1. Make the appropriate changes to the paths in the `WorkingDirectory`, `ExecStart`, and `ExecStop` attributes in `ninjam_dockerize.service`
1. Run the following in a shell to copy the service file over:
    ```shell
    sudo cp ninjam_dockerize.service /etc/systemd/system/ninjam_dockerize.service
    ```
1. Run the following in a shell to enable the service:
    ```shell
    sudo systemctl enable ninjam_dockerize
    ```
1. Reboot the host to ensure the service starts on startup
