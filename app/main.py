from flask import Flask, jsonify
import os

app = Flask(__name__)

VERSION = os.getenv("APP_VERSION", "v1")

@app.route("/")
def home():
    return jsonify({
        "application": "CloudForge",
        "version": VERSION,
        "status": "healthy"
    })

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

@app.route("/version")
def version():
    return jsonify({"version": VERSION}), 200
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
