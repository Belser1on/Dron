import smtplib

message="asdad"
subject="prueba"

message="Subject: {}\n\n{}".format(subject,message)

server=smtplib.SMTP('smtp.gmail.com',587)
server.starttls()

server.login('programarucen@gmail.com','bbuoxasejgvuccnx')


server.sendmail('programarucen@gmail.com','christian.sotop@alumnos.ucentral.cl',message)

server.quit()