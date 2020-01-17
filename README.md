# PCOV vvv utility

PCOV utility for VVV

This utility will set up [PCOV](https://github.com/krakjoe/pcov) on your [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV).

## Usage

In your `vvv-customy.yml` file add under `utilities`:

```yml
utilities:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
  pcov:
    - pcov

utility-sources:
  pcov: 
    repo: https://github.com/dingo-d/pcov-vvv-utility.git
    branch: master
```

The `core` utilities are there by default, and `pcov` doesn't depend on them.

Once you add it, be sure you re-provision your VVV with `vagrant reload --provision`.

### Why would you need it?

PCOV is a self contained CodeCoverage compatible driver for PHP7, and using it alongside with [pcov-clobber](https://github.com/krakjoe/pcov-clobber)
will make running code coverage in WordPress automated tests a lot faster.