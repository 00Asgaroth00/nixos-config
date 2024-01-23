{ pkgs, ... }: {

  home.packages = with pkgs; [
    kubectl
    cilium-cli
    hubble
    kustomize
    cmctl
    kubernetes-helm
    fluxcd
    talosctl
  ];

}