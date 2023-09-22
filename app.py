from flask import Flask, flash, render_template, redirect, url_for, request, session
from flaskext.mysql import MySQL
import re

mysql = MySQL()
app = Flask(__name__)
app.secret_key = '123'

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_DB'] = 'exercise_mysql'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'juliansql123*'
mysql.init_app(app)


def init():
    conn = mysql.connect()
    
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM mahasiswa")
    data = cursor.fetchall()
    
    conn.close()

    return list(data) 

def input_data(nim, nama, jurusan, alamat):
    result = False
    
    conn = mysql.connect()

    try:
        cursor = conn.cursor()
        
        cursor.execute("INSERT INTO mahasiswa (nim, nama, jurusan, alamat) VALUES ("+str(nim)+", \'"+str(nama)+"\', \'"+str(jurusan)+"\', \'"+str(alamat)+"\');")
            
        conn.commit()
        conn.close()
    except:
        conn.close()
        return result
    
    return True

def update_data(nim, nama, jurusan, alamat):
    result = False

    conn = mysql.connect()

    try:
        cursor = conn.cursor()

        cursor.execute("UPDATE mahasiswa SET nama=\'"+str(nama)+"\', jurusan=\'"+str(jurusan)+"\', alamat=\'"+str(alamat)+"\' WHERE nim = "+str(nim)+";")
            
        conn.commit()
        conn.close()
    except:
        conn.close()
        return result
    
    return True

def delete_data(nim):
    result = False

    conn = mysql.connect()

    try:
        cursor = conn.cursor()
        print("DELETE FROM mahasiswa WHERE nim = "+str(nim)+";")
        cursor.execute("DELETE FROM mahasiswa WHERE nim = "+str(nim)+";")
            
        conn.commit()
        conn.close()
    except:
        conn.close()
        return result
    
    return True

@app.route('/')
def index():
    data = init()
    jumlah_data = len(data)

    return render_template('index.html', jumlah_data=jumlah_data, data=data, pesan="")

@app.route('/read', methods=['GET', 'POST'])
def read():
    conn = mysql.connect()
    cursor = conn.cursor()

    if request.method == "POST":
        nim =request.form['nim']
            
        cursor.execute("SELECT * FROM mahasiswa WHERE nim = "+str(nim)+";")
        result = cursor.fetchone()

        if result:
            nim = result[0]
            nama = result[1]
            jurusan = result[2]
            alamat = result[3]
            return render_template('read.html', nim=nim, nama=nama, jurusan=jurusan, alamat=alamat)
        else:
            return render_template('error.html')
    
    conn.close()
    
@app.route('/create', methods=['GET', 'POST'])
def create():
    f_nim = f_nama = f_jurusan = f_alamat = ""
    nim_err = nama_err = jurusan_err = alamat_err = ""
    pesan = ""

    if request.method == "POST":
        f_nim = request.form['f_nim']
        f_nama = request.form['f_nama']
        f_jurusan = request.form['f_jurusan']
        f_alamat = request.form['f_alamat']

        if not f_nim:
            nim_err = "Silahkan masukkan NIM"
        elif not f_nim.isdigit():
            nim_err = "Silahkan masukkan NIM yang VALID"

        if not f_nama:
            nama_err = "Silahkan masukkan Nama"
        elif not re.match("^[a-zA-Z\s]+$", f_nama):
            nama_err = "Silahkan masukkan Nama yang VALID"
        
        if not f_jurusan:
            jurusan_err = "Silahkan masukkan Jurusan"
        elif not re.match("^[a-zA-Z\s]+$", f_jurusan):
            jurusan_err = "Silahkan masukkan Jurusan yang VALID"

        if not f_alamat:
            alamat_err = "Silahkan masukkan Alamat"

        if not nim_err and not nama_err and not jurusan_err and not alamat_err:
            status = input_data(f_nim, f_nama, f_jurusan, f_alamat)
            if status:
                pesan="Data Berhasil Ditambahkan"
            else:
                pesan="ERROR"

    data = init()
    jumlah_data = len(data)

    return render_template('create.html', f_nim=f_nim, f_nama=f_nama, f_jurusan=f_jurusan, f_alamat=f_alamat,
                            nim_err=nim_err, nama_err=nama_err, jurusan_err=jurusan_err, alamat_err=alamat_err,
                            jumlah_data=jumlah_data, data=data, pesan=pesan)

@app.route('/update_2', methods=['GET', 'POST'])
def update_2():
    conn = mysql.connect()
    cursor = conn.cursor()

    if request.method == "POST":
        nim =request.form['nim']
            
        cursor.execute("SELECT * FROM mahasiswa WHERE nim = "+str(nim)+";")
        result = cursor.fetchone()

        if result:
            nim = result[0]
            nama = result[1]
            jurusan = result[2]
            alamat = result[3]
            return render_template('update_2.html', nim=nim, nama=nama, jurusan=jurusan, alamat=alamat)
        else:
            return render_template('error.html')
    
    conn.close()

@app.route('/update_2_execute', methods=['GET', 'POST'])
def update_2_execute():
    conn = mysql.connect()
    cursor = conn.cursor()

    if request.method == "POST":
        print(1)
        nim =request.form['nim']
        print(2)
        nama =request.form['nama']
        print(3)
        jurusan =request.form['jurusan']
        print(4)
        alamat =request.form['alamat']

        print(5)
        #return nim+nama+jurusan+alamat
        try:
            print("UPDATE mahasiswa SET nama=\'"+str(nama)+"\', jurusan=\'"+str(jurusan)+"\', alamat=\'"+str(alamat)+"\' WHERE nim = "+str(nim)+";")
            cursor.execute("UPDATE mahasiswa SET nama=\'"+str(nama)+"\', jurusan=\'"+str(jurusan)+"\', alamat=\'"+str(alamat)+"\' WHERE nim = "+str(nim)+";")
            conn.commit()
            conn.close()

            data = init()
            jumlah_data = len(data)
            pesan = "Data Berhasil Diupdate"
            return render_template('index.html', jumlah_data=jumlah_data, data=data, pesan=pesan)
        except:
            conn.close()

            return render_template('error.html')

@app.route('/delete', methods=["POST"])
def delete():
    print(1)
    nim =request.form['nim']
    print(2)
    status = delete_data(nim)
    print(3)
    if status:
        pesan="Data Berhasil Dihapus"
    else:
        pesan="Error"

    data = init()
    jumlah_data = len(data)
    print(4)

    return render_template('index.html', jumlah_data=jumlah_data, data=data, pesan=pesan)