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
  console.log await read(\sec)
  console.log await read(\pub)


