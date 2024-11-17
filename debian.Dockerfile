# Use the official Debian base image
FROM debian:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV NVM_DIR=/home/user/.nvm
ENV SHELL=/bin/zsh

# Update and install system packages
RUN apt-get update --quiet && \
    apt-get upgrade --quiet --yes && \
    apt-get install --quiet --yes --no-install-recommends \
        git \
        vim \
        curl \
        nmap \
        build-essential \
        python3 \
        python3-pip \
        zsh \
        sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m -s /bin/zsh user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the new user
USER user
WORKDIR /home/user

# Install Oh My Zsh
RUN sh -c "$(curl --silent --location https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN sh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Copy configuration files
COPY --chown=user:user .gitconfig /home/user/.gitconfig
COPY --chown=user:user .editorconfig /home/user/.editorconfig
COPY --chown=user:user .zshrc /home/user/.zshrc
COPY --chown=user:user .vimrc /home/user/.vimrc
COPY --chown=user:user .bashrc /home/user/.bashrc
COPY --chown=user:user .shell-git-aliases /home/user/.shell-git-aliases
COPY --chown=user:user .shell-node-aliases /home/user/.shell-node-aliases
COPY --chown=user:user .shell-npm-aliases /home/user/.shell-npm-aliases
COPY --chown=user:user .shell-git-utils /home/user/.shell-git-utils
COPY --chown=user:user .aliases /home/user/.aliases
COPY --chown=user:user .vimrc-simple /home/user/.vimrc-simple
COPY --chown=user:user install-golang.sh /home/user/install-golang.sh
COPY --chown=user:user setup-vim.sh /home/user/setup-vim.sh

RUN sh -c "chmod u+x /home/user/install-golang.sh && sudo ./install-golang.sh" 
RUN sh -c "chmod u+x /home/user/setup-vim.sh && ./setup-vim.sh"

# Set default shell
SHELL ["/bin/zsh", "-c"]

# Default command
CMD ["zsh"]

