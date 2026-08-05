module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Site as Site
import Web.DOM.ParentNode (QuerySelector(..))

main :: Effect Unit
main = HA.runHalogenAff do
  HA.awaitLoad
  target <- HA.selectElement (QuerySelector "#app")
  case target of
    Just el -> void $ runUI Site.component unit el
    Nothing -> do
      body <- HA.awaitBody
      void $ runUI Site.component unit body
