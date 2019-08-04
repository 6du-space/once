#!/usr/bin/env node -r livescript-transform-implicit-async/register 

require! {
  \tweetnacl : nacl
  \config-6du/6du : config
}

do !~>
  {publicKey, secretKey} = nacl.sign.keyPair()

  await config.file("key/6du.pub", publicKey)
  await config.file("key/6du.sec", secretKey)


