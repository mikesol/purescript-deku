module Deku.DOM.Attr.OnPointerenter where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPointerenter = OnPointerenter

instance Deku.Attribute.Attr everything OnPointerenter Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerenter", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerenter
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerenter", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointerenterEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerenter (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerenter Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerenter", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPointerenter (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerenter", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
