from flask import *
from flask_cors import CORS
from utils import *
from datetime import timedelta

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
    val=add_doctor(name,email,phone,hname,licence,psw)
    if val==1:
        return render_template('doctor.html',userin=True)
    else:
        return render_template('doctor.html',useradded=True)

@app.route('/logindoctor',methods=['POST'])
def login_doctor():
    uid=request.form['username']
    print("yes")
    password=request.form['psw']
    print(uid,password)
    val=validate_doctor(uid,password)
    if val==1:
        name,uidin=getname_doctor(uid)
        session['uidval_doctor'] = uid
        
        return render_template("doctor_dashboard.html",user_name=name , allow=True)
    else :
        return render_template("doctor.html",failure=True)

@app.route('/patinetaccess',methods=['POST'])
def patient_codes():
    patient_uid=request.form['pid']
    patinet_access=request.form['pcode']
    session['patinet_uid'] = patient_uid
    session['patinet_access'] = patinet_access
    val=check_codes(patient_uid,patinet_access)
    if val==1:
        name,uidin=getname_doctor(session['uidval_doctor'])
        return render_template("doctor_dashboard.html",user_name=name, access=True)
    else:
        name,uidin=getname_patient(session['uidval_doctor'])
        return render_template("doctor_dashboard.html",user_name=name,allow=True,failure=True)


@app.route('/patinetaccess',methods=['GET'])
def add_data():
    name,uidin=getname_patient(session['uidval_doctor'])
    return render_template("doctor_dashboard.html",user_name=name,add=True)
   
@app.route('/insertdata',methods=['POST'])
def insert_data():
    patient_diagnosis=request.form['diag']
    patinet_prescription=request.form['pres']
    name,uidin=getname_patient(session['uidval_doctor'])
    if (check_codes(session['patinet_uid'],session['patinet_access'])):
        insert_val( session['patinet_uid'],session['patinet_access'],patient_diagnosis,patinet_prescription,uidin)
        return render_template("doctor_dashboard.html",user_name=name,sucess=True,access=True)
    else:
        return render_template("doctor_dashboard.html",user_name=name,failure=True)

@app.route('/showdata',methods=['GET'])
def show_data():
    data=view_data(session['patinet_uid'])
    name,uidin=getname_patient(session['uidval_doctor'])
    return render_template("doctor_dashboard.html",user_name=name,output_data=data)

@app.route('/registerpatient',methods=['POST'])
def register_patient():
    name=request.form['name']
    email=request.form['email']
    phone=request.form['Phone']
    dob=request.form['dob']
    psw=request.form['psw']
    psw_repeat=request.form['psw-repeat']
    print(name,email,phone,psw,dob)
    val=add_patient(name,email,phone,psw,dob)
    if val==1:
        return render_template('patient.html',userin=True)
    else:
        return render_template('patient.html',useradded=True)

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
        data=view_data(uidin)
        return render_template("patient_dashboard.html",user_name=name,uid=uidin,output_data=data)
    else :
        return render_template("patient.html",failure=True)

@app.route('/loginpatient',methods=['GET'])
def logout_patient():
    my_uid= session.get('uidval', None)
    name,uidin=getname_patient(my_uid)
    block_access(uidin)
    flash('You were successfully logged out')
    return render_template('patient.html')



@app.route('/generate_pin')
def pin():
    my_uid= session.get('uidval', None)
    name,uidin=getname_patient(my_uid)
    pin=generate_pin()
    data=view_data(uidin)
    insert_pin(pin,uidin)
    return render_template('patient_dashboard.html',user_name=name,pin=pin,uid=uidin,output_data=data)


@app.route('/allow_access')
def allow():
    my_uid= session.get('uidval', None)
    name,uidin=getname_patient(my_uid)
    allow_access(uidin)
    PIN=read_pin(uidin)
    data=view_data(uidin)
    return render_template('patient_dashboard.html',user_name=name,pin=PIN,access="ACCESS ALLOWED",uid=uidin,output_data=data)  

@app.route('/block_access')
def deny():
    my_uid= session.get('uidval', None)
    name,uidin=getname_patient(my_uid)
    block_access(uidin)
    PIN=read_pin(uidin)
    data=view_data(uidin)
    return render_template('patient_dashboard.html',user_name=name,pin=PIN,deny="ACCESS BLOCKED",uid=uidin,output_data=data)  



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
    val=add_hospital(name,email,phone,reg,login_type,psw,hname)
    if val==1:
        return render_template('hospital.html',userin=True)
    else:
        return render_template('hospital.html',useradded=True)

@app.route('/loginhospital',methods=['POST'])
def login_hospital():
    uid=request.form['username']
    print("yes")
    password=request.form['psw']
    print(uid,password)
    session['uidval_hospital'] = uid
    val=validate_hospital(uid,password,)
    if val==1:
        name,typel,uidin,hname=getname_hospital(uid)
        if typel=="Admin": 
            return render_template("hospital_admin_dashboard.html",user_name=name,admin=True,hname=hname)
        elif typel=="Pharmacy":
            return render_template("pharm_dashboard.html",user_name=name,pharmacy=True,hname=hname)
        elif typel=="Lab":
            return render_template("lab_dashboard.html",user_name=name,lab=True,hname=hname)
    else :
        return render_template("hospital.html",failure=True)
    

@app.route('/admindata',methods=['POST'])
def fetch_data():
    patient_uid=request.form['pid']
    patinet_access=request.form['pcode']
    session['patinet_uid'] = patient_uid
    session['patinet_access'] = patinet_access
    val=check_codes(patient_uid,patinet_access)
    if val==1:
        pname,phone,email,dob=get_basic_data(patient_uid)
        name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
        return render_template("hospital_admin_dashboard.html",user_name=name,hname=hname,access=True,pname=pname,phone=phone,email=email,dob=dob)
    else:
        name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
        return render_template("hospital_admin_dashboard.html",user_name=name,admin=True,hname=hname,failure=True)

@app.route('/pharmdata',methods=['POST'])
def data_pharm():
    patient_uid=request.form['pid']
    patinet_access=request.form['pcode']
    session['patinet_uid'] = patient_uid
    session['patinet_access'] = patinet_access
    val=check_codes(patient_uid,patinet_access)
    if val==1:
        data=pharm_data(patient_uid)
        name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
        return render_template("pharm_dashboard.html",user_name=name,hname=hname,output_data=data)
    else:
        name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
        return render_template("pharm_dashboard.html",user_name=name,pharmacy=True,hname=hname,failure=True)


@app.route('/labdata',methods=['POST'])
def data_lab():
    patient_uid=request.form['pid']
    patinet_access=request.form['pcode']
    session['patinet_uid'] = patient_uid
    session['patinet_access'] = patinet_access
    val=check_codes(patient_uid,patinet_access)
    if val==1:
        name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
        return render_template("lab_dashboard.html",user_name=name,hname=hname,access=True)
    else:
        name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
        return render_template("lab_dashboard.html",user_name=name,lab=True,hname=hname,failure=True)

@app.route('/labdata',methods=['GET'])
def add_data_lab():
    name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
    return render_template("lab_dashboard.html",user_name=name,add=True,hname=hname)

@app.route('/insertdatalab',methods=['POST'])
def insert_data_lab():
    patient_test=request.form['diag']
    patinet_res=request.form['pres']
    name,typel,uidin,hname=getname_hospital(session['uidval_hospital'])
    insert_val_lab(session['patinet_uid'],session['patinet_access'],patient_test,patinet_res,uidin)
    return render_template("lab_dashboard.html",user_name=name,hname=hname,sucess=True)

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