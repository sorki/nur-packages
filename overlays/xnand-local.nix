self: super:
let
  src = /home/srk/git/xnand;
  src-factoids = /home/srk/git/factoids;
in {
  haskellPackages = super.haskellPackages.override (old: {
    overrides = super.lib.composeExtensions (old.overrides or (_: _: { }))
    (hself: hsuper: {
        factoids = hself.callCabal2nix "factoids" src-factoids { };
        xnand-local = hself.callCabal2nix "xnand" src { };
    });
  });
}
