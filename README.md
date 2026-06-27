# <p align="center"> `__Nix Home-manager 🏠__` </p>

### 1. Enable Experimental Features
Add below line to `/etc/nix/nix.conf`
```
experimental-features = nix-command flakes
```

---

### 2. Bootstrap Home-manager
```
nix run github:nix-community/home-manager -- switch --flake .#tau@linux-x86
```

---

### 3. Apply
Example: if on another Linux distro, (Refer `homeConfigurations = {};` in `flake.nix`)
```
nix run home-manager -- switch --flake .#tau@linux-x86
```

---

### To update,
```
nix flake update
home-manager switch --flake .#tau@linux-x86
```

---

### To manage genrations,
1. Delete
```
nix run home-manager expire-generations "-0 days"
```
