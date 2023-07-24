module Deku.DOM.Attr.OnMouseover where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnMouseover = OnMouseover

instance Deku.Attribute.Attr everything OnMouseover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onMouseover", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnMouseover
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onMouseover", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnMouseoverEffect =
  forall element
   . Deku.Attribute.Attr element OnMouseover (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnMouseover Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onMouseover", value: _ } <<<
    Deku.Attribute.cb'
