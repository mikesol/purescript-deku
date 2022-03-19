module Deku.Example.Subgraph where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Typelevel.Num (D40, d9)
import Data.Vec (Vec, fill)
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph (iloop, (@!>))
import Deku.Control.Functions.Subgraph as SG
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (AsSubgraph(..), OnClick(..), Href_(..), XSubgraph(..), a, a'attr, root, subgraph, text, (:=))
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene
  :: WEB.DOM.Element
  -> Scene (TriggeredScene Unit Unit) RunDOM RunEngine Frame0 Unit Unit
scene elt =
  ( \_ push0 ->
      ( icreate $
          root elt
            { hello: a [ Href_ := "#", OnClick := Cb (const $ push0 unit) ]
                { ht: text "click" }
            , helloA: subgraph (fill (const false) :: Vec D40 Boolean)
                ( AsSubgraph \i -> SG.istart
                    ( \_ push ->
                        ( icreate
                            { myA: a
                                [ Href_ := "#"
                                , OnClick := Cb
                                    ( const $ do
                                        push false
                                        when (i == 4) (push0 unit)
                                    )
                                ]
                                { myTxt: text " me " }
                            }
                        )
                    )
                    ( SG.iloop \e push _ ->
                        case e of
                          Left tf -> when tf $ do
                            ichange_ { "myA.myTxt": "banana" }
                          Right tf -> ichange_
                            { "myA": a'attr
                                [ OnClick := Cb (const $ push (not tf)) ]
                            , "myA.myTxt": if tf then " me " else " em "
                            }
                    )
                )
            }
      )
  ) @!> iloop \e _ _ ->
    case e of
      Left _ -> pure unit
      Right _ -> ichange_
        { "root.helloA": XSubgraph { index: d9, env: true }
        }

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
