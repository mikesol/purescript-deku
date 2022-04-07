module Deku.Example.Docs where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Exists (mkExists)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (deku, flatten, text_)
import Deku.Core (Element, Subgraph, SubgraphF(..))
import Deku.DOM as D
import Deku.Example.Docs.Component as Component
import Deku.Example.Docs.Effects as Effects
import Deku.Example.Docs.Events as Events
import Deku.Example.Docs.HelloWorld as HelloWorld
import Deku.Example.Docs.Intro as Intro
import Deku.Example.Docs.Portals as Portals
import Deku.Example.Docs.Pursx1 as Pursx1
import Deku.Example.Docs.Pursx2 as Pursx2
import Deku.Example.Docs.Subgraphs as Subgraph
import Deku.Example.Docs.Types (Page(..))
import Deku.Interpret (effectfulDOMInterpret, makeFFIDOMSnapshot)
import Deku.Subgraph (SubgraphAction(..), subgraph)
import Effect (Effect)
import FRP.Event (create, keepLatest, mapAccum, subscribe)
import FRP.Event.Phantom (PhantomEvent, proof0, toEvent)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: forall proof payload
   . (Page -> Effect Unit)
  -> PhantomEvent proof Page
  -> Element PhantomEvent proof payload
scene push event =
  flatten
    [ D.div_
        $ map
          ( \(x /\ y /\ z) -> D.span_
              [ D.a
                  ( oneOfMap pure
                      [ D.OnClick := cb (const $ push x)
                      , D.Style := "cursor:pointer;"
                      ]
                  )
                  [ text_ y ]
              , D.span
                  ( pure $ D.Style :=
                      if z then ""
                      else "display:none;"
                  )
                  [ text_ " | " ]
              ]
          )
        $
          [ Intro
              /\ "Home"
              /\ true
          , HelloWorld
              /\ "Hello world"
              /\ true
          , SimpleComponent
              /\ "Component"
              /\ true
          , PURSX1
              /\ "Pursx 1"
              /\ true
          , Events
              /\ "Events"
              /\ true
          , Effects
              /\ "Effects"
              /\ true
          , PURSX2
              /\ "Pursx 2"
              /\ true
          , Subgraph
              /\ "Subgraphs"
              /\ true
          , Portals
              /\ "Portals"
              /\ false
          ]
    , subgraph
        ( mapAccum (\a b -> Just a /\ (b /\ a)) event Nothing
            # map
              ( \(prev /\ cur) ->
                  ( case prev of
                      Nothing -> empty
                      Just x -> pure (x /\ Remove)
                  ) <|> pure (cur /\ InsertOrUpdate unit)
              )
            # keepLatest
        )
        (page push)

    ]
  where
  page :: (Page -> Effect Unit) -> Subgraph Page Unit PhantomEvent payload
  page dpage Intro = mkExists $ SubgraphF \_ _ -> Intro.intro dpage
  page dpage HelloWorld = mkExists $ SubgraphF \_ _ -> HelloWorld.helloWorld
    dpage
  page dpage SimpleComponent = mkExists $ SubgraphF \_ _ -> Component.components
    dpage
  page dpage PURSX1 = mkExists $ SubgraphF \_ _ -> Pursx1.pursx1 dpage
  page dpage Events = mkExists $ SubgraphF \_ _ -> Events.events dpage
  page dpage Effects = mkExists $ SubgraphF \_ _ -> Effects.effects dpage
  page dpage PURSX2 = mkExists $ SubgraphF \_ _ -> Pursx2.pursx2 dpage
  page dpage Subgraph = mkExists $ SubgraphF \_ _ -> Subgraph.subgraphs dpage
  page dpage Portals = mkExists $ SubgraphF \_ _ -> Portals.portals dpage

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    { push, event } <- create
    let evt = deku b (scene push (proof0 event)) effectfulDOMInterpret
    void $ subscribe (toEvent evt) \i -> i ffi
    push Intro