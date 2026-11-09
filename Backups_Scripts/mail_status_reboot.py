import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

SMTP_SERVER = "mailserver.example.com"
SMTP_PORT = 587
SMTP_USER = "noreply@example.com"
SMTP_PASS = ""

FROM = SMTP_USER
TO = ["josedavid@example.com"]

msg = MIMEMultipart()
msg["From"] = FROM
msg["To"] = ", ".join(TO)
msg["Subject"] = "CLUBOR MAIL STATUS"

body = """
Buenas,

El servidor CLUBOR se ha reiniciado.

Este es un correo enviado automáticamente para comprobar el estado del servidor de correo eléctronico CLUBOR.

Si has recibido este mail es que todo funciona correctamente.

Saludos.
"""
msg.attach(MIMEText(body, "plain"))

with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
    server.starttls()
    server.login(SMTP_USER, SMTP_PASS)
    server.sendmail(FROM, TO, msg.as_string())
