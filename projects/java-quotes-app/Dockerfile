# Step 1 Base Image

FROM openjdk:17-jdk-alpine 
 ####name:tag


# Step 2 Working Directory Current working Directory

WORKDIR /app

# Step 3 COPY The CODE From your host/local to Container if copy all file the put . . copy all from local to conatiner 
#also path in copy is option if we put already path in WORKDIR

COPY src/Main.java /app/Main.java

COPY quotes.txt /app/quotes.txt

# Step 4 RUN the command to install supporting libraries or to compile code

RUN javac Main.java

# Step 5 Expose the port (optional if provided by developer)

EXPOSE 8000

# Step 6 Serve the app / Keep it running similar to CMD is ENTRYPOINT but entrypoint is static won't change in docker run command

CMD ["java","Main"]
