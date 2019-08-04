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
  sec = await read("sec")
  msg = Buffer.from \tes323232t
  sign = nacl.sign(msg, sec)
  console.log sign
  pub = await read("pub")
  console.log Buffer.from(nacl.sign.open(sign, pub)).toString()

  o = nacl.sign.keyPair!
  sign = nacl.sign(msg, o.secretKey)
  console.log nacl.sign.open(sign, pub)
	# console.log sign

