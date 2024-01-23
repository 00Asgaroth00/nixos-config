{ pkgs, ... }: {

  home.packages = with pkgs; [
    kubectl
    cilium-cli
    hubble
    kustomize
    cmctl
    helm
    fluxcd
    talosctl
  ];

}