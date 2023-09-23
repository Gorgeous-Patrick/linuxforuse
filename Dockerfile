FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    sudo 


RUN apt-get install -y \
    git \
    curl \
    wget \
    vim \
    neovim \
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python3-wheel \
    python3-venv \
    zsh \
    ranger \
    thefuck \
    dpkg

# Install EZA
RUN apt install -y gpg
RUN chsh -s /usr/bin/zsh
RUN mkdir -p /etc/apt/keyrings
RUN wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
RUN chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
RUN apt update
RUN apt install -y eza


# Install bat
RUN apt install -y bat
RUN ln -s /usr/bin/batcat /usr/bin/bat

# link python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install RustUp
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
RUN chmod +x rustup.sh
RUN ./rustup.sh -y
RUN rm ./rustup.sh

CMD /usr/bin/zsh
