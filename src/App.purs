module App where

import Prelude

import Widget (Widget, client, el, text)
import StaticPtr (static)

app :: Widget Unit
app =
  el "html" do
    el "head" do
      text "<meta charset=utf-8>"
    el "body" do
      el "h1" $ text "This is rendered server side"
      client $ static do
        el "h2" do
          text "This is rendered client side"
      el "p" $ text "This is after client side stuff"
      client $ static do
        el "p" do
          client2

      text "<script src=client.js></script>"

client2 :: Widget Unit
client2 = do
  text "This is another thing rendered client side"
  client $ static do
    el "br" (pure unit)
    text "and works when nested"
