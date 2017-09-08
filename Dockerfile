FROM ubuntu:16.04

# required inputs
ADD blockbench /home/dinhtta/blockbench
ADD blockbench-libs /usr/local/lib
ADD parity /usr/bin/parity
ADD start.sh /root/start.sh


# required by kvstore client

RUN apt-get update && apt-get -y install libcurl3

# add default user and add keys
RUN useradd -ms /bin/bash dinhtta

RUN mkdir -p /home/dinhtta/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkNKa6akB9X4bbfvlffT+oa7LQFJd1684FsmLXXptBPmImP+Xxpw930Zsao4lDzrHW46uOxu0LMiwmB50Z3oln8j2ng+z2rFRLgT0Rw7Ss540BlNF4DM9ZcrDlHgx8wKmCTXqmy4Ow5CoGnql4nGbB7FEXN2+t0R2dXYimwJWuPQyPXjaNG59bVQdG2DK/jPEgLhQcjHc9qv1YzSve/OkyRfGHN1fxj4FEQ1miXaqnp0jScmjfmxfuvkClmT7lZM+BdPj/7dau2IesFiorbYB8zPo1fjH3SppsO6JGXqthRXnFyyDPkxso9jmYyyAHjxGLPvegCQbWFRRA2ERKlwFl root@blockbench02" >> /home/dinhtta/.ssh/authorized_keys
RUN chmod 700 /home/dinhtta/.ssh/authorized_keys


RUN mkdir -p /root/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkNKa6akB9X4bbfvlffT+oa7LQFJd1684FsmLXXptBPmImP+Xxpw930Zsao4lDzrHW46uOxu0LMiwmB50Z3oln8j2ng+z2rFRLgT0Rw7Ss540BlNF4DM9ZcrDlHgx8wKmCTXqmy4Ow5CoGnql4nGbB7FEXN2+t0R2dXYimwJWuPQyPXjaNG59bVQdG2DK/jPEgLhQcjHc9qv1YzSve/OkyRfGHN1fxj4FEQ1miXaqnp0jScmjfmxfuvkClmT7lZM+BdPj/7dau2IesFiorbYB8zPo1fjH3SppsO6JGXqthRXnFyyDPkxso9jmYyyAHjxGLPvegCQbWFRRA2ERKlwFl root@blockbench02" >> /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh/authorized_keys


RUN mkdir /data
RUN chown dinhtta:dinhtta /data

RUN chown -R dinhtta:dinhtta /home/dinhtta

RUN chmod +x /root/start.sh

CMD /root/start.sh
