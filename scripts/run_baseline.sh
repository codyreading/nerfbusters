python scripts/launch_nerf.py train --experiment-name baselines
python scripts/launch_nerf.py train --experiment-name pseudo-gt
bash scripts/render_all.sh
bash scripts/metrics_all.sh