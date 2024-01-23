{ pkgs, ... }: {

  home.packages = with pkgs; [
    kubectl
    cilium-cli
    hubble-cli
    kustomize
    cmctl
    helm
    fluxcd
    talosctl
  ];

}