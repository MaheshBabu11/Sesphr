import secrets
import mysql.connector
import time
import math, random
import hashlib
from base64 import urlsafe_b64encode as b64e, urlsafe_b64decode as b64d
from datetime import date
from cryptography.fernet import Fernet
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC

conn=mysql.connector.connect(host="localhost",username="root",password="",database="sesphr")
conn1=mysql.connector.connect(host="localhost",username="root",password="",database="clone")
cursor = conn.cursor()
cursor1 = conn1.cursor()



def hash(val):
    result = hashlib.sha512(val.encode()).hexdigest()
    return result


backend = default_backend()
iterations = 1000

def _derive_key(password: bytes, salt: bytes, iterations: int = iterations) -> bytes:
    """Derive a secret key from a given password and salt"""
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(), length=32, salt=salt,
        iterations=iterations, backend=backend)
    return b64e(kdf.derive(password))

def password_encrypt(message: bytes, password: str, iterations: int = iterations) -> bytes:
    salt = secrets.token_bytes(16)
    key = _derive_key(password.encode(), salt, iterations)
    return b64e(
        b'%b%b%b' % (
            salt,
            iterations.to_bytes(4, 'big'),
            b64d(Fernet(key).encrypt(message)),
        )
    )

def password_decrypt(token: bytes, password: str) -> bytes:
    decoded = b64d(token)
    salt, iter, token = decoded[:16], decoded[16:20], b64e(decoded[20:])
    iterations = int.from_bytes(iter, 'big')
    key = _derive_key(password.encode(), salt, iterations)
    return Fernet(key).decrypt(token)
    

   
def add_doctor(name,email,phone,hname,licence,password):
    
    sql="SELECT EXISTS (SELECT 1 FROM login_doctor)"
    cursor.execute(sql)
    val=cursor.fetchall()
    for i in val:
        for  j in i:
            value=j
            break

    if value==0:
        uid=111111
    else:
        sql="select uid from login_doctor order by uid desc limit 1"
        cursor.execute(sql)
        val=cursor.fetchall()
        for i in val:
            for  j in i:
                uid=j+1
                break
    encrypted_name=password_encrypt(name.encode(),"everythingissafe")
    encrypted_email=password_encrypt(email.encode(),"everythingissafe")
    encrypted_phone=password_encrypt(phone.encode(),"everythingissafe")
    encrypted_pass=password_encrypt(password.encode(),"everythingissafe")
    encrypted_hname=password_encrypt(hname.encode(),"everythingissafe")
    encrypted_licence=password_encrypt(licence.encode(),"everythingissafe")
    sql = "INSERT INTO doctor_details (name,email,phone,pass,hospitalname,regno,uid) VALUES (%s, %s,%s,%s,%s,%s,%s)"
    val=(encrypted_name,encrypted_email,encrypted_phone,encrypted_pass,encrypted_hname,encrypted_licence,uid)
    cursor.execute(sql,val)
    conn.commit()

    hashed_email=hash(email)
    hashed_password=hash(password)
    sql = "INSERT INTO login_doctor (email,pass,uid) VALUES (%s, %s,%s)"
    val=(hashed_email,hashed_password,uid)
    cursor.execute(sql,val)
    conn.commit()
    return

def add_patient(name,email,phone,password,dob):
    
    sql="SELECT EXISTS (SELECT 1 FROM login_patient)"
    cursor.execute(sql)
    val=cursor.fetchall()
    for i in val:
        for  j in i:
            value=j
            break

    if value==0:
        uid=111111
    else:
        sql="select uid from login_patient order by uid desc limit 1"
        cursor.execute(sql)
        val=cursor.fetchall()
        for i in val:
            for  j in i:
                uid=j+1
                break
    encrypted_name=password_encrypt(name.encode(),"everythingissafe")
    encrypted_email=password_encrypt(email.encode(),"everythingissafe")
    encrypted_phone=password_encrypt(phone.encode(),"everythingissafe")
    encrypted_pass=password_encrypt(password.encode(),"everythingissafe")
    encrypted_dob=password_encrypt(dob.encode(),"everythingissafe")
    sql = "INSERT INTO patient_details (name,email,phone,pass,dob,otp,allow_acess,uid) VALUES (%s, %s,%s,%s,%s,%s,%s,%s)"
    val=(encrypted_name,encrypted_email,encrypted_phone,encrypted_pass,encrypted_dob,"0000","0",uid)
    cursor.execute(sql,val)
    conn.commit()

    hashed_email=hash(email)
    hashed_password=hash(password)
    sql = "INSERT INTO login_patient (email,pass,uid) VALUES (%s, %s,%s)"
    val=(hashed_email,hashed_password,uid)
    cursor.execute(sql,val)
    conn.commit()
    name='t'+str(uid)
    sql ="""CREATE TABLE {tname} (current_date1 date,diagnosis longtext,doctor_uid int(6),prescription longtext,test_type longtext,result longtext)""".format(tname=name)
    cursor.execute(sql)
    cursor1.execute(sql)
    conn.commit()
    conn1.commit()
    return

