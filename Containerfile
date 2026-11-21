# Containerfile
# author: melon

# image base
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

# necessary and useful tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    iverilog yosys \
    python3 python3-pip python3-venv \
    ripgrep fd-find && \
    ln -sf "$(which fdfind)" /usr/local/bin/fd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir cocotb
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /workspace

CMD ["/bin/bash"]
