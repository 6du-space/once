#!/usr/bin/env node -r livescript-transform-implicit-async/register 

require! {
  \config-6du/6du : config
  \sodium-6du : sodium
}

do !~>
  [pk, sk] = sodium.pksk!
  await config.file("key/6du.pk").set pk
  await config.file("key/6du.sk").set sk


