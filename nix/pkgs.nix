import ./pin.nix {
  config = {

    packageOverrides = pkgs: {
        haskell = pkgs.lib.recursiveUpdate pkgs.haskell {
        packageOverrides = hpNew: hpOld: {
            persistent-lens = hpNew.callPackage ../default.nix {};
            };
        };
    };
  };
}
