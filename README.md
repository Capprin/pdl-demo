# pdl-demo
Demonstration of new notification system for PDL. This dry run runs entirely on BASH scripts; it might be improved eventually with dockerizing.

## Dependencies
- Docker
- Java

## Installation
1. Clone this project
2. Run <code>./nats-init.sh start</code> to run an instance of the nats-streaming server
3. Run <code>./init.sh start</code> to run an instance of PDL based on the included <code>config.ini</code> file. Dependent on running nats-streaming instance.
4. Run <code>./ws-init.sh start</code> to run the micronaut forwarding webserver.
5. Open <code>demo.html</code> to watch streaming product notifications out of PDL.
    * Use <code>sequence=INT</code> as a GET query to start the notifications at a specific sequence.
    * The webserver supports concurrent websocket connections, so as many instances of the page can be open as desired.
