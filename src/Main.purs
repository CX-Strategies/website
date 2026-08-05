module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Site as Site
import Web.DOM.Node (setTextContent)
import Web.DOM.ParentNode (QuerySelector(..))
import Web.HTML.HTMLElement as HTMLElement

main :: Effect Unit
main = HA.runHalogenAff do
  HA.awaitLoad
  target <- HA.selectElement (QuerySelector "#app")
  case target of
    Just el -> do
      liftEffect $ setTextContent "" (HTMLElement.toNode el)
      void $ runUI Site.component unit el
    Nothing -> do
      body <- HA.awaitBody
      void $ runUI Site.component unit body
