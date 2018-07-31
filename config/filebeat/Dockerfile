FROM docker.elastic.co/beats/filebeat:6.3.0
COPY module/gradle /usr/share/filebeat/module/gradle
COPY modules.d/gradle.yml.disabled /usr/share/filebeat/modules.d/gradle.yml
USER root
RUN chown -R filebeat /usr/share/filebeat/module/gradle 
RUN chown filebeat /usr/share/filebeat/modules.d/gradle.yml
USER filebeat