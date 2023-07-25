module Deku.DOM.Attr.OnMousemove where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnMousemove = OnMousemove

instance Deku.Attribute.Attr everything OnMousemove Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onmousemove", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnMousemove
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmousemove", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnMousemoveEffect =
  forall element
   . Deku.Attribute.Attr element OnMousemove (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnMousemove Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmousemove", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnMousemove (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmousemove", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
