# 音频：PipeWire（替代 PulseAudio）
{ ... }:

{
  # 禁用 PulseAudio，启用 PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