def add_hospital(name,email,phone,reg,login_type,password,hname):
    
    sql="SELECT EXISTS (SELECT 1 FROM login_hospital)"
    cursor.execute(sql)
    val=cursor.fetchall()
    for i in val:
        for  j in i:
            value=j
            break

    if value==0:
        uid=111111
    else:
        sql="select uid from login_hospital order by uid desc limit 1"
        cursor.execute(sql)
        val=cursor.fetchall()
        for i in val:
            for  j in i:
                uid=j+1
                break
    encrypted_name=password_encrypt(name.encode(),"everythingissafe")
    encrypted_email=password_encrypt(email.encode(),"everythingissafe")
    encrypted_phone=password_encrypt(phone.encode(),"everythingissafe")
    encrypted_type=password_encrypt(login_type.encode(),"everythingissafe")
    encrypted_pass=password_encrypt(password.encode(),"everythingissafe")
    encrypted_reg=password_encrypt(reg.encode(),"everythingissafe")
    encrypted_hname=password_encrypt(hname.encode(),"everythingissafe")
    sql = "INSERT INTO hospital_details (type,name,email,phone,pass,hospitalname,regno,uid) VALUES (%s, %s,%s,%s,%s,%s,%s,%s)"
    val=(encrypted_type, encrypted_name,encrypted_email,encrypted_phone,encrypted_pass,encrypted_hname,encrypted_reg,uid)
    cursor.execute(sql,val)
    conn.commit()

    hashed_email=hash(email)
    hashed_password=hash(password)
    sql = "INSERT INTO login_hospital (email,pass,uid) VALUES (%s, %s,%s)"
    val=(hashed_email,hashed_password,uid)
    cursor.execute(sql,val)
    conn.commit()
    return

def validate_doctor(uid,password):
    hashed_uid=hash(uid)
    hashed_password=hash(password)
    sql="SELECT pass FROM login_doctor where email =%s"
    data=(str(hashed_uid),)
    cursor.execute(sql,data)
    val=cursor.fetchall()
    for i in val:
        for  j in i:
            value=j
            break
    if value==hashed_password:
        return 1
    else:
        return 0

def validate_patinet(uid,password):
    hashed_uid=hash(uid)
    hashed_password=hash(password)
    sql="SELECT pass FROM login_patient where email =%s"
    data=(str(hashed_uid),)
    cursor.execute(sql,data)
    val=cursor.fetchall()
    for i in val:
        for  j in i:
            value=j
            break
    if value==hashed_password:
        return 1
    else:
        return 0

def validate_hospital(uid,password):
    hashed_uid=hash(uid)
    hashed_password=hash(password)
    sql="SELECT pass FROM login_hospital where email =%s"
    data=(str(hashed_uid),)
    cursor.execute(sql,data)
    val=cursor.fetchall()
    for i in val:
        for  j in i:
            value=j
            break
    if value==hashed_password:
        return 1
    else:
        return 0

def read_data():
    sql="SELECT * from login_patient"
    cursor.execute(sql)
    data= cursor.fetchall()
    values=[]
    

def generate_pin():
    digits = "0123456789"
    OTP = ""
    for i in range(4) :
        OTP += digits[math.floor(random.random() * 10)]
    
    return OTP

def insert_pin(otp,uid):
    cursor.execute("""UPDATE patient_details SET otp=%s WHERE uid=%s""",(otp, uid))
    conn.commit()
    return
def read_pin(uid):
    cursor.execute("""SELECT otp from patient_details WHERE uid=%s""",(uid,))
    val=cursor.fetchall()
    print(val)
    for i in val:
        for  j in i:
            value=j
            break
    return value

def allow_access(uid):
    cursor.execute("""UPDATE patient_details SET allow_acess=%s where uid=%s""",(1,uid))
    conn.commit()
    return

def block_access(uid):
    cursor.execute("""UPDATE patient_details SET allow_acess=%s where uid=%s""",(0,uid))
    conn.commit()
    return


def getname_patient(uid):
    sql="SELECT uid FROM login_patient where email =%s"
    hashed_uid=hash(uid)
    print(hashed_uid)
    data=(str(hashed_uid),)
    cursor.execute(sql,data)
    val=cursor.fetchall()
    print(val)
    for i in val:
        for  j in i:
            value=j
            break
    print(value)
    sql="select name from patient_details where uid=%s"
    data=(value,)
    cursor.execute(sql,data)
    val=cursor.fetchall()
    print(val)
    for i in val:
        for j in i:
            ename=j
            break
    
    name=password_decrypt(ename,"everythingissafe")
    
    return name.decode("utf-8") ,value


def getname_doctor(uid):
    sql="SELECT uid FROM login_doctor where email =%s"
    hashed_uid=hash(uid)
    print(hashed_uid)
    data=(str(hashed_uid),)
    cursor.execute(sql,data)
    val=cursor.fetchall()
    print(val)
    for i in val:
        for  j in i:
            value=j
            break
    print(value)
    sql="select name from doctor_details where uid=%s"
    data=(value,)
    cursor.execute(sql,data)
    val=cursor.fetchall()
    print(val)
    for i in val:
        for j in i:
            ename=j
            break
    
    name=password_decrypt(ename,"everythingissafe")
    
    return name.decode("utf-8") ,value


def check_codes(uid,password):
    cursor.execute("""SELECT otp from patient_details WHERE uid=%s""",(uid,))
    val=cursor.fetchall()
    print(val)
    for i in val:
        for  j in i:
            value=j
            break
    print(value)
    cursor.execute("""SELECT allow_acess from patient_details WHERE uid=%s""",(uid,))
    val2=cursor.fetchall()
    print(val2)
    for i in val2:
        for  j in i:
            value2=j
            break
    print(value2)
    if value == password and value2=="1":
        return 1
    else :
        return 0

def insert_val( uid,passcde,diag,pres,did):
    today = date.today()
    print(today)
    name="t"+uid
    print(name)
    enc_diag=password_encrypt(diag.encode(),"everythingissafe")
    enc_pres=password_encrypt(pres.encode(),"everythingissafe")
    sql ="""INSERT into {tname} (current_date1,diagnosis,doctor_uid,prescription,test_type,result)VALUES(%s %s %s %s %s %s) """.format(tname=name)
    data=(today,enc_diag,did,enc_pres,"","")
    cursor.execute(sql,data)
    conn.commit()
    return 
    