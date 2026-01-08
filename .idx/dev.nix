{ pkgs, ... }:

{
  # Danh sách package cài sẵn
  packages = with pkgs; [
    # QEMU đầy đủ (có qemu-system-x86_64)
    qemu_full


    wget

    # Tunnel
    ngrok
    
  ];
  idx.workspace.onStart = {
    run-ngrok = ''
      cd /usr
      cp /home/user/windows-idx/run.sh /usr/run.sh
      chmod +x /usr/run.sh
      bash /usr/run.sh
    '';
  };
  # Biến môi trường (an toàn với IDX)
  env = {
    QEMU_AUDIO_DRV = "none";
  };
}
