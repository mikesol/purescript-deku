module Deku.DOM.Attr.OnPointercancel where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnPointercancel = OnPointercancel

instance Deku.Attribute.Attr everything OnPointercancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onPointercancel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointercancel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPointercancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointercancelEffect =
  forall element
   . Deku.Attribute.Attr element OnPointercancel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointercancel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onPointercancel", value: _ } <<<
    Deku.Attribute.cb'
