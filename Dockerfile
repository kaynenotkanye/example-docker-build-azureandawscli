FROM microsoft/azure-cli:2.0.59

ARG APP_VERSION=2.0.59
RUN echo "azure-cli plus awscli to support multi-cloud"
COPY awscli-bundle.zip /home/
RUN cd /home && unzip awscli-bundle.zip
RUN /home/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN pip3 install boto3
COPY entrypoint.sh /usr/local/bin/
COPY terraform /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
