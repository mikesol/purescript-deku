module Deku.DOM.Attr.OnPointerout where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnPointerout = OnPointerout

instance Deku.Attribute.Attr everything OnPointerout Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onPointerout", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerout
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPointerout", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointeroutEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerout (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerout Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPointerout", value: _ } <<<
    Deku.Attribute.cb'
