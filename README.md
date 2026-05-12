# How to use?

### 1. Enable Experimental Features
```
expermental-features = nix-command flakes
```

---

### 2. Bootstrap Home-manager
```
nix run github:nix-community/home-manager -- switch --flake .#<username>@linux-x86
```

---

### Apply
Example: if on another Linux distro, (Refer `homeConfigurations = {};` in `flake.nix`)
```
home-manager switch --flake .#<username>@linux-x86
```

---

### To update,
```
nix flake update
home-manager switch --flake .#<username>@linux-x86
```
