#!/usr/bin/env node -r livescript-transform-implicit-async/register 

require! {
  \config-6du/6du : config
  \sodium-native : sodium
}

do !~>
  pk = Buffer.allocUnsafe(sodium.crypto_sign_PUBLICKEYBYTES)
  sk = Buffer.allocUnsafe(sodium.crypto_sign_SECRETKEYBYTES)
  seed = Buffer.allocUnsafe(sodium.crypto_sign_SEEDBYTES)
  sodium.randombytes_buf(seed, sodium.crypto_sign_SEEDBYTES)
  sodium.crypto_sign_seed_keypair(pk, sk, seed)

  await config.file("key/6du.pk").set pk
  await config.file("key/6du.sk").set sk


