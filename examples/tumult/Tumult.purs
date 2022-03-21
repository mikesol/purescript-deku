module Deku.Example.Tumult where

import Prelude

import Data.Array ((..))
import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Map as Map
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph (iloop, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (OnClick(..), Href(..), a, root, text, tumult, (:=))
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Deku.Tumult.Make (Indecent(..), indecently, tumultuously)
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
            { hello: a [ Href := "#", OnClick := Cb (const $ push0 unit) ]
                { ht: text "click" }
            , helloTum0: tumult
                ( tumultuously
                    ( Map.fromFoldable
                        (map (\i -> i /\ Just { myTxt: text "foo" }) (0 .. 9))
                    )
                )
            , helloTum1: tumult
                ( indecently
                    ( Map.fromFoldable
                        ( map (\i -> i /\ Just (E "button" [] [ T "foo" ]))
                            (0 .. 9)
                        )
                    )
                )
            }
      ) $> 0
  ) @!> iloop \e _ lmt ->
    lmt + 1 <$ case e of
      Left _ -> pure unit
      Right _ -> ichange_
        { "root.helloTum0":
            ( tumultuously
                ( Map.fromFoldable
                    (map (\i -> i /\ Just { myTxt: text "bar" }) (0 .. 9))
                )
            )
        , "root.helloTum1": indecently
            ( Map.fromFoldable
                ( map
                    ( \i -> i /\
                        if i < lmt `mod` 10 then Nothing
                        else Just (E "button" [] [ T "bar" ])
                    )
                    (0 .. 9)
                )
            )
        }

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      (run (pure unit) (pure unit) defaultOptions ffi (scene b))
      (\_ -> pure unit)
