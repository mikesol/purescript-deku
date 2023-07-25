module Deku.DOM.Attr.OnMouseup where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnMouseup = OnMouseup

instance Deku.Attribute.Attr everything OnMouseup Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onmouseup", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnMouseup
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseup", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnMouseupEffect =
  forall element
   . Deku.Attribute.Attr element OnMouseup (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnMouseup Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseup", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnMouseup (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseup", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
