#Base Image

FROM python:3.9-slim

# working Dire

WORKDIR /app

# Copy COde

COPY . .

# RUN The BUILD command

RUN pip install -r requirements.txt

# PORT Ecpose

EXPOSE 80

# SERVE THE APP

CMD ["python","run.py"]
