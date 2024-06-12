srun --nodes=1 --exclusive --time=00:20:00 --account=ta160 \
     --partition=standard --qos=short --reservation=shortqos \
     --pty /bin/bash
