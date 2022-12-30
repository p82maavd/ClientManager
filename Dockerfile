# Use an official Python runtime as an image
FROM python:3.8

# The EXPOSE instruction indicates the ports on which a container 
# will listen for connections
# Since Flask apps listen to port 5000  by default, we expose it
EXPOSE 5000

# Install any needed packages specified in requirements.txt

WORKDIR /app
COPY . .
RUN pwd
RUN pip install -r requirements.txt

# Run app.py when the container launches

CMD [ "python3", "app/app.py" ]
