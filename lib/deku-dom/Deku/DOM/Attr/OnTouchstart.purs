module Deku.DOM.Attr.OnTouchstart where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnTouchstart = OnTouchstart

instance Deku.Attribute.Attr everything OnTouchstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onTouchstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTouchstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onTouchstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTouchstartEffect =
  forall element
   . Deku.Attribute.Attr element OnTouchstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTouchstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onTouchstart", value: _ } <<<
    Deku.Attribute.cb'
