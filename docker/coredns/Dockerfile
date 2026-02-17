# Use the official CoreDNS image
FROM coredns/coredns:latest

# Copy your custom configuration into the container
COPY Corefile /etc/coredns/Corefile

# Expose DNS ports (53 for both TCP and UDP)
EXPOSE 53 53/udp

# Run CoreDNS with the custom config
ENTRYPOINT ["/coredns"]
CMD ["-conf", "/etc/coredns/Corefile"]
