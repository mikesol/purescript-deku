module Deku.DOM.Attr.OnPointerover where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnPointerover = OnPointerover

instance Deku.Attribute.Attr everything OnPointerover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onPointerover", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerover
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPointerover", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointeroverEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerover (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerover Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPointerover", value: _ } <<<
    Deku.Attribute.cb'
