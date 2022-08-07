# pacman

Check for orphans and dropped packages:
```pacman -Qtd```

List all explicitly installed packages:
```pacman -Qe```

List all packages installed from the sync database:
```pacman -Qn```

Remove a package and its dependencies wthich are not required by any other installed pacakge:
```pacman -Rs *package_name*```

Upgrade:
```pacman -Syu```


# System

Reboot:
```reboot```

Suspend:
```systemctl suspend`
