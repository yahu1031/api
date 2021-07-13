# Use Google's official Dart image.
# https://hub.docker.com/r/google/dart
FROM google/dart

# WORKDIR /app

# COPY pubspec.* /app/

RUN pub get

# ADD . /app/

# Why do we need to run pub get twice?
# Answer: https://hub.docker.com/r/google/dart#:~:text=Why%20run%20pub%20get%20twice
RUN pub get --offline

# CMD ["cd", "app"]

ENTRYPOINT [ "/usr/bin/dart", "run", "bin/fluttermatic_api.dart" ]
# This must listen to $PORT environment variable.
# $PORT is set to 8080 by default.
# We will be using the port 1031 to run the server.
ENV PORT 1031