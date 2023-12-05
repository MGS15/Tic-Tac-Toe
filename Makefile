all: build
	docker run -p 3001:3001 tic-tac-toe

build:
	docker build -t tic-tac-toe