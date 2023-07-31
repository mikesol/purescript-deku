module Deku.DOM.Attr.OnTouchcancel where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTouchcancel = OnTouchcancel

instance Deku.Attribute.Attr everything OnTouchcancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ontouchcancel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTouchcancel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontouchcancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTouchcancelEffect =
  forall element
   . Deku.Attribute.Attr element OnTouchcancel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTouchcancel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontouchcancel", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTouchcancel (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontouchcancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
