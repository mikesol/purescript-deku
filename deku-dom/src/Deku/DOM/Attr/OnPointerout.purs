module Deku.DOM.Attr.OnPointerout where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPointerout = OnPointerout

instance Deku.Attribute.Attr everything OnPointerout Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerout", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerout
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerout", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointeroutEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerout (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerout Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerout", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPointerout (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerout", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
