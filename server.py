from flask import Flask, request
import sqlite3
import urllib

app = Flask(__name__)

app.route("/save_keys", methods = ["POST"])
def save_keys():
    if request.method == "POST":
        mac_address = urllib.parse.unquote(request.form.get("mac_address"))
        enc_key = urllib.parse.unquote(request.form.get("enc_key"))
        xor_key = urllib.parse.unquote(request.form.get("xor_key"))
        iv = urllib.parse.unquote(request.form.get("iv"))

        con = sqlite3.connect("keys.db")
        cur = con.cursor()
        cur.execute("INSERT INTO keys (mac_address, enc_key, xor_key, iv) VALUES (?,?,?,?)", (mac_address, enc_key, xor_key, iv))
        con.commit()
    return ""


if __name__ == '__main__':
    app.run(debug = False, host = '0.0.0.0', port = 5000)
