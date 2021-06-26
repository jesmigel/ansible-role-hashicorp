.PHONY: address clean conffig down lint login provision status up venv_init roles_init

_VM=time vagrant

address:
	$(call venv_exec,.venv,$(_VM) address)

clean:
	$(call venv_exec,.venv,$(_VM) destroy)
	rm -rf .vagrant

config:
	$(call venv_exec,.venv,$(_VM) validate)

down:
	$(call venv_exec,.venv,$(_VM) suspend)

lint:
	$(call venv_exec,.venv,ansible-lint .)

login:
	$(call venv_exec,.venv,$(_VM) ssh)

provision:
	$(call venv_exec,.venv,$(_VM) provision)

status:
	$(call venv_exec,.venv,$(_VM) status)
	
up:
	$(call venv_exec,.venv,$(_VM) up)

init: venv_init roles_init

venv_init:
	$(call venv_exec,.venv,pip install --upgrade pip)
	$(call venv_exec,.venv,pip install -r requirements.txt)

roles_init:
	mkdir -p roles
	$(call venv_exec,.venv,ansible-galaxy install -r requirements.yaml -p roles)

# VENV FUNCTIONS
define venv_exec
	$(if [ ! -f "$($(1)/bin/activate)" ], python3 -m venv $(1))
	( \
    	source $(1)/bin/activate; \
    	$(2) \
	)
endef
