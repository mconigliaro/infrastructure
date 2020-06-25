VAULT_FILES := group_vars/*/vault.yml

encrypt:
	pipenv run ansible-vault encrypt $(VAULT_FILES)

decrypt:
	pipenv run ansible-vault decrypt $(VAULT_FILES)
