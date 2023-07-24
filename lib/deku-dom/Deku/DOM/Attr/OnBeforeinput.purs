module Deku.DOM.Attr.OnBeforeinput where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnBeforeinput = OnBeforeinput

instance Deku.Attribute.Attr everything OnBeforeinput Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onBeforeinput", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnBeforeinput
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onBeforeinput", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnBeforeinputEffect =
  forall element
   . Deku.Attribute.Attr element OnBeforeinput (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnBeforeinput Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onBeforeinput", value: _ } <<<
    Deku.Attribute.cb'
