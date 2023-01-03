from flask import Flask, request, render_template, jsonify, redirect, url_for, flash
import mysql.connector
import time

app = Flask(__name__)

#Database Connection
config = {
        'user': 'root',
        'password': 'root',
        'host': 'db',
        'port': '3306',
        'database': 'clientmanager'
    }

while True:

    try:
        connection=mysql.connector.connect(**config)
        break
    except:
        time.sleep(1)
        print("patata")
        continue

app.secret_key = 'secretkey'

#Routes
    
@app.route('/')
def start():

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Client")
    rows = cursor.fetchall()
    #resp = jsonify(rows)
    #resp.status_code = 200
    #print(resp.data)
    return render_template('index.html',clients=rows)

@app.route('/bills')
def bills():

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Bill")
    rows = cursor.fetchall()
    #resp = jsonify(rows)
    #resp.status_code = 200
    #print(resp.data)
    return render_template('bills.html',bills=rows)

@app.route('/about')
def about():

    #cursor = connection.cursor()
    #cursor.execute("SELECT * FROM clients")
    #rows = cursor.fetchall()
    #resp = jsonify(rows)
    #resp.status_code = 200
    #print(resp.data)
    return render_template('about.html')

@app.route('/getClient/<clientId>', methods=["GET"])
def getClient(clientId):

    cursor = connection.cursor()
    cursor.execute("SELECT * FROM Client")
    rows = cursor.fetchall()
    sql = "SELECT * FROM Client WHERE clientId = (%s)"
    val = [str(clientId)]
    cursor.execute( sql, val)
    client = cursor.fetchone()
    #resp = jsonify(rows)
    #resp.status_code = 200
    #print(resp.data)
    return render_template('index.html',clients=rows, clientSearched=client)

@app.route('/addClients', methods = ['POST'])
def addClients():
    if request.method == 'POST':

        nombre = request.form['nombre']
        direccion = request.form['direccion']
        telefono = request.form['telefono']
        cur = connection.cursor()
        sql = 'INSERT INTO Client (name, direction, phonenumber) VALUES (%s, %s, %s)'
        val = (nombre, direccion, telefono)
        cur.execute( sql, val)
        connection.commit()
        flash("Client Added")

        return redirect(url_for('start'))

@app.route('/updateClients/<id>', methods = ['POST'])
def updateClients(id):
    if request.method == 'POST':

        nombre = request.form['nameForm']
        direccion = request.form['directionForm']
        telefono = request.form['phonenumberForm']
        cur = connection.cursor()
        sql = 'UPDATE Client SET name = %s, direction = %s, phonenumber = %s WHERE id = %s'
        val = (nombre, direccion, telefono, str(id))
        cur.execute( sql, val)
        connection.commit()
        flash("Client Updated")

        return redirect(url_for('getClient',id=str(id)))

@app.route('/deleteClients/<id>', methods = ['POST'])
def deleteClients(id):
    if request.method == 'POST':

        cur = connection.cursor()
        sql = 'DELETE FROM Client WHERE id = (%s)'
        val = [str(id)]
        cur.execute( sql, val)
        connection.commit()
        flash("Client Deleted")

        return redirect(url_for('start'))
        

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
