#https://linuxconfig.org/how-to-set-battery-charge-thresholds-on-linux
echo 40 | sudo tee /sys/class/power_supply/BAT0/charge_start_threshold
echo 50 | sudo tee /sys/class/power_supply/BAT0/charge_stop_threshold
