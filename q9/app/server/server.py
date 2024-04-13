from flask import Flask
from prometheus_client import Counter, Histogram, generate_latest, CONTENT_TYPE_LATEST
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from prometheus_client import make_wsgi_app
import time

app = Flask(__name__)

REQUEST_COUNT = Counter('q9_http_requests_total', 'Total HTTP Requests', ['method', 'endpoint', 'http_status'])
REQUEST_LATENCY = Histogram('q9_http_request_latency_seconds', 'HTTP request latency', ['method', 'endpoint'])

@app.route('/hello')
def hello():
    start_time = time.time()
    # Increment the request counter
    REQUEST_COUNT.labels(method='GET', endpoint='/hello', http_status='200').inc()
    
    # Simulate some work
    time.sleep(0.5)
    
    # Measure the latency of the request
    latency = time.time() - start_time
    REQUEST_LATENCY.labels(method='GET', endpoint='/hello').observe(latency)
    
    return 'Hello, World!'

@app.route('/metrics')
def metrics():
    return generate_latest()

app.wsgi_app = DispatcherMiddleware(app.wsgi_app, {
    '/metrics': make_wsgi_app()
})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
