.PHONY: up down ps tf-version fmt-check validate plan-dev apply-dev destroy-dev output state-list smoke

up:
	docker-compose up -d

down:
	docker-compose down

ps:
	docker-compose ps

tf-version:
	docker-compose exec terraform terraform version

fmt-check:
	./terraform/scripts/tf.sh fmt -check

validate:
	./terraform/scripts/tf.sh validate

plan-dev:
	./terraform/scripts/tf.sh plan -var-file=environments/dev/dev.tfvars

apply-dev:
	./terraform/scripts/tf.sh apply -auto-approve -var-file=environments/dev/dev.tfvars

destroy-dev:
	./terraform/scripts/tf.sh destroy -auto-approve -var-file=environments/dev/dev.tfvars

output:
	./terraform/scripts/tf.sh output

state-list:
	./terraform/scripts/tf.sh state list

smoke:
	bash tests/smoke_test.sh
