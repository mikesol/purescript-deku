module Deku.DOM.Attr.OnMousedown where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnMousedown = OnMousedown

instance Deku.Attribute.Attr everything OnMousedown Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onmousedown", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnMousedown
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmousedown", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnMousedownEffect =
  forall element
   . Deku.Attribute.Attr element OnMousedown (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnMousedown Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmousedown", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnMousedown (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmousedown", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
