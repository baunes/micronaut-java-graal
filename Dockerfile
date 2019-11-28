FROM oracle/graalvm-ce:19.2.1 as graalvm
COPY . /home/app/java-graal
WORKDIR /home/app/java-graal
RUN gu install native-image
RUN native-image --no-server -cp build/libs/java-graal-*-all.jar

FROM frolvlad/alpine-glibc
EXPOSE 8080
COPY --from=graalvm /home/app/java-graal/java-graal .
ENTRYPOINT ["./java-graal"]
