# Setup printer

### Before use
Install CUPS and all other bluetooth things from the packages and enable the cups.service

## Others
```sh
system-config-printer
```

## For HP
> hplip
```sh
yay -S hplip
hp-setup -i <ip addr of printer>
```

## To get ip addr of printer
```sh
yay -S nmap
sudo nmap -sP <your subnet>
```

### Get your subnet
```sh
ip addr show
```
> the subnet is the first 3 octets followed by 0 octet
