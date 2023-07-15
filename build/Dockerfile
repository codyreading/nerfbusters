FROM dromni/nerfstudio:0.3.2

# Change Nerfstudio Branch
WORKDIR /
RUN git clone https://github.com/nerfstudio-project/nerfstudio.git
RUN cd nerfstudio && git checkout nerfbusters-changes && pip install -e .


# Install Nerfbusters
WORKDIR /nerfbusters
COPY nerfbusters nerfbusters
COPY pyproject.toml pyproject.toml
RUN pip install -e .


# Install binbox
COPY bins bins
