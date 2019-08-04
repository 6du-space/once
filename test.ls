#!/usr/bin/env node -r livescript-transform-implicit-async/register 

require! <[
  path
]>

require! {
  \tweetnacl : nacl
  \config-6du/6du : config
  \fs-extra : fs
}

read = (name)~>
  fs.readFile(
    path.join(
      __dirname, "../private/key/6du.#name"
    )
  )


do !~>
  sec = await read(\sec)
  pub = await read(\pub)
  sec = sec.buffer.slice(sec.byteOffset, sec.byteOffset+sec.byteLength)
  message = \test
  sign = nacl.sign(message, sec)
  console.log sign


