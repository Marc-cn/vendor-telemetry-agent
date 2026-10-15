FROM gcc:13
WORKDIR /work
COPY . /work
CMD ["bash", "-lc", "./configure && . ./env.sh && make && ./telemetry-agent; exec bash"]
