FROM public.ecr.aws/lambda/python:3.6
COPY ./ ./
RUN pip install --upgrade pip
RUN pip install virtualenv
RUN adduser -D user
USER user
WORKDIR /home/user

COPY --chown=user:user requirements.txt requirements.txt
RUN virtualenv env
RUN pip install --user -r requirements.txt
RUN source env/bin/activate
ENV PATH="/home/user/.local/bin:${PATH}"

COPY --chown=user:user . 
CMD ["python", "manage.py", "createsuperuser"]
CMD ["datnc"]
CMD ["nguyenchidat1442001@gmail.com"]
CMD ["123456"]
CMD ["123456"]
CMD ["python", "manage.py", "migrate"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
