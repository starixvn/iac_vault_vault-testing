#!/usr/bin/env bash

duration=$1
write_del_test_num=${2:=10000}


# Run read test in background
# Make sure that the secrets already exist in Vault before running this test
# You can use write-secrets.lua (after some modification) to populate them
nohup wrk -t4 -c16 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s read-secrets.lua https://vault.nexdev.net -- 100000 false > results/prod-test-read-100000-random-secrets-t4-c16-15mins.log &

# Run list test in background
# Make sure that the secrets already exist in Vault before running this test
# You can use write-secrets.lua (after some modification) to populate them
nohup wrk -t1 -c2 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s list-secrets.lua https://vault.nexdev.net -- false > results/prod-test-list-secrets-t1-c2-15mins.log &

# Run authentication/revocation test in background
nohup wrk -t1 -c16 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s authenticate-and-revoke.lua https://vault.nexdev.net > results/prod-test-authenticate-revoke-t1-c16-15mins.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 0 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test0.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 1 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test1.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 2 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test2.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 3 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test3.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 4 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test4.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 5 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test5.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 6 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test6.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 7 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test7.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 8 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test8.log &

# Run write/delete test in background
nohup wrk -t1 -c1 -d$duration -H "X-Vault-Token: $VAULT_TOKEN" -s write-delete-secrets.lua https://vault.nexdev.net -- 9 $write_del_test_num > results/prod-test-write-and-delete-secrets-t1-c1-${duration}-test9.log &