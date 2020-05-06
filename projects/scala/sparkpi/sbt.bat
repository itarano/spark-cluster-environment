@ECHO OFF
SET version=latest
SET docker_image=mozilla/sbt
docker inspect %docker_image%:%version% 2> nul 1> nul || docker pull %docker_image%:%version% 1> nul
SET path_volume=%cd%
docker run -it --rm -v %path_volume%:/app -w /app %docker_image%:%version% %*