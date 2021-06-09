from flask import *
from flask_cors import CORS
from utils import *
app = Flask(__name__)
CORS(app)
app.secret_key = 'some_secret'

@app.route('/')
def index():
    return render_template('index.html')
        
@app.route('/doctor')
def doctor():
    return render_template('doctor.html')

@app.route('/registerdoctor',methods=['POST'])
def register_doctor():
    name=request.form['name']
    email=request.form['email']
    phone=request.form['Phone']
    hname=request.form['HospitalName']
    licence=request.form['licence']
    psw=request.form['psw']
    psw_repeat=request.form['psw-repeat']
    add_doctor(name,email,phone,hname,licence,psw)
    return render_template('doctor.html')

@app.route('/logindoctor',methods=['POST'])
def login_doctor():
    uid=request.form['username']
    print("yes")
    password=request.form['psw']
    print(uid,password)
    val=validate_doctor(uid,password)
    if val==1:
        name,uidin=getname_patient(uid)
        session['uidval_doctor'] = uid
        
        return render_template("doctor_dashboard.html",user_name=name , allow=True)
    else :
        return render_template("index.html")

@app.route('/patinetaccess',methods=['POST'])
def patient_codes():
    patient_uid=request.form['pid']
    patinet_access=request.form['pcode']
    session['patinet_uid'] = patient_uid
    session['patinet_access'] = patinet_access
    val=check_codes(patient_uid,patinet_access)
    if val==1:
        name,uidin=getname_patient(session['uidval_doctor'])
        return render_template("doctor_dashboard.html",user_name=name, access=True)
    else:
        return render_template("index.html")


@app.route('/patinetaccess',methods=['GET'])
def add_data():
    name,uidin=getname_patient(session['uidval_doctor'])
    return render_template("doctor_dashboard.html",user_name=name,add=True)
   
@app.route('/insertdata',methods=['POST'])
def insert_data():
    patient_diagnosis=request.form['diag']
    patinet_prescription=request.form['pres']
    insert_val( session['patinet_uid'],session['patinet_access'],patient_diagnosis,patinet_prescription,session['uidval_doctor'])
    name,uidin=getname_patient(session['uidval_doctor'])
    return render_template("doctor_dashboard.html",user_name=name,add=True)


@app.route('/registerpatient',methods=['POST'])
def register_patient():
    name=request.form['name']
    email=request.form['email']
    phone=request.form['Phone']
    dob=request.form['dob']
    psw=request.form['psw']
    psw_repeat=request.form['psw-repeat']
    print(name,email,phone,psw,dob)
    add_patient(name,email,phone,psw,dob)
    return render_template('patient.html')

@app.route('/loginpatient',methods=['POST'])
def login_patient():
    uid=request.form['username']
    print("yes")
    password=request.form['psw']
    print(uid,password)
    val=validate_patinet(uid,password)
    if val==1:
        name,uidin=getname_patient(uid)
        session['uidval'] = uid
    
        return render_template("patient_dashboard.html",user_name=name,uid=uidin)
    else :
        return render_template("index.html")




@app.route('/generate_pin')
def pin():
    my_uid= session.get('uidval', None)
    name,uidin=getname_patient(my_uid)
    pin=generate_pin()
    insert_pin(pin,uidin)
    return render_template('patient_dashboard.html',user_name=name,pin=pin,uid=uidin)


@app.route('/allow_access')
def allow():
    my_uid= session.get('uidval', None)
    name,uidin=getname_patient(my_uid)
    allow_access(uidin)
    PIN=read_pin(uidin)
    return render_template('patient_dashboard.html',user_name=name,pin=PIN,access="ACCESS ALLOWED",uid=uidin)  

@app.route('/block_access')
def deny():
    my_uid= session.get('uidval', None)
    name,uidin=getname_patient(my_uid)
    block_access(uidin)
    PIN=read_pin(uidin)
    return render_template('patient_dashboard.html',user_name=name,pin=PIN,deny="ACCESS BLOCKED",uid=uidin)  



@app.route('/registerhospital',methods=['POST'])
def register_hospital():
    name=request.form['name']
    email=request.form['email']
    phone=request.form['Phone']
    reg=request.form['licence']
    login_type=request.form['login_type']
    hname=request.form['hname']
    psw=request.form['psw']
    psw_repeat=request.form['psw-repeat']
    add_hospital(name,email,phone,reg,login_type,psw,hname)
    return render_template('hospital.html')

@app.route('/loginhospital',methods=['POST'])
def login_hospital():
    uid=request.form['username']
    print("yes")
    password=request.form['psw']
    print(uid,password)
    val=validate_hospital(uid,password,)
    if val==1:
        name=getname(uid)
        return render_template("patient_dashboard.html",user_name=name)
    else :
        return render_template("index.html")
    





@app.route('/hospital')
def hospital():
    return render_template('hospital.html')

@app.route('/patient')
def patient():
    return render_template('patient.html')

@app.route('/doctor_dashboard')
def doctor_dashboard():
    return render_template('doctor_dashboard.html')

@app.route('/patient_dashboard')
def patient_dashboard():
    data=read_data()
    return render_template('patient_dashboard.html',user_name="Mahesh",output_data=data)

if __name__ == '__main__':

    app.run(host='127.0.0.1', port=5001,debug=True,threaded=True)