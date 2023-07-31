module Deku.DOM.Attr.OnPointerleave where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPointerleave = OnPointerleave

instance Deku.Attribute.Attr everything OnPointerleave Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerleave", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerleave
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerleave", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointerleaveEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerleave (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerleave Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerleave", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPointerleave (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerleave", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
