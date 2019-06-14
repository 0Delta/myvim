build:
	./install.sh


d-build:
	docker build -t vim-build .

d-run:
	docker run -v ${PWD}/app:/vimapp --rm vim-build
